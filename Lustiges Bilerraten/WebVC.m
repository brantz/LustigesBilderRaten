//
//  WebVC.m
//  Lustiges Bilderraten
//
//  Created by Thomas Rudolf on 27/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "WebVC.h"

@implementation WebVC

@synthesize infoUrl, webView, titleBar, barTitle;

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

- (void)viewWDidLoad
{
    [super viewDidLoad];
}

-(void) viewDidAppear:(BOOL)animated
{
	titleBar.title = barTitle;
	[webView loadRequest:[NSURLRequest requestWithURL:infoUrl]];
}


- (void)viewDidUnload
{
	webView = nil;
	[self setWebView:nil];
	[self setTitleBar:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)backToGame:(id)sender
{
	[self dismissModalViewControllerAnimated:YES]; 
}
@end
