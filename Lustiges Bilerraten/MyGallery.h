//
//  MyGallery.h
//  Lustiges Bilderraten
//
//  Created by Sarah Bechtle on 07.01.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "Painting.h"

@interface MyGallery: NSManagedObject {
    NSMutableArray* paintingsArray;
    NSManagedObjectContext *context;
}

@property(nonatomic,strong) NSMutableArray* paintingsArray;
@property(nonatomic,strong) NSManagedObjectContext* context;

- (void) addPainting:(Painting*)painting;


@end
