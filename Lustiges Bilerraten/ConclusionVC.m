//
//  ConclusionVC.m
//  Lustiges Bilderraten
//
//  Created by Raphael Teßmer on 08.01.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ConclusionVC.h"
#import "GameOverVC.h"

@implementation ConclusionVC

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
                                                          delegate:self cancelButtonTitle:@"Abbrechen" destructiveButtonTitle:@"Spiel Beenden" otherButtonTitles:@"Hauptmenü", @"Meine Galerie", nil];
    
    [gameMenu showInView:self.view];
    
}

- (void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    switch (buttonIndex) {
        case 0:
            [self quitGame];
            break;
        case 1:
            NSLog(@"1");
            [self.navigationController popToRootViewControllerAnimated:YES];
            break;
        case 2:
            NSLog(@"3");
            break;
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


#pragma mark - Setup Conclusion View




//TODO: Setup Actions for the two buttons at the bottom

- (void) setupRightAnswerView{
    
    //Setup Headline
    [wrongLabel setHidden:YES];
    [rightLabel setHidden:NO];
    //Hide rightAnswerText
    [rightAnswerLabel setHidden:YES];
}

//TODO: set text for rightAnswerLabel and shortInfo
- (void) setupWrongAnswerView{
    
    //Setup Headline
    [wrongLabel setHidden:NO];
    [rightLabel setHidden:YES];
    //Setup rightAnswerText
    [rightAnswerLabel setHidden:NO];
    
    
    
}

- (void) setupStarRating:(int)rating{
    
    switch (rating) {
            //wrong answer
        case 0:
            [star1 setHighlighted:NO];
            [star2 setHighlighted:NO];
            [star3 setHighlighted:NO];
            [star4 setHighlighted:NO];
            [star5 setHighlighted:NO];
            break;
            //1 Star, etc.
        case 1:
            [star1 setHighlighted:YES];
            [star2 setHighlighted:NO];
            [star3 setHighlighted:NO];
            [star4 setHighlighted:NO];
            [star5 setHighlighted:NO];
            break;
            
        case 2:
            [star1 setHighlighted:YES];
            [star2 setHighlighted:YES];
            [star3 setHighlighted:NO];
            [star4 setHighlighted:NO];
            [star5 setHighlighted:NO];
            break;
            
        case 3:
            [star1 setHighlighted:YES];
            [star2 setHighlighted:YES];
            [star3 setHighlighted:YES];
            [star4 setHighlighted:NO];
            [star5 setHighlighted:NO];
            break;
            
        case 4:
            [star1 setHighlighted:YES];
            [star2 setHighlighted:YES];
            [star3 setHighlighted:YES];
            [star4 setHighlighted:YES];
            [star5 setHighlighted:NO];
            break;
            
        case 5:
            [star1 setHighlighted:YES];
            [star2 setHighlighted:YES];
            [star3 setHighlighted:YES];
            [star4 setHighlighted:YES];
            [star5 setHighlighted:YES];
            break;
            
        default:
            break;
    }
}


@end
