//
//  Game.m
//  Lustiges Bilderraten
//
//  Created by Sarah Bechtle on 07.01.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Game.h"
#import "Galerie.h"

@implementation Game
@synthesize myPainting,totalPoints,question,myGallery;

-(Game*) initGameWithPic: (UIImage*) pic
{
    myGallery = [[MyGallery alloc]initWith];
    self.totalPoints = 0;
    self->picture = pic;
    [self findPainting  ];
    if(myPainting && myPainting.nameFromSearchQuery && self.myPainting.nameFromSearchQuery.length!=0 && ![self.myPainting.nameFromSearchQuery isEqualToString:@"FFFFFF-"])
	{
    [self newQuestionOfPainting];
    }
    return self;
}

//um die bereits gespielten bilder in die Galerie zu laden
-(void) getPaintingsFromCoreData
{
    NSLog(@"getPaintingsfromcoredata");
    NSError *error;
    NSString* nameReal;
    UIImage* pictureOfPainting;
    NSManagedObjectContext* context;
    PEMAppDelegate* appDelegate = (PEMAppDelegate *)[[UIApplication sharedApplication] delegate];
    context=appDelegate.context;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Galerie" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    
    for (Galerie *info in fetchedObjects)
	{
        nameReal = info.paintingName;
        pictureOfPainting = [UIImage imageWithData:info.paintingImg];
        if(nameReal && pictureOfPainting)
		{
        [myGallery addPainting:[[Painting alloc] initPaintingWithName:nameReal andPic:pictureOfPainting]andBool:false];
        }
    }    
}

-(void) findPainting
{   
    if(picture) {
    myPainting = [[Painting alloc] initPaintingWithFoto:picture];
        if(myPainting.nameFromSearchQuery && self.myPainting.nameFromSearchQuery.length!=0 && ![self.myPainting.nameFromSearchQuery isEqualToString:@"FFFFFF-"])
		{
                [myGallery addPainting:myPainting andBool:true];
        }
    }
}
-(void) quitGame {
    
}
-(Question*) newQuestionOfPainting{
    question = [[Question alloc]initQuestionWith:myPainting];
    return question;
}

-(void) nextRound: (int)points andFoto:(UIImage*) foto{
    myPainting.paintingIsInDB=false;
    totalPoints = totalPoints + points;
    picture = foto;
    [self findPainting];
    [self newQuestionOfPainting];
}

//TODO: methode die das spiel speichert wenn man das spiel beendet
@end
