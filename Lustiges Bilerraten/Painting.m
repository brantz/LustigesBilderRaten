//
//  Painting.m
//  Lustiges Bilderraten
//
//  Created by Sarah Bechtle on 07.01.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Painting.h"
#import "ReverseImageSearch.h"

@implementation Painting
{
	NSMutableArray *pArtist;
	NSMutableArray *pName;
	NSMutableArray *pArtStyle;
	NSMutableArray *pYear;
}

@synthesize nameOfPainting,styleOfPainting,artist,picture,year,paintingIsInDB;


- (Painting*) initPaintingWithFoto: (UIImage*) foto
{
    self->picture = foto;
    [self findPaintingName: foto];
    return self;
}

- (Painting*) initPaintingWithName:(NSString*) name andPic: (UIImage*) pic
{
    self.nameOfPainting = name;
    self.picture = pic;
   [self readPaintingFromDB];
    return self;
}

-(void) findPaintingName: (UIImage*) foto
{	
	ReverseImageSearch* searchEngine = [ReverseImageSearch alloc];
	self.nameOfPainting = [searchEngine getInfoOnImage:foto];
    [self readPaintingFromDB];
    
}

-(void) initFromDataBase:(NSString*) myArtist andStyle: (NSString*) myStyle andYear: (NSString*) myYear
{
    self.artist = myArtist;
    self.year = myYear;
    [self findStyleOfPainting:myStyle];
}


//TODO Kuststil setzen 
-(void) findStyleOfPainting:(NSString*)style{
    styleOfPainting = [[ArtStyle alloc] initArtStyleWithName:style];
    
}


- (void) readPaintingFromDB
{
    PEMAppDelegate *appDelegate = (PEMAppDelegate *)[[UIApplication sharedApplication] delegate];
    NSString* databasePath = appDelegate.databasePath;
    sqlite3 *database;
    paintingIsInDB=false;
    // Open the database from the users filessytem
	if(sqlite3_open([databasePath UTF8String], &database) == SQLITE_OK && self.nameOfPainting.length!=0)
	{
		// Setup the SQL Statement and compile it for faster access
		NSMutableString* sqlStatement = [[NSMutableString alloc] initWithString:@"SELECT DISTINCT * FROM paintings WHERE id = (SELECT DISTINCT referenced_painting FROM query_results WHERE UPPER(name) LIKE UPPER('%%"];
		NSArray* imageNameArray = [self.nameOfPainting componentsSeparatedByString:@" "];
		BOOL firstOne = YES;
		for (NSMutableString *s in imageNameArray)
		{
			if (s.length > 4)
			{
				if (!firstOne) [sqlStatement appendString:@" OR UPPER(name) LIKE UPPER('%%"];
				firstOne = NO;
				[sqlStatement appendString:s];
				[sqlStatement appendString:@"%%')"];
			}
		}
		[sqlStatement appendString:@")"];
		NSLog(@"SQL STATEMENT: %@", sqlStatement);
		sqlite3_stmt *compiledStatement;
        
        if(sqlite3_prepare_v2(database, [sqlStatement UTF8String], -1, &compiledStatement, NULL) == SQLITE_OK)
		{
			int counter = 0;
            while(sqlite3_step(compiledStatement) == SQLITE_ROW)
			{
				// Read the data from the result row
                paintingIsInDB=true;
				NSString *pNameTemp = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 1)];
				NSString *pArtistTemp = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 2)];
				NSString *pArtStyleTemp = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 3)];
				NSString *pYearTemp = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 4)];
				[pName addObject:pNameTemp];
				[pArtist addObject:pArtistTemp];
				[pArtStyle addObject:pArtStyleTemp];
				[pYear addObject:pYearTemp];
				
				counter++;
            }
            if (counter > 1)
			{
				NSLog(@"FOUND MORE THAN 1 MATCHING PAINTING");
			}
			else
			{
				[self initFromDataBase:[pArtist objectAtIndex:1] andStyle:[pArtStyle objectAtIndex:1]  andYear:[pYear objectAtIndex:1]];
			}
			
			//in case no matching painting was found in the library
            if(!paintingIsInDB)
			{
                NSLog(@"Match not found, try again");
            }
        }
		else
		{
            NSLog(@"%s", sqlite3_errmsg(database));
		}
        // Release the compiled statement from memory
		sqlite3_finalize(compiledStatement);
    }
    sqlite3_close(database);
}

@end
