//
//  ConclusionVC.m
//  Lustiges Bilderraten
//
//  Created by Raphael Teßmer on 08.01.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ConclusionVC.h"
#import "MyGalleryTableVC.h"
#import "GameOverVC.h"
#import "ImageChooserVC.h"
#import "WebVC.h"

@implementation ConclusionVC

@synthesize myGame, answerIsRight, pointsInRound, imagePicker,navTitle;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
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

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.hidesBackButton = YES;
    //Generate a Menu Button for the Navigation Bar
    UIBarButtonItem* menuBarButton = [[UIBarButtonItem alloc] initWithTitle:@"Menü" 
				style:UIBarButtonItemStylePlain target:self action:@selector(showMenu)];
    
    self.navigationItem.title = navTitle;
    self.navigationItem.leftBarButtonItem = menuBarButton;
    
    if(answerIsRight)
	{
        [self setupRightAnswerView];
    } else {
        [self setupWrongAnswerView];
    }
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

- (void) showMenu
{
    UIActionSheet* gameMenu = [[UIActionSheet alloc] initWithTitle:@""
									delegate:self cancelButtonTitle:@"Abbrechen"
									destructiveButtonTitle:@"Spiel Beenden"
									otherButtonTitles:@"Meine Galerie", nil];
    [gameMenu showInView:self.view];
  
}

- (void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{ 
    switch (buttonIndex)
	{        
        case 0:
            [self quitGame];
            break;
        case 1:
		{
            MyGalleryTableVC *galleryVC = [self.storyboard instantiateViewControllerWithIdentifier:@"MyGalleryTV"];
            galleryVC.myGame = myGame;
            UINavigationController* modalController = [[UINavigationController alloc] initWithRootViewController:galleryVC];
            UIBarButtonItem *MGdone = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(dismissModalViewControllerAnimated:)];
            galleryVC.navigationItem.leftBarButtonItem = MGdone;
            [self.navigationController presentModalViewController:modalController animated:YES];
            break;
		}
        default:
            break;
    }
}

- (void) quitGame
{
    [self dismissModalViewControllerAnimated:YES];
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Spiel Beenden"
					message:@"Wollen Sie das Spiel wirklich beenden?" delegate:self 
					cancelButtonTitle:@"Abbrechen" 
					otherButtonTitles:@"Beenden", nil];
    [alert show];  
}

- (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        
        GameOverVC* gameOver = [self.storyboard instantiateViewControllerWithIdentifier:@"GameOverView"];
        gameOver.myGame = myGame;
        [self.navigationController pushViewController:gameOver animated:YES];   
    }  
}


#pragma mark - Setup Conclusion View

- (void) setupRightAnswerView
{
    //Setup Headline
    [wrongLabel setHidden:YES];
    [rightLabel setHidden:NO];

    //Hide rightAnswerText
    [rightAnswerLabel setHidden:YES];
    
    //Calculate Stars for Points
    [self setupStarRating:[myGame.question.answer pointsToStars]];
    
    //Setup shortText
    [shortInfoText setText: myGame.myPainting.styleOfPainting.shortText];
}

- (void) setupWrongAnswerView
{
    //Setup Headline
    [wrongLabel setHidden:NO];
    [rightLabel setHidden:YES];

    //Get right Answer and setup rightAnswerLabel
    NSString* rightAnswerText = [myGame.question.answerPossibilities objectAtIndex:0];
    rightAnswerText = [NSString stringWithFormat:@"Richtige Antwort: %@", rightAnswerText];
    [rightAnswerLabel setHidden:NO];
    [rightAnswerLabel setText:rightAnswerText];

    //Setup Star Rating
    [self setupStarRating:0];
    
    //Setup shortText
    [shortInfoText setText: myGame.myPainting.styleOfPainting.shortText];
}

- (void) setupStarRating:(int)rating
{  
    switch (rating)
	{
            //wrong answer
        case 0:
            [star1 setHighlighted:NO];
            [star2 setHighlighted:NO];
            [star3 setHighlighted:NO];
            [star4 setHighlighted:NO];
            [star5 setHighlighted:NO];
            break;
            //1 Star, etc.
        case 1:
            [star1 setHighlighted:YES];
            [star2 setHighlighted:NO];
            [star3 setHighlighted:NO];
            [star4 setHighlighted:NO];
            [star5 setHighlighted:NO];
            break;
            
        case 2:
            [star1 setHighlighted:YES];
            [star2 setHighlighted:YES];
            [star3 setHighlighted:NO];
            [star4 setHighlighted:NO];
            [star5 setHighlighted:NO];
            break;
            
        case 3:
            [star1 setHighlighted:YES];
            [star2 setHighlighted:YES];
            [star3 setHighlighted:YES];
            [star4 setHighlighted:NO];
            [star5 setHighlighted:NO];
            break;
            
        case 4:
            [star1 setHighlighted:YES];
            [star2 setHighlighted:YES];
            [star3 setHighlighted:YES];
            [star4 setHighlighted:YES];
            [star5 setHighlighted:NO];
            break;
            
        case 5:
            [star1 setHighlighted:YES];
            [star2 setHighlighted:YES];
            [star3 setHighlighted:YES];
            [star4 setHighlighted:YES];
            [star5 setHighlighted:YES];
            break;
            
        default:
            break;
    }
}


#pragma mark - Get Picture

/*
 Create a ImagePickerController and set self as it's delegate.
 Sourcetype defines that a new photo is going to be taken rather than chosen from camera roll.
 Finally the image picker is being presented as a modal view.
 */
- (IBAction) takePicture
{
    imagePicker = [[CustomImagePickerController alloc] init];
    [imagePicker setDelegate:self];
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
	{
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    } else {
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
	[self presentViewController:self.imagePicker animated:YES completion:NULL];    
}

- (IBAction)moreInfoButtonPressed:(id)sender
{
	WebVC *moreInfoWebVC = [self.storyboard instantiateViewControllerWithIdentifier:@"MoreInfoWebVC"];
	moreInfoWebVC.infoUrl = [[NSURL alloc] initWithString:myGame.myPainting.link];
	moreInfoWebVC.barTitle = myGame.myPainting.styleOfPainting.styleName;
	[self.navigationController presentModalViewController:moreInfoWebVC animated:YES];
}




- (void) imagePickerController:(CustomImagePickerController *)picker
		 didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo
{
	//show activity indicator to show users that somethings's happpening while 
	//doing reverse image search in background
	[self.imagePicker startActivityIndicator];
	
    //setup next Round
    [myGame nextRound:(int)pointsInRound andFoto:image];
    
	//remove activity indicator when done
	[self.imagePicker stopActivityIndicator];

    
	//pop back to QuestionVC
	[self.imagePicker dismissModalViewControllerAnimated:YES];    
	
	ImageChooserVC* oldImageChooser = [[self.navigationController viewControllers] objectAtIndex:1];
    oldImageChooser.shouldSkipView = YES;
    [self.navigationController popToViewController:oldImageChooser  animated:NO];    
    
}

@end
