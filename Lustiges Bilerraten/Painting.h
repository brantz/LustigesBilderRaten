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
    NSString* nameFromSearchQuery;
	NSString* nameReal;
    ArtStyle* styleOfPainting;
    NSString* artist;
    UIImage* picture;
    NSString* year;
	NSString* link;
    BOOL paintingIsInDB;
}

@property(nonatomic, strong) NSString* nameFromSearchQuery;
@property(nonatomic, strong) NSString* nameReal;
@property(nonatomic, strong) ArtStyle* styleOfPainting;
@property(nonatomic, strong) NSString* artist;
@property (nonatomic, strong)UIImage* picture;
@property(nonatomic, strong) NSString* year;
@property(nonatomic, strong) NSString* link;
@property BOOL paintingIsInDB;

-(Painting*) initPaintingWithFoto: (UIImage*) foto;
-(void) findPaintingName:(UIImage*) foto;
-(void) initFromDataBase:(NSString*) myArtist andStyle: (NSString*) myStyle andYear: (NSString*) myYear andLink: (NSString*) myLink andName: (NSString*) myName;
-(void) findStyleOfPainting:(NSString*)style;
- (void) readPaintingFromDB;
-(int)calculateHighestValueIndex:(NSMutableArray*)myDataArray;
- (Painting*) initPaintingWithName:(NSString*) name andPic: (UIImage*) pic;
@end
