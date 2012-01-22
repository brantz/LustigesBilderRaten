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
@synthesize nameOfPainting,styleOfPainting,artist,picture,year;


- (Painting*) initPaintingWithFoto: (UIImage*) foto {
    self->picture = foto;
    [self findPaintingName: foto];
    return self;
}

- (Painting*) initPaintingWithName:(NSString*) name andPic: (UIImage*) pic {
    self.nameOfPainting = name;
    self.picture = pic;
   [self readPaintingFromDB];
    return self;
}

//TODO Name des Bildes muss gesetzt werden
-(void) findPaintingName: (UIImage*) foto {	
	ReverseImageSearch* searchEngine = [ReverseImageSearch alloc];
	self.nameOfPainting = [searchEngine getInfoOnImage:foto];
    [self readPaintingFromDB];
    
}

-(void) initFromDataBase:(NSString*) myArtist andStyle: (NSString*) myStyle andYear: (NSString*) myYear {
    self.artist = myArtist;
    self.year = myYear;
    [self findStyleOfPainting:myStyle];
}


//TODO Kuststil setzen 
-(void) findStyleOfPainting:(NSString*)style{
    styleOfPainting = [[ArtStyle alloc] initArtStyleWithName:style];
    
}


- (void) readPaintingFromDB{
    
    PEMAppDelegate *appDelegate = (PEMAppDelegate *)[[UIApplication sharedApplication] delegate];
   // NSString* paintingName = self.nameOfPainting;
    NSString* databasePath = appDelegate.databasePath;
    sqlite3 *database;
    
    // Open the database from the users filessytem
	if(sqlite3_open([databasePath UTF8String], &database) == SQLITE_OK) {
		// Setup the SQL Statement and compile it for faster access
        
        NSString* sqlStatement = [NSString stringWithFormat:@"SELECT DISTINCT * FROM paintings WHERE id = (SELECT DISTINCT referenced_painting FROM query_results WHERE UPPER(name) LIKE UPPER('%%%@%%'))", self.nameOfPainting];
		sqlite3_stmt *compiledStatement;
        
        if(sqlite3_prepare_v2(database, [sqlStatement UTF8String], -1, &compiledStatement, NULL) == SQLITE_OK) {
            while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
				NSLog(@"Entering while block");
				// Read the data from the result row
				NSString *pArtist = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 2)];
				NSString *pArtStyle = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 3)];
				NSString *pYear = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 4)];
                NSLog(@"Found Artist: %@", pArtist);
				NSLog(@"Found ArtStyle: %@", pArtStyle);
				NSLog(@"Found Year: %@", pYear);
				
                [self initFromDataBase:pArtist andStyle:pArtStyle andYear:pYear];
            }
            
            
        } else {
            NSLog(@"%s", sqlite3_errmsg(database));
		}
        
        // Release the compiled statement from memory
		sqlite3_finalize(compiledStatement);
        
    }
    
    sqlite3_close(database);
}

@end
