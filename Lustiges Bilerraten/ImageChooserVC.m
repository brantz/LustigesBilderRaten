//
//  ImageChooserVC.m
//  Lustiges Bilderraten
//
//  Created by Raphael Teßmer on 07.01.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ImageChooserVC.h"
#import "QuestionVC.h"
#import "GameOverVC.h"
#import "MyGalleryTableVC.h"

@implementation ImageChooserVC

@synthesize imagePicker, myGame, shouldSkipView, selectedImage;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
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


- (void) showMenu
{   
    UIActionSheet* gameMenu = [[UIActionSheet alloc] initWithTitle:@""
								delegate:self cancelButtonTitle:@"Abbrechen" 
								destructiveButtonTitle:@"Spiel Beenden"
								otherButtonTitles:@"Hauptmenü", @"Meine Galerie", nil];
        
    [gameMenu showInView:self.view];
}

//TODO: case:2
- (void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex)
	{
        case 0:
            [self quitGame];
            break;
        case 1:
            [self.navigationController popViewControllerAnimated:YES];
            break;
        case 2:
		{
            MyGalleryTableVC *myGallery = [self.storyboard instantiateViewControllerWithIdentifier:@"MyGalleryTV"];
            [self.navigationController presentModalViewController:myGallery animated:YES];
            break;
		}
        default:
            break;
    }
}

- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    if (shouldSkipView) {
        [self showQuestion];
        shouldSkipView = NO;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.hidesBackButton = YES;
    //Generate a Menu Button for the Navigation Bar
    UIBarButtonItem* menuBarButton = [[UIBarButtonItem alloc] initWithTitle:@"Menü" 
			style:UIBarButtonItemStylePlain target:self action:@selector(showMenu)];
    //Generate a Next [Question] Button for the Navigation Bar
    UIBarButtonItem* nextBarButton = [[UIBarButtonItem alloc] initWithTitle:@"Weiter"
			style:UIBarButtonItemStyleBordered target:self action:@selector(showQuestion)];
    
    self.navigationItem.leftBarButtonItem = menuBarButton;
    self.navigationItem.rightBarButtonItem = nextBarButton;
    [self.navigationItem.rightBarButtonItem setEnabled:NO];
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


- (void) showQuestion
{

    if (! (myGame.myPainting.paintingIsInDB)){
        [self.navigationItem.rightBarButtonItem setEnabled:NO];
        UIAlertView* matchError = [[UIAlertView alloc] initWithTitle:@"Bild nicht gefunden" message:@"Leider konnten wir deinem Foto kein Bild zuweisen. Bitte versuche es erneut" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [matchError show];
    }
    else
    {
	//prepare next question and segue to question view
    QuestionVC* nextQuestion = [self.storyboard instantiateViewControllerWithIdentifier:@"QuestionView"];
    nextQuestion.myGame = self.myGame;
    [self.navigationController pushViewController:nextQuestion animated:YES];
    }
}

- (void) quitGame
{
    [self dismissModalViewControllerAnimated:YES];
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Spiel Beenden"
    message:@"Wollen Sie das Spiel wirklich beenden?" delegate:self 
			cancelButtonTitle:@"Abbrechen" otherButtonTitles:@"Beenden", nil];
    [alert show];
}

- (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1)
	{
        GameOverVC* gameOver = [self.storyboard instantiateViewControllerWithIdentifier:@"GameOverView"];
        gameOver.myGame = myGame;
        [self.navigationController pushViewController:gameOver animated:YES];  
    }
    
}

#pragma mark - Get Picture

/*
 Create a ImagePickerController and set self as it's delegate.
 Sourcetype defines that a new photo is going to be taken rather than chosen 
 from camera roll. Finally the image picker is being presented as a modal view.
*/
- (IBAction) takePicture
{
	imagePicker = [[CustomImagePickerController alloc] init];
	[imagePicker setDelegate:self];
    if ([CustomImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
	{
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    }
	else
	{
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
	[self presentViewController:self.imagePicker animated:YES completion:NULL];  
}

- (void) imagePickerController:(CustomImagePickerController *)picker 
		 didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo
{
	self.selectedImage = image;
	
    [self.navigationItem.rightBarButtonItem setEnabled:YES];
    
	//adjust width of peviewImageView
	float imageWidthResized = image.size.width * (198.0 / image.size.height);
	CGRect bounds = CGRectMake((self.view.bounds.size.width - imageWidthResized) / 2.0, 109.0, imageWidthResized, 196.0);
	previewImage.superview.superview.frame =  bounds;	
	[previewImage setImage:image];

	//start ActicvityIndicator in ImagePickerController
	[self.imagePicker startActivityIndicator];
	
	[myGame nextRound:0 andFoto:selectedImage];

	//stop ActivityIndicator in ImagePickerController
	[self.imagePicker stopActivityIndicator];
	 
	//[self.navigationItem.rightBarButtonItem setEnabled];

	//dismiss imagePickerController
    [picker dismissModalViewControllerAnimated:YES];
}


@end
