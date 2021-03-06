//
//  QuestionVC.h
//  Lustiges Bilderraten
//
//  Created by Raphael Teßmer on 07.01.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Game.h"

@interface QuestionVC : UIViewController <UIActionSheetDelegate, UIAlertViewDelegate>{
    IBOutlet UIProgressView* pointsBar;
    IBOutlet UILabel* pointsLabel;
    
    IBOutlet UIButton* firstQuestionButton;
    IBOutlet UIButton* secondQuestionButton;
    IBOutlet UIButton* thirdQuestionButton;
    
    IBOutlet UITextView* hintText;
    IBOutlet UIButton* hintButton;
    
    IBOutlet UIView* hintTextView;
    IBOutlet UIView* hintButtonView;
    
    NSString* rightChoice;
    
    NSString* rightAnswer;
    NSString* firstWrongAnswer;
    NSString* secondWrongAnswer;
    
    NSTimer* timer;
    float duration;
    int durationPoints;
    
    float pointsInRound;
    BOOL roundActive;
    }

@property (nonatomic, strong) Game* myGame; 

- (IBAction) hintButtonPushed;
- (void) showMenu;
- (void) quitGame;

- (IBAction) questionButtonPushed:(id)sender;

- (void) setupQuestions;

- (void) changeProgress;
- (void) progressAnimater;

- (NSString *) getQuestionIDWithTag: (int) myTag;
- (NSString *) givenAnswerForChoice: (NSString *) questionID;

@end
