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
    
    styleArtDic = [[NSMutableArray alloc] init];
    for (Painting* painting in myGame.myGallery.paintingsArray) {
            [styleArtDic addObject:
             [NSString stringWithFormat:@"%@;%@", painting.styleOfPainting.styleName, painting.nameReal]
              ];
        }
    styleArtDic = [self arrayMagic:styleArtDic];
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

#pragma mark Array Adjustments for Cells

- (NSMutableArray*) arrayMagic: (NSMutableArray*) inputArray{
    
    NSMutableArray* tempArray = [[NSMutableArray alloc] initWithArray:inputArray];    

    tempArray = (NSMutableArray*) [styleArtDic sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
    NSMutableArray* outputArray = [[NSMutableArray alloc] init];
    
    NSString* alterLump;
    for (NSString* myString in tempArray) {
        NSMutableArray* sepArray = (NSMutableArray*) [myString componentsSeparatedByString:@";"];
        
        NSString* styleString = [sepArray objectAtIndex:0];
        NSString* paintString = [sepArray objectAtIndex:1];
        
        if ( !( [styleString isEqualToString:alterLump] ) ) {
            [outputArray addObject: [NSString stringWithFormat:@";%@", styleString] ];
            alterLump = styleString;
        }
        [outputArray addObject:paintString];
    }
    
    return outputArray;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
        return styleArtDic.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    int thisRow = indexPath.row;

    if ( [[styleArtDic objectAtIndex:thisRow] hasPrefix:@";"] )
        {
        NSString* myArt = [[[styleArtDic objectAtIndex:thisRow] 
                                componentsSeparatedByString:@";"] objectAtIndex:1];
        static NSString *CellIdentifier = @"artStyleMGCell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            }
            
            UILabel* myArtLabel = (UILabel*) [cell viewWithTag:100];
            myArtLabel.text = myArt;
            cell.backgroundColor = [UIColor blueColor];
            
        return cell;

        }
    else 
        {
        static NSString* CellIdentifierName = @"paintingMGCell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifierName];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifierName];
        }
        cell.textLabel.text = [styleArtDic objectAtIndex:thisRow];
        return cell;
    }
    
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
