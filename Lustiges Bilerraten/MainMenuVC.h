//
//  MainMenuVC.h
//  Lustiges Bilderraten
//
//  Created by Raphael Teßmer on 06.01.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyGalleryTableVC.h"
#import "Game.h"
    
@interface MainMenuVC : UIViewController
{
    BOOL gameIsRunning;
}

@property (nonatomic, strong) Game* myGame;

- (IBAction)goToManual:(id)sender;

@end
