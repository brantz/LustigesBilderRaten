//
//  Question.m
//  Lustiges Bilderraten
//
//  Created by Sarah Bechtle on 07.01.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Question.h"

@implementation Question
@synthesize answerPossibilities;

-(Question*) initQuestionWith: (Painting*) paint{
    self->painting = paint;
    self->allAnswer = [NSArray arrayWithObjects:@"Abstrakte Malerei",@"Abstrakter Expressionismus",@"Barock",@"Dadaismus",@"Expressionismus",@"Fauvismus, die Fauves",@"Futurismus",@"Gotik & Gotische Malerei",@"Impressionismus",@"Jugendstil",@"Konstruktivismus",@"Kubismus",@"Manierismus",@"Naive Malerei",@"Naturalismus",@"Neoplastizismus",@"Neue Figuration",@"Neue Sachlichkeit",@"opart op art",@"Orphismus",@"Pop Art Popart",@"Realismus",@"Renaicance",@"Rokoko",@"Romanik & romanische Malerei",@"Romantik",@"Surrealismus",@"Symbolismus",nil];
    [self generateAnswerPossibilities];
    [self generateHints];
    return self;
}


-(void) generateAnswerPossibilities {
    self->rightAnswer = self->painting.styleOfPainting.styleName;
    int first = rand() % self->allAnswer.count;
    int second = rand() % self->allAnswer.count;
    
    while(first == second) {
        first = rand() % self->allAnswer.count;
        second = rand() % self->allAnswer.count;
    }
   
        self->answerPossibilities = [NSArray arrayWithObjects:rightAnswer,[self->allAnswer objectAtIndex:first],[self->allAnswer objectAtIndex:second], nil];
    
}
-(NSString*) generateHints{
    self->hint = [[Hints alloc] initHintWithPainting:self->painting];
    return [hint generateHint];
}

-(void) giveAnswer: (NSString*) answr andPoints: (int) point {

    if([answr isEqualToString:self->rightAnswer]){
        self->answer = [[Answer alloc]initWithAnswer:YES andPainting:self->painting andPoints:point ];
    } else {
        self->answer = [[Answer alloc]initWithAnswer:NO andPainting:self->painting andPoints: point ];   
    }
    
}

@end
