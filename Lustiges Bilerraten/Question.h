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
#import "Answer.h"

@interface Question : NSObject {
    Answer* answer;
    Painting* painting;
    Hints* hint;
    NSArray* answerPossibilities;
    NSArray* allAnswer;
    NSString* rightAnswer;
}

@property(nonatomic,strong) NSArray* answerPossibilities;

-(Question*) initQuestionWith: (Painting*) paint;
-(void) generateAnswerPossibilities;
-(NSString*) generateHints;
-(void) giveAnswer: (NSString*) answr andPoints: (int) point;

@end
