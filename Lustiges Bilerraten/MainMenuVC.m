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

#pragma mark - Main to Gallery



#pragma mark - View lifecycle

- (void) viewWillAppear:(BOOL)animated{
    //Set the NavigationControlBar hidden
    self.navigationController.navigationBarHidden = YES;
}

-(void) viewWillDisappear:(BOOL)animated{
    //Set the NavigationControlBar hidden
    self.navigationController.navigationBarHidden = NO;
}

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
    //Set the NavigationControlBar hidden
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

#pragma mark - Data Transmission

//TODO: Wenn MenuToMG Segue, evtl. prüfen ob spiel schon läuft/lief

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ( [[segue identifier] isEqualToString:@"newGameSegue"] && !gameIsRunning ) {
        //Create new game
        myGame = [[Game alloc] initGameWithPic:nil];
        [myGame getPaintingsFromCoreData];
        ImageChooserVC* imageChooser = (ImageChooserVC*) [segue destinationViewController];
        imageChooser.myGame = myGame;
        
    }
    if ( [[segue identifier] isEqualToString:@"menuToMG"] ) {
        
        MyGalleryTableVC* myGallery = (MyGalleryTableVC*) [segue destinationViewController];
        myGallery.myGame = myGame;
        
    }
}


@end
