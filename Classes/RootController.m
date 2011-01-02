//
//  RootController.m
//  SongBee
//
//  Created by Brian Osborne on 12/30/10.
//  Copyright 2011 Brian Osborne. All rights reserved.
//

#import "RootController.h"
#import "SongBeeDelegate.h" 
#import "Song.h"
#import "SongController.h"
#import "SearchController.h"
#import "AboutController.h"

@implementation RootController

@synthesize tableView; 

#pragma mark Instance Methods

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	self.title = @"Songs";
	SongBeeDelegate *delegate = (SongBeeDelegate *)[[UIApplication sharedApplication] delegate]; 
	songs = delegate.songs;
}

-(IBAction) pushedSearchButton:(id) sender {
	SongBeeDelegate *delegate = (SongBeeDelegate *)[[UIApplication sharedApplication] delegate];
	SearchController *search = [[SearchController alloc] init];
	// push the view controller onto the top of the UINavigationController stack, making its view the current view
	[delegate.navController pushViewController:search animated:YES]; 
	[search release];
}

-(IBAction) pushedAboutButton:(id) sender {
	SongBeeDelegate *delegate = (SongBeeDelegate *)[[UIApplication sharedApplication] delegate];
	AboutController *about = [[AboutController alloc] init];
	// push the view controller onto the top of the UINavigationController stack, making its view the current view
	[delegate.navController pushViewController:about animated:YES]; 
	[about release];
}

- (void)dealloc {
	[searchButton release];
	[tableView release];
	[songs release];
    [super dealloc];
}

#pragma mark UITableViewDataSource Methods

- (UITableViewCell *)tableView:(UITableView *)tv cellForRowAtIndexPath:(NSIndexPath *)indexPath {

	UITableViewCell *cell = [tv dequeueReusableCellWithIdentifier:@"cell"];
	
	if( nil == cell ) {
		cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:@"cell"] autorelease];
	}
	
	Song *thisSong = [songs objectAtIndex:indexPath.row]; 
	cell.textLabel.text = thisSong.songName;

	return cell;
}

- (NSInteger)tableView:(UITableView *)tv numberOfRowsInSection:(NSInteger)section {
	return [songs count];
}

#pragma mark UITableViewDelegate Methods

- (void)tableView:(UITableView *)tv didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	/* This would put up an alert containing the song's name and song if the cell is clicked
	Song *thisSong = [songs objectAtIndex:indexPath.row]; 
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:thisSong.songName message:thisSong.songSong
				delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil]; 
	[alert show];
	[alert autorelease];
	*/
	
	SongBeeDelegate *delegate = (SongBeeDelegate *)[[UIApplication sharedApplication] delegate];
	// SongController gets initialized with the index of the selected song
	SongController *song = [[SongController alloc] initWithIndexPath:indexPath];
	// Push the view controller onto the top of the UINavigationController stack, making its view the current view
	[delegate.navController pushViewController:song animated:YES]; 
	[song release];
	
	[tv deselectRowAtIndexPath:indexPath animated:YES];
}

/*
 // The designated initializer. Override to perform setup that is required before the view is loaded.
 - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
 self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
 if (self) {
 // Custom initialization
 }
 return self;
 }
 */

/*
 // Implement loadView to create a view hierarchy programmatically, without using a nib.
 - (void)loadView {
 }
 */

/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */

@end
