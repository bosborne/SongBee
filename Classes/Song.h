//
//  Song.h
//  SongBee
//
//  Created by Brian Osborne on 12/30/10.
//  Copyright 2011 Brian Osborne. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Song: NSObject {
	NSNumber *songId;
	NSString *songName; 
	NSString *songSong;
	NSString *songArtist;
	NSString *songSource;
}

@property (nonatomic, retain) NSNumber *songId;
@property (nonatomic, retain) NSString *songName;
@property (nonatomic, retain) NSString *songSong;
@property (nonatomic, retain) NSString *songArtist;
@property (nonatomic, retain) NSString *songSource;

@end
