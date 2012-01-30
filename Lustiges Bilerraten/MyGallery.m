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

- (void) addPainting:(Painting*) painting andBool:(BOOL)coreData{
    [paintingsArray addObject:painting];
    NSLog(@"???????????????????????array count %i",paintingsArray.count );
    
    if(coreData) {
        NSLog(@"mit core data");
    NSData *imageData = UIImagePNGRepresentation(painting.picture);
    myGallery.paintingName = painting.nameReal;
    myGallery.paintingImg = imageData;
    NSError *error;
    if (![context save:&error]) {
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
    }
    }
    
}

- (MyGallery*) initWith {
    
    PEMAppDelegate* appDelegate = (PEMAppDelegate *)[[UIApplication sharedApplication] delegate];
    context=appDelegate.context;    
    myGallery = [NSEntityDescription insertNewObjectForEntityForName:@"Galerie" inManagedObjectContext:context];
    paintingsArray = [[NSMutableArray alloc]init];
    return self;
}

-(void) deleatDatabase {
    
    PEMAppDelegate *appDelegate = (PEMAppDelegate *)[[UIApplication sharedApplication] delegate];
    NSPersistentStore *store = [appDelegate.persistentStoreCoordinator.persistentStores lastObject];
    NSError *error = nil;
    NSURL *storeURL = store.URL;
    [appDelegate.persistentStoreCoordinator removePersistentStore:store error:&error];
    [[NSFileManager defaultManager] removeItemAtURL:storeURL error:&error];
    
        
    if (![appDelegate.persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
    }
}


@end
