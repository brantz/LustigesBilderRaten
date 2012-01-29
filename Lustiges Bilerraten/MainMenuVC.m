//
//  MainMenuVC.m
//  Lustiges Bilderraten
//
//  Created by Raphael Teßmer on 06.01.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MainMenuVC.h"
#import "Game.h"
#import "ImageChooserVC.h"
#import "ManualVC.h"

@implementation MainMenuVC

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


- (void) viewDidLoad{
    [super viewDidLoad];
    
    myGame = [[Game alloc] initGameWithPic:nil];
    [myGame getPaintingsFromCoreData];
}

- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self becomeFirstResponder];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Data Transmission

//TODO: Wenn MenuToMG Segue, evtl. prüfen ob spiel schon läuft/lief

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ( [[segue identifier] isEqualToString:@"newGameSegue"] && !gameIsRunning ) {
        //Create new game
        ImageChooserVC* imageChooser = (ImageChooserVC*) [segue destinationViewController];
        imageChooser.myGame = myGame;
        
    }
}


- (IBAction)goToManual:(id)sender
{
	ManualVC *manualVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ManualView"];
	
	[self.navigationController presentModalViewController:manualVC animated:YES];
}

- (IBAction)goToGallery:(id)sender
{
	MyGalleryTableVC *galleryVC = [self.storyboard instantiateViewControllerWithIdentifier:@"MyGalleryTV"];
	galleryVC.myGame = myGame;
	[self.navigationController presentModalViewController:galleryVC animated:YES];
}


#pragma mark Shake Gesture


- (BOOL) canBecomeFirstResponder{
    return YES;
}

- (void) motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    
    if (motion == UIEventSubtypeMotionShake) {
        UIAlertView* shakeAlert = [[UIAlertView alloc] initWithTitle:@"Spiel zurücksetzen" message:@"Willst du das Spiel wirklich zurücksetzen? Alle gespielten Bilder gehen dabei verloren." delegate:self cancelButtonTitle:@"Ja" otherButtonTitles:@"Nein", nil];
        [shakeAlert show];
    }
    
}

//TODO: Implementation of gallery reset
- (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    switch (buttonIndex) {
        case 0:
            NSLog(@"Ja");
            break;
            
        default:
            break;
    }
}


@end
