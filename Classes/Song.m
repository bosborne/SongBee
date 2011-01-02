//
//  Song.m
//  SongBee
//
//  Created by Brian Osborne on 12/30/10.
//  Copyright 2011 Brian Osborne. All rights reserved.
//

#import "Song.h"

@implementation Song

@synthesize songId;
@synthesize songName;
@synthesize songSong;
@synthesize songArtist;
@synthesize songSource;

-(void) dealloc { 
	[songId release];
	[songName release];
	[songSong release];
	[songArtist release];
	[songSource release];

	[super dealloc];
}

@end
