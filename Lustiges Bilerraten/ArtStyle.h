//
//  ArtStyle.h
//  Lustiges Bilderraten
//
//  Created by Sarah Bechtle on 07.01.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "PEMAppDelegate.h"

@interface ArtStyle : NSObject {
    NSString* styleName;
    NSString* moreInfoLink;
    NSString* infoText;
    NSString* shortText;
    NSString* hints;
}

@property (nonatomic,strong) NSString* styleName;
@property(nonatomic, strong) NSString* moreInfoLink;
@property(nonatomic, strong) NSString* infoText;
@property(nonatomic, strong) NSString* shortText;

-(ArtStyle*) initArtStyleWithName: (NSString*) style;
-(void) initFromDataBase:(NSString*) link andText: (NSString*) text  andShortText: (NSString*) shortT;
-(void) readStyleFromDB;
@end
