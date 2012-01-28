//
//  ImageChooserVC.h
//  Lustiges Bilderraten
//
//  Created by Raphael Teßmer on 07.01.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Game.h"
#import "CustomImagePickerController.h"

@interface ImageChooserVC : UIViewController<UIActionSheetDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UIAlertViewDelegate>
{
    UIImage* pictureTaken;
    IBOutlet UIImageView* previewImage;
}

- (IBAction) takePicture;
- (void) showQuestion;
- (void) quitGame;

@property (nonatomic, retain) CustomImagePickerController* imagePicker;
@property (nonatomic, retain) Game* myGame;
@property BOOL shouldSkipView;
@property (nonatomic, retain) UIImage* selectedImage;

@end
