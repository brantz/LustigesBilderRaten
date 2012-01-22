//
//  MyGalleryTableVC.m
//  Lustiges Bilderraten
//
//  Created by Raphael Teßmer on 07.01.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MyGalleryTableVC.h"
#import "Painting.h"


@implementation MyGalleryTableVC

@synthesize myGame;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
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

- (void)viewDidLoad
{
    [super viewDidLoad];

    
    NSLog(@"!!!!!!!!!!!!!!!!!!: %i", myGame.myGallery.paintingsArray.count);
    
    Painting* meinPainting = (Painting*) [myGame.myGallery.paintingsArray objectAtIndex:1];
    
    UIImage* meinImage;
    

    

    
    for (Painting* paintingm in myGame.myGallery.paintingsArray) {
        NSLog(@"--");
        meinImage = paintingm.picture;
        NSLog(@"Object?: %@", meinImage);
        NSLog(@"Width: %f", meinImage.size.width);
        NSLog(@"--");
    }
    meinImage = meinPainting.picture;
    
    UIImageView* meinImageView = [[UIImageView alloc] initWithImage:meinImage];
    [meinImageView sizeToFit];
    meinImageView.multipleTouchEnabled = YES;
    meinImageView.userInteractionEnabled = YES;
    [self.view addSubview:meinImageView];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    //Set the NavigationControlBar visible
    self.navigationController.navigationBarHidden = YES;
    
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:animated];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //NSArray* paintingNameArray = [[NSArray alloc] init];
    NSMutableDictionary* styleArtDic = [[NSDictionary alloc] init];
    
    for (Painting* painting in myGame.myGallery.paintingsArray) {
        
        //painting
        
        
    }
    
    static NSString *CellIdentifier = @"imageMGCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = [myGame.myGallery.paintingsArray objectAtIndex:indexPath.row];
    return cell;
}


//
//-(void)changeProgress
//{
//    if(duration <= 0.0f)
//    {   
//        [timer invalidate];
//    }
//    else
//    {
//        NSLog(@"zähl");
//        
//        
//        Painting* meinPainting = (Painting*) [myGame.myGallery.paintingsArray objectAtIndex:2];
//        
//        UIImage* meinImage;
//        
//        UIImageView* meinImageView = [[UIImageView alloc] initWithImage:meinImage];
//        [meinImageView sizeToFit];
//        
//        meinImageView.multipleTouchEnabled = YES;
//        meinImageView.userInteractionEnabled = YES;
//        
//        for (Painting* paintingm in myGame.myGallery.paintingsArray) {
//            NSLog(@"--");
//            meinImage = paintingm.picture;
//            NSLog(@"Object?: %@", meinImage);
//            NSLog(@"Width: %f", meinImage.size.width);
//            NSLog(@"--");
//        }
//        if (meinImage != nil) {
//            //[self.view removeFromSuperview]
//            [self.view addSubview:meinImageView];
//        }
//        
//        //[self.view addSubview:meinImageView];
//
//    }
//}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    // Navigation logic may go here. Create and push another view controller.
    
     UITableViewController *detailViewController = [[UITableViewController alloc] init];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     
}

@end
