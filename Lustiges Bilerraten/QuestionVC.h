//
//  QuestionVC.h
//  Lustiges Bilderraten
//
//  Created by Raphael Teßmer on 07.01.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuestionVC : UIViewController <UIActionSheetDelegate, UIAlertViewDelegate>{
    IBOutlet UITextView* hintText;
    IBOutlet UIButton* hintButton;
    
    IBOutlet UIView* hintTextView;
    IBOutlet UIView* hintButtonView;
}

- (IBAction) hintButtonPushed;
- (void) showMenu;
- (void) quitGame;

@end
