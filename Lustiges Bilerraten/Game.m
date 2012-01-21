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
@synthesize myPainting,totalPoints,question;

-(Game*) initGameWithPic: (UIImage*) pic {
    myGallery = [[MyGallery alloc]init];
    self.totalPoints = 0;
    self->picture = pic;
    [self findPainting  ];
    [self newQuestionOfPainting];
    return self;
}

//um die bereits gespielten bilder in die Galerie zu laden
-(void) getPaintingsFromCoreData{
    
    NSError *error;
    NSString* nameOfPainting;
    UIImage* pictureOfPainting;
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Galerie" inManagedObjectContext:myGallery.context];
    [fetchRequest setEntity:entity];
    
    NSArray *fetchedObjects = [myGallery.context executeFetchRequest:fetchRequest error:&error];
    
    for (Galerie *info in fetchedObjects) {
        nameOfPainting = info.paintingName;
        pictureOfPainting = [UIImage imageWithData:info.paintingImg];
        [myGallery addPainting:[[Painting alloc] initPaintingWithName:nameOfPainting andPic:pictureOfPainting]];
    }          
}

-(void) findPainting
{   if(picture!=nil) {
    myPainting = [[Painting alloc] initPaintingWithFoto:picture];
    [myGallery addPainting:myPainting];
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
    picture = foto;
    [self findPainting];
    [self newQuestionOfPainting];
}

//TODO: methode die das spiel speichert wenn man das spiel beendet
@end
