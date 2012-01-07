//
//  Game.m
//  Lustiges Bilderraten
//
//  Created by Sarah Bechtle on 07.01.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Game.h"

@implementation Game
@synthesize painting;


-(void) setPainting:(UIImage*) foto {
    self->picture = foto;
    // die Klasse Painting instanziieren und dann der Variable Painting das richtige gemaelde geben
}
-(void) quitGame {
    
}
-(Question*) newQuestionOfPainting:(Painting*) painting{
    Question* question;
    
    //frage erstellen anhand von gemaelde
    return question;
}

-(void) nextRound: (int)points andFoto:(UIImage*) foto{
    self->totalPoints = self->totalPoints+points;
    self->picture = foto;
    [self setPainting:foto];
}
@end
