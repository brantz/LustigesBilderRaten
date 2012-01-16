//
//  Painting.h
//  Lustiges Bilderraten
//
//  Created by Sarah Bechtle on 07.01.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "ArtStyle.h"
#import "PEMAppDelegate.h"


@interface Painting : NSObject {
    NSString* nameOfPainting;
    ArtStyle* styleOfPainting;
    NSString* artist;
    UIImage* picture;
    NSString* year;
}

@property(nonatomic, strong) NSString* nameOfPainting;
@property(nonatomic, strong) ArtStyle* styleOfPainting;
@property(nonatomic, strong) NSString* artist;
@property (nonatomic, strong)UIImage* picture;
@property(nonatomic, strong) NSString* year;

-(Painting*) initPaintingWithFoto: (UIImage*) foto;
-(void) findPaintingName;
-(void) initFromDataBase:(NSString*) myArtist andStyle: (NSString*) myStyle andYear: (NSString*) myYear;
-(void) findStyleOfPainting:(NSString*)style;
- (void) readPaintingFromDB;
@end
