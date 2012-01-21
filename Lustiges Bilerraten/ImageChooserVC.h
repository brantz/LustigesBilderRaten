//
//  ImageChooserVC.h
//  Lustiges Bilderraten
//
//  Created by Raphael Teßmer on 07.01.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Game.h"
#import "ReverseImageSearch.h"

@interface ImageChooserVC : UIViewController<UIActionSheetDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UIAlertViewDelegate>{
    
    UIImage* pictureTaken;
    IBOutlet UIImageView* previewImage;
    ReverseImageSearch* imageSearchEngine;
        
    //UIImagePickerController* imagePicker;
}

- (IBAction) takePicture;
- (void) updatePicturePreview:(UIImage*)image;
- (void) showQuestion;
- (void) quitGame;

@property (nonatomic, retain) UIImagePickerController* imagePicker;
@property (nonatomic, retain) Game* myGame;
@property BOOL shouldSkipView;

@end
