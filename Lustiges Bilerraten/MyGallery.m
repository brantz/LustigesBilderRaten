//
//  MyGallery.m
//  Lustiges Bilderraten
//
//  Created by Sarah Bechtle on 07.01.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MyGallery.h"

@implementation MyGallery
@synthesize paintingsArray;

- (void) addPainting:(Painting*) painting {
    [paintingsArray addObject:painting];
    
    NSData *imageData = UIImagePNGRepresentation(painting.picture);
    myGallery.paintingName = painting.nameOfPainting;
    myGallery.paintingImg = imageData;
    NSError *error;
    if (![context save:&error]) {
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
    }
    }

- (MyGallery*) initWith {
    
    PEMAppDelegate* appDelegate = (PEMAppDelegate *)[[UIApplication sharedApplication] delegate];
    context=appDelegate.context;    
    myGallery = [NSEntityDescription insertNewObjectForEntityForName:@"Galerie" inManagedObjectContext:context];

    return self;
}

@end
