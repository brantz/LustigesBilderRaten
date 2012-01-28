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
    
    
    //NSString* artStyle -> NSString* paintingName
    styleArtDic = [[NSMutableArray alloc] init];
    paintingArray = [[NSMutableArray alloc] init];
    
    
    
    for (Painting* painting in myGame.myGallery.paintingsArray) {
            
        if ( !( [styleArtDic containsObject:painting.styleOfPainting.styleName] ) )
        {
            [styleArtDic addObject:painting.styleOfPainting.styleName];
        }
                
        if ( !( [paintingArray containsObject:painting.nameOfPainting] ) )
        {
            [paintingArray addObject:painting.nameOfPainting];
        }
                
            
        }
    
    
    
    NSLog(@"so viele ArtStyles: %i", styleArtDic.count);
    NSLog(@"so viele Bilder: %i", paintingArray.count);
    
    
    for (NSString* myString in styleArtDic) {
        NSLog(@"!!!!!!!!! KEY: %@", myString);
    }
    
    for (NSString* myString in paintingArray) {
        NSLog(@"!!!!!!!!! VAL: %@", myString);
    }
    

    UIImage* meinImage;
    for (Painting* paintingm in myGame.myGallery.paintingsArray) {
        NSLog(@"--");
        meinImage = paintingm.picture;
        NSLog(@"Object?: %@", paintingm.nameOfPainting);
        NSLog(@"Width: %f", meinImage.size.width);
        NSLog(@"--");
    }
    
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
    int key = styleArtDic.count;
    int val = paintingArray.count;
    NSLog(@"______ key: %i val: %i", key, val);
    int seErgebnis = key + val;
    return seErgebnis;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    int thisRow = indexPath.row;
    
    int keyIndex = styleArtDic.count;
    /*
    if ( thisRow == 0
        || thisRow == styleArtDic
        
        ) {
        <#statements#>
    }
     
        
    */
    
    static NSString *CellIdentifier = @"artStyleMGCell";
    static NSString* CellIdentifierName = @"paintingMGCell";
    

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifierName];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifierName];
    }
    
    cell.textLabel.text = [paintingArray objectAtIndex:thisRow];
    return cell;
}


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
