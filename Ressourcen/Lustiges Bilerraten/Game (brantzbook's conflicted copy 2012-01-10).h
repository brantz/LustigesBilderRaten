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
#import "MyGallery.h"

@interface Game : NSObject {
    Painting* myPainting;
    int totalPoints;
    UIImage* picture;
    Question* question;
    MyGallery* myGallery;
}

@property(nonatomic,strong) Painting* myPainting;

-(Game*) initGameWithPic: (UIImage*) pic;
-(void) findPainting;
-(void) quitGame;
-(Question*) newQuestionOfPainting;
-(void) nextRound: (int) points andFoto:(UIImage*) foto ; 

@end
