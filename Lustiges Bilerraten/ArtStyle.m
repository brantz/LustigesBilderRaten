//
//  ArtStyle.m
//  Lustiges Bilderraten
//
//  Created by Sarah Bechtle on 07.01.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ArtStyle.h"

@implementation ArtStyle
@synthesize styleName,moreInfoLink,infoText,shortText;

- (ArtStyle*) initArtStyleWithName: (NSString*) style{
    self->styleName=style;
    [self readStyleFromDB];
    return self;
}


-(void)initFromDataBase:(NSString*) link andText: (NSString*) text andShortText: (NSString*) shortT {
    self.moreInfoLink = link;
    self.infoText = text;
    self.shortText = shortT;
    NSLog(@"styyllll %@,%@,%@",self.moreInfoLink,self.infoText,self.shortText);
}

- (void) readStyleFromDB{
    
    PEMAppDelegate *appDelegate = (PEMAppDelegate *)[[UIApplication sharedApplication] delegate];
    NSLog(@"style %@",self.styleName);
    NSString* databasePath = appDelegate.databasePath;
    NSLog(@"databaseinPainting %@",databasePath);
    sqlite3 *database;
    
    // Open the database from the users filessytem
	if(sqlite3_open([databasePath UTF8String], &database) == SQLITE_OK) {
		// Setup the SQL Statement and compile it for faster access
        
        NSString* sqlStatement = [NSString stringWithFormat:@"SELECT * FROM artStyle WHERE name='%@'",self.styleName];
        NSLog(@"%@",sqlStatement);
		sqlite3_stmt *compiledStatement;
        
        if(sqlite3_prepare_v2(database, [sqlStatement UTF8String], -1, &compiledStatement, NULL) == SQLITE_OK) {
            while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
				// Read the data from the result row
				NSString *sLink = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 2)];
				NSString *sShortText = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 3)];
				NSString *sInfoText = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 4)];
                
                [self initFromDataBase:sLink andText:sInfoText andShortText:sShortText];
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
