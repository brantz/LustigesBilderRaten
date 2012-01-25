//
//  MyGalleryTableVC.h
//  Lustiges Bilderraten
//
//  Created by Raphael Teßmer on 07.01.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Game.h"

@interface MyGalleryTableVC : UITableViewController{
    
    NSTimer* timer;
    float duration;
    
    NSMutableDictionary* styleArtDic;
}

@property (nonatomic, strong) Game* myGame;

@end
