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

-(Game*) initGameWithPic: (UIImage*) pic {
    myGallery = [[MyGallery alloc]initWith];
    self.totalPoints = 0;
    self->picture = pic;
    [self findPainting  ];
    if(myPainting) {
    [self newQuestionOfPainting];
    }
    return self;
}

//um die bereits gespielten bilder in die Galerie zu laden
-(void) getPaintingsFromCoreData{
    NSLog(@"getPaintingsfromcoredata");
    NSError *error;
    NSString* nameOfPainting;
    UIImage* pictureOfPainting;
    NSManagedObjectContext* context;
    PEMAppDelegate* appDelegate = (PEMAppDelegate *)[[UIApplication sharedApplication] delegate];
    context=appDelegate.context;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Galerie" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    
    for (Galerie *info in fetchedObjects) {
        nameOfPainting = info.paintingName;
        pictureOfPainting = [UIImage imageWithData:info.paintingImg];
        NSLog(@"nameofpaa %@", nameOfPainting);
        if(nameOfPainting && pictureOfPainting) {
        [myGallery addPainting:[[Painting alloc] initPaintingWithName:nameOfPainting andPic:pictureOfPainting]andBool:false];
        }
    }    
    
   
}

-(void) findPainting
{   
    if(picture) {
    NSLog(@"picture und ich bin hier %@",picture);
    myPainting = [[Painting alloc] initPaintingWithFoto:picture];
    [myGallery addPainting:myPainting andBool:true];
    }
}
-(void) quitGame {
    
}
-(Question*) newQuestionOfPainting{
    question = [[Question alloc]initQuestionWith:myPainting];
    return question;
}

-(void) nextRound: (int)points andFoto:(UIImage*) foto{
    totalPoints = totalPoints + points;
    NSLog(@"points %i",totalPoints);
    NSLog(@"!!!!!!!!!!!!!!!!!: %i", points);
    picture = foto;
    [self findPainting];
    [self newQuestionOfPainting];
}

//TODO: methode die das spiel speichert wenn man das spiel beendet
@end
