//
//  CustomImagePickerController.m
//  Lustiges Bilderraten
//
//  Created by Thomas Rudolf on 1/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CustomImagePickerController.h"
#import <QuartzCore/QuartzCore.h>

@implementation CustomImagePickerController

@synthesize cLoadingView;

- (void) viewDidLoad
{
	[super viewDidLoad];
}

-(void) startActivityIndicator
{
	//show activity indicator to show users that somethings's happpening while 
	//doing reverse image search in background
	[NSThread detachNewThreadSelector: @selector(spinBegin) toTarget:self withObject:nil];
}

-(void) stopActivityIndicator
{
	//remove activity indicator when done
	[NSThread detachNewThreadSelector: @selector(spinEnd) toTarget:self withObject:nil];
}

- (void)spinBegin
{
	UILabel *loadingLabel = [[UILabel alloc] initWithFrame:CGRectMake(120, 270, 80, 20)];
	loadingLabel.text = @"identifiziere...";
	loadingLabel.backgroundColor = [UIColor colorWithWhite:0.0f alpha:0.0f];
	loadingLabel.font = [UIFont boldSystemFontOfSize:12.0];
	loadingLabel.textColor = [UIColor colorWithWhite:1.0 alpha:1.0];
	cLoadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];    
	//putting spinning "thing" right in the center of the current view
	CGPoint newCenter = (CGPoint) [self.view center];
	cLoadingView.center = newCenter;
	UIView *loading = [[UIView alloc] initWithFrame:CGRectMake(100, 200, 120, 120)];
	loading.opaque = NO;
	loading.layer.cornerRadius = 15;
	loading.backgroundColor = [UIColor colorWithWhite:0.0f alpha:0.6f];
	loading.frame = CGRectMake(100, 180, 120, 120);
	[self.view addSubview:loading];
	
	[self.view addSubview:cLoadingView];
	[self.view addSubview:loadingLabel];
	
	
	[cLoadingView startAnimating];
}

- (void)spinEnd
{
	[cLoadingView stopAnimating];
}

@end
