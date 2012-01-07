//
//  Question.h
//  Lustiges Bilderraten
//
//  Created by Sarah Bechtle on 07.01.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Painting.h"
#import "Hints.h"

@interface Question : NSObject {
    Painting* painting;
    Hints* hint;
    int points;
}

-(void) generateAnswerPossibilities;
-(NSString*) generateHints;
-(void) giveAnswer: (id) sender andPoints: (int) point;

@end
