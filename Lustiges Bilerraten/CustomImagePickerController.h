//
//  CustomImagePickerController.h
//  Lustiges Bilderraten
//
//  Created by Thomas Rudolf on 1/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomImagePickerController : UIImagePickerController
{
		UIActivityIndicatorView *cLoadingView;
}

- (void)startActivityIndicator;
- (void)stopActivityIndicator;
- (void)spinBegin;
- (void)spinEnd;

@property (nonatomic, retain) UIActivityIndicatorView *cLoadingView;

@end
