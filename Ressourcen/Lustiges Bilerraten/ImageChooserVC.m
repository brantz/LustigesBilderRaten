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

@implementation ImageChooserVC

@synthesize imagePicker, myGame, shouldSkipView, selectedImage, cLoadingView;;

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
            NSLog(@"3");
            break;
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
	[self initSpinner];
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
	//show activity indicator to show users that somethings's happpening while 
	//doing reverse image search in background
	[NSThread detachNewThreadSelector: @selector(spinBegin) toTarget:self withObject:nil];
	
	[myGame nextRound:0 andFoto:selectedImage];
	
	//remove activity indicator when done
	[NSThread detachNewThreadSelector: @selector(spinEnd) toTarget:self withObject:nil];
	
	//prepare next question and segue to question view
    QuestionVC* nextQuestion = [self.storyboard instantiateViewControllerWithIdentifier:@"QuestionView"];
    nextQuestion.myGame = self.myGame;
    [self.navigationController pushViewController:nextQuestion animated:YES];
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
	imagePicker = [[UIImagePickerController alloc] init];
	[imagePicker setDelegate:self];
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
	{
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    } else {
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
	[self presentViewController:self.imagePicker animated:YES completion:NULL];  
}

- (void) imagePickerController:(UIImagePickerController *)picker 
		 didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo
{
    self.selectedImage = image;
	[previewImage setImage:image];

	//dismiss imagePickerController
    [picker dismissModalViewControllerAnimated:YES];
}

- (void)initSpinner
{
	cLoadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];    
	//putting spinning "thing" right in the center of the current view
	CGPoint newCenter = (CGPoint) [self.view center];
	cLoadingView.center = newCenter;
	[self.view addSubview:cLoadingView];
}

- (void)spinBegin
{
	[cLoadingView startAnimating];
}

- (void)spinEnd
{
	[cLoadingView stopAnimating];
}



@end
