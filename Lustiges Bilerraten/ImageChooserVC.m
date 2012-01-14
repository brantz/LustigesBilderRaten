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

@synthesize imagePicker, myGame, shouldSkipView;

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


- (void) showMenu{   
    UIActionSheet* gameMenu = [[UIActionSheet alloc] initWithTitle:@""
delegate:self cancelButtonTitle:@"Abbrechen" destructiveButtonTitle:@"Spiel Beenden" otherButtonTitles:@"Hauptmenü", @"Meine Galerie", nil];
        
    [gameMenu showInView:self.view];
}

- (void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    switch (buttonIndex) {
        case 0:
            [self quitGame];
            break;
        case 1:
            NSLog(@"1");
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

    [super viewDidLoad];
    self.navigationItem.hidesBackButton = YES;
    //Generate a Menu Button for the Navigation Bar
    UIBarButtonItem* menuBarButton = [[UIBarButtonItem alloc] initWithTitle:@"Menü" style:UIBarButtonItemStylePlain target:self action:@selector(showMenu)];
    //Generate a Next [Question] Button for the Navigation Bar
    UIBarButtonItem* nextBarButton = [[UIBarButtonItem alloc] initWithTitle:@"Weiter" style:UIBarButtonItemStyleBordered target:self action:@selector(showQuestion)];
    
    self.navigationItem.leftBarButtonItem = menuBarButton;
    self.navigationItem.rightBarButtonItem = nextBarButton;
    }

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    NSLog(@"11111111111");

}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void) showQuestion{
    QuestionVC* nextQuestion = [self.storyboard instantiateViewControllerWithIdentifier:@"QuestionView"];
    nextQuestion.myGame = self.myGame;
    [self.navigationController pushViewController:nextQuestion animated:YES];
}

- (void) quitGame{
    [self dismissModalViewControllerAnimated:YES];
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Spiel Beenden"
    message:@"Wollen Sie das Spiel wirklich beenden?" delegate:self cancelButtonTitle:@"Abbrechen" otherButtonTitles:@"Beenden", nil];
    [alert show];
    
}

- (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex == 1) {
        
        GameOverVC* gameOver = [self.storyboard instantiateViewControllerWithIdentifier:@"GameOverView"];
        gameOver.myGame = myGame;
        [self.navigationController pushViewController:gameOver animated:YES];
        
    }
    
}

#pragma mark - Get Picture

/*
 Create a ImagePickerController and set self as it's delegate.
 Sourcetype defines that a new photo is going to be taken rather than chosen from camera roll. Finally the image picker is being presented as a modal view.
*/
- (IBAction) takePicture{
        imagePicker = [[UIImagePickerController alloc] init];
        [imagePicker setDelegate:self];
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:self.imagePicker animated:YES completion:NULL];
        
    }
    
        


- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo{
    [self updatePicturePreview:image];
    [self.imagePicker dismissModalViewControllerAnimated:YES];
}

- (void) updatePicturePreview: (UIImage*) image{
    [previewImage setImage:image];
    //Update Image within Game
    myGame = [[Game alloc] initGameWithPic:image];
}

@end
