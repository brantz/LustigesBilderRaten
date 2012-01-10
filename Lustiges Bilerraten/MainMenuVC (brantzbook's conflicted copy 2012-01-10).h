//
//  MainMenuVC.h
//  Lustiges Bilderraten
//
//  Created by Raphael Teßmer on 06.01.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyGalleryTableVC.h"
    
@interface MainMenuVC : UIViewController{
    MyGalleryTableVC* myGalleryTable;
}

- (IBAction)pushedGalleryButton;

@end
