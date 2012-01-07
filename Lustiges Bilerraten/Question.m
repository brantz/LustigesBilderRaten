//
//  Question.m
//  Lustiges Bilderraten
//
//  Created by Sarah Bechtle on 07.01.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Question.h"

@implementation Question


-(void) generateAnswerPossibilities {

}
-(NSString*) generateHints{
    self->hint = [[Hints alloc] initHintWithPainting:self->painting];
    
    return [hint generateHint];
}
-(void) giveAnswer: (id) sender andPoints: (int) point {
    
}

@end
