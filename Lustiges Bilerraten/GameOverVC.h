//
//  GameOverVC.h
//  Lustiges Bilderraten
//
//  Created by Raphael Teßmer on 08.01.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Game.h"

@interface GameOverVC : UIViewController{
    IBOutlet UILabel* pointsLabel;
}

@property (nonatomic, strong) Game* myGame;
@property int pointsOverall;

- (IBAction)mainMenuPushed;


@end
