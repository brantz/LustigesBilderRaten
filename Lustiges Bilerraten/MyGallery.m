//
//  MyGallery.m
//  Lustiges Bilderraten
//
//  Created by Sarah Bechtle on 07.01.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MyGallery.h"
#import "Galerie.h"

@implementation MyGallery
@synthesize paintingsArray,context;


- (void) addPainting:(Painting*) painting {
    [paintingsArray addObject:painting];
    
    PEMAppDelegate* appDelegate = (PEMAppDelegate *)[[UIApplication sharedApplication] delegate];
    context = [appDelegate managedObjectContext];
    NSData *imageData = UIImagePNGRepresentation(painting.picture);
    Galerie *myGallery = [NSEntityDescription insertNewObjectForEntityForName:@"Galerie" inManagedObjectContext:context];
    myGallery.paintingName = painting.nameOfPainting;
    myGallery.paintingImg = imageData;

    NSError *error;
    if (![context save:&error]) {
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
    }
    }


@end
