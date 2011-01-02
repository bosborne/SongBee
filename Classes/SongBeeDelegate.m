//
//  SongBeeAppDelegate.m
//  SongBee
//
//  Created by Brian Osborne on 12/30/10.
//  Copyright 2011 Brian Osborne. All rights reserved.
//

#import "SongBeeDelegate.h"
#import "RootController.h"
#import "SearchController.h"
#import "Song.h";
#import <sqlite3.h>

@implementation SongBeeDelegate

@synthesize window;
@synthesize viewController;
@synthesize songs;
@synthesize navController;

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    

/*	Song *bluemoon = [[Song alloc] init]; 
	bluemoon.songId = @"1"; 
	bluemoon.songName = @"Blue Moon"; 
	bluemoon.songSong = @"Without a song in my heart ..."; 
	bluemoon.songArtist = @"Elvis Presley"; 
	bluemoon.songSource = @"http://chordie.com"; 
	self.songs = [[NSMutableArray alloc] initWithObjects:bluemoon, nil];
	[bluemoon release];  */
	 
	songs = [[NSMutableArray alloc] init]; 
	NSString *filePath = [self copyDatabaseToDocuments]; 
	[self readSongsFromDatabaseWithPath:filePath];
    
	// Override point for customization after application launch.
	
    navController.viewControllers = [NSArray arrayWithObject:viewController]; 
	[window addSubview:navController.view];
	[self.window makeKeyAndVisible];

    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}

#pragma mark Database Methods

- (NSString *)copyDatabaseToDocuments {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsPath = [paths objectAtIndex:0];
    NSString *filePath = [documentsPath stringByAppendingPathComponent:@"songs.sqlite"];
	
    if ( ![fileManager fileExistsAtPath:filePath] ) {
        NSString *bundleCopy = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"songs.sqlite"];
		[fileManager copyItemAtPath:bundleCopy toPath:filePath error:nil];
    }
    return filePath;
}

-(void) readSongsFromDatabaseWithPath:(NSString *)filePath {
	sqlite3 *database;
	
	if (sqlite3_open([filePath UTF8String], &database) == SQLITE_OK) {
		const char *sqlStatement = "select name,song,source,artist from songs";
		sqlite3_stmt *compiledStatement;
		
		if (sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
			while ( sqlite3_step(compiledStatement) == SQLITE_ROW ) {
				
				NSString *songName = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 0)];
				NSString *songSong = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 1)];
				NSString *songSource = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 2)];
				NSString *songArtist = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 3)];
				
				Song *newSong = [[Song alloc] init];
				newSong.songName = songName;
				newSong.songSong = songSong;
				newSong.songSource = songSource;
				newSong.songArtist = songArtist;
				
				[self.songs addObject:newSong];
				[newSong release];
			}
		}
		sqlite3_finalize(compiledStatement);
	}
	sqlite3_close(database);
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
    [viewController release];
    [window release];
	[songs release];
    [super dealloc];
}


@end
