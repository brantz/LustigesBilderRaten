//
//  ConclusionVC.h
//  Lustiges Bilderraten
//
//  Created by Raphael Teßmer on 08.01.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConclusionVC : UIViewController <UIActionSheetDelegate>{
    //View elements
    IBOutlet UILabel* wrongLabel;
    IBOutlet UILabel* rightLabel;
    //All the stars
    IBOutlet UIImageView* star1;
    IBOutlet UIImageView* star2;
    IBOutlet UIImageView* star3;
    IBOutlet UIImageView* star4;
    IBOutlet UIImageView* star5;
    
    IBOutlet UILabel* rightAnswerLabel;
    IBOutlet UITextView* shortInfoText;
    
    IBOutlet UIButton* moreInfoButton;
    IBOutlet UIButton* takePictureButton;
}

- (void) showMenu;
- (void) setupRightAnswerView;
- (void) setupWrongAnswerView;
- (void) setupStarRating:(int)rating;

@end
