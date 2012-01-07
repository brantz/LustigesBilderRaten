//
//  Answer.h
//  Lustiges Bilderraten
//
//  Created by Sarah Bechtle on 07.01.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Painting.h"

@interface Answer : NSObject {
    BOOL answer;
    Painting* painting;
    NSString* infoText;
    int points;
}

-(int) pointsToStars;
-(UIImage*) takeNewPicture; 

@end
