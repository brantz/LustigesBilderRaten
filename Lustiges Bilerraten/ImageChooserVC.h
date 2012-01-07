//
//  ImageChooserVC.h
//  Lustiges Bilderraten
//
//  Created by Raphael Teßmer on 07.01.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageChooserVC : UIViewController<UIActionSheetDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate>{
    
    UIImage* pictureTaken;
    IBOutlet UIImageView* previewImage;
    
    //UIImagePickerController* imagePicker;
}

- (IBAction) takePicture;
- (void) updatePicturePreview:(UIImage*)image;
- (void) showQuestion;

@property (nonatomic, retain) UIImagePickerController* imagePicker;

@end
