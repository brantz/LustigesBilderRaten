//
//  PEMAppDelegate.h
//  Lustiges Bilerraten
//
//  Created by Raphael Teßmer on 11.12.11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>

@interface PEMAppDelegate : UIResponder <UIApplicationDelegate>{
    
    NSString *databaseName;
	NSString *databasePath;
    NSManagedObjectContext *context;
    
}

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (nonatomic,strong)    NSString* databasePath;
@property(nonatomic,strong) NSManagedObjectContext* context;


- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;
- (void) checkAndCreateDatabase;


@end
