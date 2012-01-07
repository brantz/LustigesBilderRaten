//
//  ArtStyle.m
//  Lustiges Bilderraten
//
//  Created by Sarah Bechtle on 07.01.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ArtStyle.h"

@implementation ArtStyle
@synthesize styleName,moreInfoLink,infoText,shortText;

-(ArtStyle*) initArtStyleWithName: (NSString*) style{
    self->styleName=style;
    [self findInfoText];
    [self findmoreInfoLink];
    [self findShortText];
    return self;
}

-(void) findmoreInfoLink{
    //infoLink anhand von stil finden
}
-(void) findInfoText{
    // infoText anhand von stil finden
}
-(void) findShortText{
    // kurzer info text anhand von stil finden
}
@end
