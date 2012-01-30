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
    
    NSMutableArray* styleArtDic;
    NSMutableDictionary* rowDic;
    NSMutableDictionary* rowIndexDic;
    NSMutableArray* rowsWithStyle;
	UINavigationBar* navBar;
    ArtStyle* tempArtStyle;
    
}

@property (nonatomic, strong) Game* myGame;

- (NSMutableArray*) arrayMagic: (NSMutableArray*) inputArray;
- (void) showWebView;
- (IBAction)backToGame;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *back;
- (IBAction)back:(id)sender;

@end
