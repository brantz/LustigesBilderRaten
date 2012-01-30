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
    MyGallery* myGallery;
}

@property (nonatomic,strong) Painting* myPainting;
@property (nonatomic, strong) NSMutableSet* paintingsAlreadyPlayed;
@property int totalPoints;
@property (nonatomic, strong) Question* question;
@property (nonatomic, strong) MyGallery* myGallery;
@property Boolean paintingAlreadyPlayed;

-(Game*) initGameWithPic: (UIImage*) pic;
-(void) findPainting;
-(void) quitGame;
-(Question*) newQuestionOfPainting;
-(void) nextRound: (int) points andFoto:(UIImage*) foto ; 
-(void) getPaintingsFromCoreData;

@end
