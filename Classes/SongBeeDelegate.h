//
//  SongBeeAppDelegate.h
//  SongBee
//
//  Created by Brian Osborne on 12/30/10.
//  Copyright 2011 Brian Osborne. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootController;

@interface SongBeeDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    RootController *viewController;
	NSMutableArray *songs;
	UINavigationController *navController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet RootController *viewController;
@property (nonatomic, retain) NSMutableArray *songs;
@property (nonatomic, retain) IBOutlet UINavigationController *navController;

-(NSString *)copyDatabaseToDocuments;
-(void) readSongsFromDatabaseWithPath:(NSString *)filePath;

@end
