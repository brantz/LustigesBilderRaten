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
}

- (IBAction) takePicture;
- (void) updatePicturePreview:(UIImage*)image;

@end
