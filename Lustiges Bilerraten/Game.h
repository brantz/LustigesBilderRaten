//
//  Game.h
//  Lustiges Bilderraten
//
//  Created by Sarah Bechtle on 07.01.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Painting.h"
#import "Question.h"

@interface Game : NSObject {
    Painting* painting;
    int totalPoints;
    UIImage* picture;
}

@property(nonatomic,strong) Painting* painting;

-(void) setPainting:(UIImage*) foto;
-(void) quitGame;
-(Question*) newQuestionOfPainting:(Painting*) painting;
-(void) nextRound: (int) points andFoto:(UIImage*) foto ; 

@end
