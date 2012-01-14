//
//  QuestionVC.m
//  Lustiges Bilderraten
//
//  Created by Raphael Teßmer on 07.01.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "QuestionVC.h"
#import "MainMenuVC.h"
#import "GameOverVC.h"
#import "ManualVC.h"
#import "MyGallery.h"
#import "SettingsVC.h"
#import "Question.h"

@implementation QuestionVC

@synthesize myGame;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.hidesBackButton = YES;
    //Generate a Menu Button for the Navigation Bar
    UIBarButtonItem* menuBarButton = [[UIBarButtonItem alloc] initWithTitle:@"Menü" style:UIBarButtonItemStylePlain target:self action:@selector(showMenu)];
    
	self.navigationItem.title = @"Quizz";
    self.navigationItem.leftBarButtonItem = menuBarButton;
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void) showMenu{
    UIActionSheet* gameMenu = [[UIActionSheet alloc] initWithTitle:@""
                                                          delegate:self cancelButtonTitle:@"Abbrechen" destructiveButtonTitle:@"Spiel Beenden" otherButtonTitles:@"Anleitung", @"Meine Galerie", @"Einstellungen", nil];
    
    [gameMenu showInView:self.view];
    
}

- (void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    switch (buttonIndex) {
        case 0:
            [self quitGame];
            break;
        case 1:{
            NSLog(@"AnleitungsButton");
			ManualVC *manualVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ManualView"];
			[self.navigationController pushViewController:manualVC animated:YES];
            break;
        }
        case 2:{
            NSLog(@"MeineGalerieButton");
			MyGalleryTableVC *galleryVC = [self.storyboard instantiateViewControllerWithIdentifier:@"MyGalleryTV"];
			[self.navigationController pushViewController:galleryVC animated:YES];
            break;
		}
		case 3:{
			NSLog(@"EinstellungsButton");
			SettingsVC *settingsVC = [self.storyboard instantiateViewControllerWithIdentifier:@"SettingsView"];
			[self.navigationController pushViewController:settingsVC animated:YES];
			break;
		}
        default:
            break;
    }
}

- (void) quitGame{
    [self dismissModalViewControllerAnimated:YES];
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Spiel Beenden"
                                                    message:@"Wollen Sie das Spiel wirklich beenden?" delegate:self cancelButtonTitle:@"Abbrechen" otherButtonTitles:@"Beenden", nil];
    [alert show];
    
}

- (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex == 1) {
        
        GameOverVC* gameOver = [self.storyboard instantiateViewControllerWithIdentifier:@"GameOverView"];
        [self.navigationController pushViewController:gameOver animated:YES];
        
    }
    
}


#pragma mark - Interactions

- (IBAction) hintButtonPushed{

    [UIView transitionFromView:hintButton toView:hintText duration:1 options:UIViewAnimationOptionTransitionFlipFromRight completion:NULL];
    hintText.hidden = NO;

}


- (IBAction)questionButtonPushed:(id)sender{
    //Tags for Buttons: first: 10; second: 11; third: 12
    NSLog(@"Button pressed: %i", [sender tag]);  
}


- (void) setupQuestions{
    //Get Array of possible answers from game
    NSArray* possibleAnswers = [[NSArray alloc] initWithArray: [myGame newQuestionOfPainting].answerPossibilities ];
    NSString* rightAnswer = [possibleAnswers objectAtIndex:0];
    NSString* firstWrongAnswer = [possibleAnswers objectAtIndex:1];
    NSString* secondWrongAnswer = [possibleAnswers objectAtIndex:2];
    
    int rightAnswerIndex = arc4random() % 2;
    
    switch (rightAnswerIndex) {
        case 0:
            [firstQuestionButton setTitle:rightAnswer forState:UIControlStateNormal];
            [secondQuestionButton setTitle:firstWrongAnswer forState:UIControlStateNormal];
            [thirdQuestionButton setTitle:secondWrongAnswer forState:UIControlStateNormal];
            break;
        case 1:
            [firstQuestionButton setTitle:firstWrongAnswer forState:UIControlStateNormal];
            [secondQuestionButton setTitle:rightAnswer forState:UIControlStateNormal];
            [thirdQuestionButton setTitle:secondWrongAnswer forState:UIControlStateNormal];
            break;
        case 2:
            [firstQuestionButton setTitle:secondWrongAnswer forState:UIControlStateNormal];
            [secondQuestionButton setTitle:firstWrongAnswer forState:UIControlStateNormal];
            [thirdQuestionButton setTitle:rightAnswer forState:UIControlStateNormal];
            break;
        default:
            break;
    }
    
    [hintText setText: [[myGame newQuestionOfPainting] generateHints]];
    }






@end
