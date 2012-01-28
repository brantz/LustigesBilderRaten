//
//  WebVC.h
//  Lustiges Bilderraten
//
//  Created by Thomas Rudolf on 27/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebVC : UIViewController
{
	NSURL *infoUrl;
	__weak IBOutlet UIWebView *webView;
}

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UINavigationItem *titleBar;
@property (nonatomic, retain) NSURL *infoUrl;
@property (nonatomic, weak) NSString *barTitle;

- (IBAction)backToGame:(id)sender;

@end
