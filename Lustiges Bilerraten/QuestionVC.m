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
#import "ConclusionVC.h"

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
            
    [self progressAnimater];
    [self setupQuestions];
    
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
        gameOver.myGame = myGame;
        [self.navigationController pushViewController:gameOver animated:YES];
        
    }
    
}


#pragma mark - Interactions

- (IBAction) hintButtonPushed{

    [UIView transitionFromView:hintButton toView:hintText duration:1 options:UIViewAnimationOptionTransitionFlipFromRight completion:NULL];
    hintText.hidden = NO;

}

//TODO: rightChoice dynamically
- (IBAction)questionButtonPushed:(id)sender{
    //Tags for Buttons: first: 10; second: 11; third: 12
    
    //******DEBUGGING********
    //rightChoice = @"a";
    //******DEBUGGING********
    
    //Setup Points and Stop Animation
    roundActive = NO;
    pointsInRound = 1000 * pointsBar.progress;
    pointsLabel.text = [NSString stringWithFormat:@"%f",pointsInRound];    
    
    //Setup next View (Conclusion)
    ConclusionVC* myConclusion =  [self.storyboard instantiateViewControllerWithIdentifier:@"ConclusionVC"];
    myConclusion.myGame = self.myGame;
    
    //Hope that works
    [myGame.question giveAnswer:
                [self givenAnswerForChoice:
                        [self getQuestionIDWithTag: [sender tag]]
                 ]
                andPoints:(int)pointsInRound];
    
    if ( [self getQuestionIDWithTag: [sender tag] ] == rightChoice){
        myConclusion.answerIsRight = YES;
        myConclusion.pointsInRound = pointsInRound;
    }
    else 
            myConclusion.answerIsRight = NO;
    
    
    [self.navigationController pushViewController:myConclusion animated:YES];
}


- (NSString *) getQuestionIDWithTag: (int) myTag{
    switch (myTag) {
        case 10:
            return @"a";
            break;
        case 11:
            return @"b";
            break;
        case 12:
            return @"c";
            break;
        default:
            break;
    }
    
    return @"d";
}

- (NSString *) givenAnswerForChoice: (NSString *) questionID{
    
    if ([questionID isEqualToString:@"a"]) {
        return firstQuestionButton.titleLabel.text;
    } else if( [questionID isEqualToString:@"b"]){
        return firstQuestionButton.titleLabel.text;
    } else if( [questionID isEqualToString:@"c"]){
        return firstQuestionButton.titleLabel.text;
    } else {
        NSLog(@"No QuestionID matching");
        return @"wrongID";
    }
}

//FIXME: fix this fucking int
-(void)changeProgress
{
    if(duration <= 0.0f && !roundActive)
    {   
        [timer invalidate];
    }
    else
    {
        durationPoints = 1000 * duration;
        duration -= 0.001;
        pointsBar.progress = duration;
        [pointsLabel setText:[NSString stringWithFormat:@"%i", durationPoints] ];
    }
}

-(void)progressAnimater
{
    pointsBar.progress = 1;
    duration = 1;
    timer = [NSTimer scheduledTimerWithTimeInterval: 0.01f
                                             target: self
                                           selector: @selector(changeProgress)
                                           userInfo: nil
                                            repeats: YES];
}


- (void) setupQuestions{
    //Get Array of possible answers from game
    NSArray* possibleAnswers = [[NSArray alloc] initWithArray: [myGame newQuestionOfPainting].answerPossibilities ];
    rightAnswer = [possibleAnswers objectAtIndex:0];
    firstWrongAnswer = [possibleAnswers objectAtIndex:1];
    secondWrongAnswer = [possibleAnswers objectAtIndex:2];
    
    
    int rightAnswerIndex = arc4random() % 2;
    
    switch (rightAnswerIndex) {
        case 0:
            [firstQuestionButton setTitle:rightAnswer forState:UIControlStateNormal];
            [secondQuestionButton setTitle:firstWrongAnswer forState:UIControlStateNormal];
            [thirdQuestionButton setTitle:secondWrongAnswer forState:UIControlStateNormal];
            rightChoice = @"a";
            break;
        case 1:
            [firstQuestionButton setTitle:firstWrongAnswer forState:UIControlStateNormal];
            [secondQuestionButton setTitle:rightAnswer forState:UIControlStateNormal];
            [thirdQuestionButton setTitle:secondWrongAnswer forState:UIControlStateNormal];
            rightChoice = @"b";
            break;
        case 2:
            [firstQuestionButton setTitle:secondWrongAnswer forState:UIControlStateNormal];
            [secondQuestionButton setTitle:firstWrongAnswer forState:UIControlStateNormal];
            [thirdQuestionButton setTitle:rightAnswer forState:UIControlStateNormal];
            rightChoice = @"c";
            break;
        default:
            break;
    }
    [hintText setText: [[myGame newQuestionOfPainting] generateHints]];
    

}



@end
