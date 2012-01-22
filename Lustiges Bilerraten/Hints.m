//
//  Hints.m
//  Lustiges Bilderraten
//
//  Created by Sarah Bechtle on 07.01.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Hints.h"

@implementation Hints

-(Hints*) initHintWithPainting:(Painting*) paint {
    self->painting = paint;
    [self readHintFromDB];
    return self;
}

- (void) setHints:(NSString*) hints{
    hint = [hints componentsSeparatedByString:@";"];
}

-(NSString*) generateHint {
    int i = rand() % 3;
    return [hint objectAtIndex:i];    
}

-(void) readHintFromDB {
    
    PEMAppDelegate *appDelegate = (PEMAppDelegate *)[[UIApplication sharedApplication] delegate];
    NSLog(@"style %@",painting.styleOfPainting.styleName);
    NSString* databasePath = appDelegate.databasePath;
    sqlite3 *database;
    
    // Open the database from the users filessytem
	if(sqlite3_open([databasePath UTF8String], &database) == SQLITE_OK) {
		// Setup the SQL Statement and compile it for faster access
        
        NSString* sqlStatement = [NSString stringWithFormat:@"SELECT * FROM artStyle WHERE name='%@'",painting.styleOfPainting.styleName];
		sqlite3_stmt *compiledStatement;
        
        if(sqlite3_prepare_v2(database, [sqlStatement UTF8String], -1, &compiledStatement, NULL) == SQLITE_OK) {
            while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
				// Read the data from the result row
				NSString *hHint = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 5)];
                
                [self setHints:hHint];
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
