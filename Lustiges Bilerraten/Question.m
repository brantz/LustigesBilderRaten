//
//  Question.m
//  Lustiges Bilderraten
//
//  Created by Sarah Bechtle on 07.01.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Question.h"

@implementation Question
@synthesize answerPossibilities, answer;

-(Question*) initQuestionWith: (Painting*) paint{
    self->painting = paint;
    self->allAnswer = [NSArray arrayWithObjects:@"Abstrakte Malerei",@"Abstrakter Expressionismus",@"Barock",@"Dadaismus",@"Expressionismus",@"Fauvismus, die Fauves",@"Futurismus",@"Gotik & Gotische Malerei",@"Impressionismus",@"Jugendstil",@"Konstruktivismus",@"Kubismus",@"Manierismus",@"Naive Malerei",@"Naturalismus",@"Neoplastizismus",@"Neue Figuration",@"Neue Sachlichkeit",@"opart op art",@"Orphismus",@"Pop Art  ",@"Realismus",@"Renaicance",@"Rokoko",@"Romanik & romanische Malerei",@"Romantik",@"Surrealismus",@"Symbolismus",nil];
    [self generateAnswerPossibilities];
    [self generateHints];
    return self;
}


-(void) generateAnswerPossibilities {
    rightAnswer = painting.styleOfPainting.styleName;
    int first = rand() % allAnswer.count;
    int second = rand() % allAnswer.count;
    
    while(first == second || ([[allAnswer objectAtIndex:first] isEqualToString:rightAnswer] ||[[allAnswer objectAtIndex:second] isEqualToString:rightAnswer])) {
        first = rand() % allAnswer.count;
        second = rand() % allAnswer.count;
    }
   
        answerPossibilities = [NSArray arrayWithObjects:rightAnswer,[allAnswer objectAtIndex:first],[allAnswer objectAtIndex:second], nil];
    
}
-(NSString*) generateHints{
    hint = [[Hints alloc] initHintWithPainting:painting];
    return [hint generateHint];
}

-(void) giveAnswer: (NSString*) answr andPoints: (int) point {

    if([answr isEqualToString:rightAnswer]){
        answer = [[Answer alloc]initWithAnswer:YES andPainting:painting andPoints:point ];
    } else {
        answer = [[Answer alloc]initWithAnswer:NO andPainting:painting andPoints: point ];   
    }
    
}

@end
