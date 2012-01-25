//
//  Answer.m
//  Lustiges Bilderraten
//
//  Created by Sarah Bechtle on 07.01.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Answer.h"

@implementation Answer

-(Answer*) initWithAnswer:(BOOL) answ andPainting:(Painting*)paint andPoints:(int)point {
    self->answer = answ;
    self->painting = paint;
    self->infoText = painting.styleOfPainting.shortText;
    self->points = point;
    return self;
}

-(int) pointsToStars {
    int stars = (points*5)/1000;
    return stars;
}


@end
