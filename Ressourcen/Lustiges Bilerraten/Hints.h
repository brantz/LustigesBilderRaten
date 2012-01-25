//
//  Hints.h
//  Lustiges Bilderraten
//
//  Created by Sarah Bechtle on 07.01.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Painting.h"
#import <sqlite3.h>
#import "PEMAppDelegate.h"

@interface Hints : NSObject {
    Painting* painting;
    NSArray* hint;
}

-(NSString*) generateHint;
- (Hints*) initHintWithPainting:(Painting*) paint;
- (void) readHintFromDB;
- (void) setHints:(NSString*) hints;
@end
