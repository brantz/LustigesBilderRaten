//
//  MyGalleryTableVC.m
//  Lustiges Bilderraten
//
//  Created by Raphael Teßmer on 07.01.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MyGalleryTableVC.h"
#import "Painting.h"
#import "WebVC.h"


@implementation MyGalleryTableVC

@synthesize myGame;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
    }
    return self;
}


#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    styleArtDic = [[NSMutableArray alloc] init];
    rowDic = [[NSMutableDictionary alloc] init];
    rowIndexDic = [[NSMutableDictionary alloc] init];
    rowsWithStyle = [[NSMutableArray alloc] init];
    
    for (Painting* painting in myGame.myGallery.paintingsArray) {
            [styleArtDic addObject:
             [NSString stringWithFormat:@"%@;%@", painting.styleOfPainting.styleName, painting.nameReal]
              ];
        NSLog(@"2. Value: %@ and Key: %@",painting, painting.nameReal );
        [rowDic setObject:painting.styleOfPainting forKey:painting.styleOfPainting.styleName];
        [rowDic setObject:painting forKey:painting.nameReal];
        
        }
    styleArtDic = [self arrayMagic:styleArtDic];
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
        [rowIndexDic setObject:[rowDic valueForKey:myArt] forKey: indexPath];
            
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
        [rowIndexDic setObject:[rowDic valueForKey:[styleArtDic objectAtIndex:thisRow]] forKey: indexPath];
        return cell;
    }
    
}



- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}


#pragma mark - Table view delegate

//TODO: Add UIPinchGestureRecognizer for painting view

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *detailViewController = [[UIViewController alloc] init];

    if ( [[rowIndexDic objectForKey:indexPath] isKindOfClass:[ArtStyle class]] ){
        
        tempArtStyle = (ArtStyle*) [rowIndexDic objectForKey:indexPath];
        
        CGRect infoTextFrame = CGRectMake(0, 0, 320, 350);
        CGRect moreInfoButtonFrame = CGRectMake(77, 360, 166, 37);
        
        UITextView* bigInfoText = [[UITextView alloc] initWithFrame:infoTextFrame];
        UIButton* moreInfoButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        
        [moreInfoButton setFrame:moreInfoButtonFrame];
        [bigInfoText setFont:[UIFont systemFontOfSize:14]];
        
        [bigInfoText setText:tempArtStyle.infoText];
        [moreInfoButton setTitle:@"Mehr Informationen" forState:UIControlStateNormal];
        
        [detailViewController.view addSubview:bigInfoText];
        [detailViewController.view addSubview:moreInfoButton];
        [detailViewController setTitle:tempArtStyle.styleName];
        
        [detailViewController.view setBackgroundColor:[UIColor whiteColor]];
        
        
        [moreInfoButton addTarget:self action:@selector(showWebView) forControlEvents:UIControlEventTouchUpInside];
        
        
    } else {
        
        Painting* myGalPainting = (Painting*) [rowIndexDic objectForKey:indexPath];
        
        UIImageView* bigImageOfPainting = [[UIImageView alloc] init];
        
        CGRect bigPaintingViewFrame =  [[UIScreen mainScreen] bounds];
        UIImage* bigImage = myGalPainting.picture;
        
        [bigImageOfPainting setFrame:bigPaintingViewFrame];
        [bigImageOfPainting setImage:bigImage];
        [bigImageOfPainting setMultipleTouchEnabled:YES];
        [bigImageOfPainting setContentMode:UIViewContentModeScaleAspectFit];
        [bigImageOfPainting setUserInteractionEnabled:YES];
        [bigImageOfPainting setClipsToBounds:YES];
        
        [detailViewController.view addSubview:bigImageOfPainting];
        
    }
    
    [self.navigationController pushViewController:detailViewController animated:YES];

}

- (void) showWebView{
    WebVC *moreInfoWebVC = [self.storyboard instantiateViewControllerWithIdentifier:@"MoreInfoWebVC"];
	moreInfoWebVC.infoUrl = [[NSURL alloc] initWithString:tempArtStyle.moreInfoLink];
	moreInfoWebVC.barTitle = tempArtStyle.styleName;
	[self.navigationController presentModalViewController:moreInfoWebVC animated:YES];
}

@end
