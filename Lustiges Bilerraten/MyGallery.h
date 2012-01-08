//
//  MyGallery.h
//  Lustiges Bilderraten
//
//  Created by Sarah Bechtle on 07.01.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "Painting.h"

@interface MyGallery : NSObject {
    NSMutableArray* paintingsArray;
}

@property(nonatomic,strong) NSMutableArray* paintingsArray;
- (void) addPainting:(Painting*)painting;


@end
