//
//  QuestionVC.m
//  Lustiges Bilderraten
//
//  Created by Raphael Teßmer on 07.01.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "QuestionVC.h"
#import "MainMenuVC.h"

@implementation QuestionVC

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
            NSLog(@"0");
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


#pragma mark - Interactions

- (IBAction) hintButtonPushed{
    
    /*[UIView transitionWithView:hintButton    
                      duration:1          
                       options:UIViewAnimationOptionTransitionFlipFromRight 
                    animations:^{         
                        hintButton.hidden = YES;
                        hintText.hidden = NO;
                    }
                    completion:NULL];     
*/
    [UIView transitionFromView:hintButton toView:hintText duration:1 options:UIViewAnimationOptionTransitionFlipFromRight completion:NULL];
    hintText.hidden = NO;
    //transitionFromView:toView:duration:options:completion:
    
    /*
    [UIView beginAnimations:nil context:NULL];  
    [UIView setAnimationDuration:1];  
    hintButton.transform = CGAffineTransformMakeRotation(180);
    hintText.transform = CGAffineTransformMakeTranslation(0, 180);
   // hintButton.hidden = YES;
    hintText.hidden = NO;
    [UIView commitAnimations];
    */
}
















@end
