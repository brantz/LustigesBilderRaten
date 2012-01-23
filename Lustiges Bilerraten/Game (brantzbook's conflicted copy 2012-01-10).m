//
//  Game.m
//  Lustiges Bilderraten
//
//  Created by Sarah Bechtle on 07.01.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Game.h"

@implementation Game
@synthesize myPainting;

-(Game*) initGameWithPic: (UIImage*) pic {
    myGallery = [[MyGallery alloc]init];
    self->totalPoints=0;
    self->picture=pic;
    [self findPainting  ];
    [self newQuestionOfPainting];
    return self;
}

-(void) findPainting{
    myPainting = [[Painting alloc] initPaintingWithFoto:picture];
    [myGallery addPainting:myPainting];
}
-(void) quitGame {
    
}
-(Question*) newQuestionOfPainting{
    question = [[Question alloc]initQuestionWith:myPainting];
    return question;
}

-(void) nextRound: (int)points andFoto:(UIImage*) foto{
    self->totalPoints = self->totalPoints+points;
    self->picture = foto;
    [self findPainting];
    [self newQuestionOfPainting];
}
@end
