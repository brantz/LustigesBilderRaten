//
//  ImageChooserVC.h
//  Lustiges Bilderraten
//
//  Created by Raphael Teßmer on 07.01.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Game.h"

@interface ImageChooserVC : UIViewController<UIActionSheetDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UIAlertViewDelegate>
{
	UIActivityIndicatorView *cLoadingView;
    UIImage* pictureTaken;
    IBOutlet UIImageView* previewImage;
}

- (IBAction) takePicture;
- (void) updatePicturePreview:(UIImage*)image;
- (void) showQuestion;
- (void) quitGame;
- (void)initSpinner;
- (void)spinBegin;
- (void)spinEnd;

@property (nonatomic, retain) UIImagePickerController* imagePicker;
@property (nonatomic, retain) Game* myGame;
@property BOOL shouldSkipView;
@property (nonatomic, retain) UIImage* selectedImage;
@property (nonatomic, retain) UIActivityIndicatorView *cLoadingView;

@end
