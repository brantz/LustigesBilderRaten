//
//  Galerie.h
//  Lustiges Bilderraten
//
//  Created by Sarah Bechtle on 18.01.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Galerie : NSManagedObject

@property (nonatomic, retain) NSData * paintingImg;
@property (nonatomic, retain) NSString * paintingName;

@end
