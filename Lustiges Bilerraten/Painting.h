//
//  Painting.h
//  Lustiges Bilderraten
//
//  Created by Sarah Bechtle on 07.01.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ArtStyle.h"

@interface Painting : NSObject {
    NSString* nameOfPainting;
    ArtStyle* styleOfPainting;
    NSString* artist;
    UIImage* picture;
}

@property(nonatomic, strong) NSString* nameOfPainting;
@property(nonatomic, strong) ArtStyle* styleOfPainting;
@property(nonatomic, strong) NSString* artist;
@property (nonatomic, strong) UIImage* picture;

@end
