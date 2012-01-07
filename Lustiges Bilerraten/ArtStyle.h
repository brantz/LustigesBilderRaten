//
//  ArtStyle.h
//  Lustiges Bilderraten
//
//  Created by Sarah Bechtle on 07.01.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ArtStyle : NSObject {
    NSString* styleName;
    NSString* moreInfoLink;
    NSString* infoText;
    NSString* shortText;
}

@property (nonatomic,strong) NSString* styleName;
@property(nonatomic, strong) NSString* moreInfoLink;
@property(nonatomic, strong) NSString* infoText;
@property(nonatomic, strong) NSString* shortText;

@end
