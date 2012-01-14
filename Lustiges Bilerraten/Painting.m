//
//  Painting.m
//  Lustiges Bilderraten
//
//  Created by Sarah Bechtle on 07.01.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Painting.h"

@implementation Painting
@synthesize nameOfPainting,styleOfPainting,artist,picture;


- (Painting*) initPaintingWithFoto: (UIImage*) foto {
    self->picture = foto;
    [self findPaintingName];
    [self findArtist];
    [self findStyleOfPainting];
    return self;
}

//TODO Name des Bildes muss gesetzt werden
-(void) findPaintingName {
    
}

//TODO Artisten des Bildes setzen
-(void) findArtist {
     
}

//TODO Kuststil setzen 
-(void) findStyleOfPainting{    
    NSString* artStyle = NULL;  
    styleOfPainting = [[ArtStyle alloc] initArtStyleWithName:artStyle];
    
}

@end
