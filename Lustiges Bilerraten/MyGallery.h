//
//  MyGallery.h
//  Lustiges Bilderraten
//
//  Created by Sarah Bechtle on 07.01.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "Painting.h"
#import "Galerie.h"


@interface MyGallery: NSManagedObject {
    NSMutableArray* paintingsArray;
    Galerie *myGallery;
    NSManagedObjectContext* context;
}

@property(nonatomic,strong) NSMutableArray* paintingsArray;

- (void) addPainting:(Painting*)painting andBool: (BOOL) coreData;
- (MyGallery*) initWith;
-(void) deleatDatabase;


@end
