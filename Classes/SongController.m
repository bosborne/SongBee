//
//  SongController.m
//  SongBee
//
//  Created by Brian Osborne on 12/30/10.
//  Copyright 2011 Brian Osborne. All rights reserved.
//

#import "SongController.h"
#import "SongBeeDelegate.h" 
#import "Song.h"

@implementation SongController

// initialize the class by passing in the index (NSIndexPath) of the selected UITableViewCell in the main table view
- (id)initWithIndexPath: (NSIndexPath *)indexPath {
	if ( self == [super init] ) {
		index = indexPath; 
	}
	return self;
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidLoad {
	SongBeeDelegate *delegate = (SongBeeDelegate *) [[UIApplication sharedApplication] delegate]; 
	Song *thisSong = [delegate.songs objectAtIndex:index.row];
	
	self.title = thisSong.songName;
	
	songView.text = thisSong.songSong; 
	artistView.text = thisSong.songArtist; 
	sourceView.text = thisSong.songSource; 

	songView.editable = NO; 
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)dealloc {
	[index release]; 
	[songView release]; 
	[artistView release];
	[sourceView release];
    [super dealloc];
}

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

@end
