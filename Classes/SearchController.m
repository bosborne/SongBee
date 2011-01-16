//
//  SearchController.m
//  SongBee
//
//  Created by Brian Osborne on 12/31/10.
//  Copyright 2011 Brian Osborne. All rights reserved.
//

#import "SearchController.h"

@implementation SearchController

@synthesize pickerView;
@synthesize searchBar;

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	// populate the picker view
	webSites = [[NSMutableArray alloc] init];
	[webSites addObject:@"chordie.com"];
	[webSites addObject:@"ultimate-guitar.com"];
	[webSites addObject:@"guitaretabs.com"];
	[webSites addObject:@"yourchords.com"];
	
	// Does not work in this context but this method can resize any UIView object
	// pickerView.transform = CGAffineTransformMakeScale(0.5, 0.5);
}

#pragma mark UIPickerView Methods

- (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component {
	return [webSites count];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView {
	return 1;
}

- (NSString *)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
	return [webSites objectAtIndex:row];
}

/* added from example
- (NSInteger)numberOfSectionsInTableView:(UITableView *)aTableView {
	// Return the number of sections.
	return 1;
}

- (NSInteger)tableView:(UITableView *)aTableView numberOfRowsInSection:(NSInteger)section {
	// Return the number of rows in the section.
	return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	static NSString *CellIdentifier = @"CellIdentifier";
	
	// Dequeue or create a cell of the appropriate type.
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
		cell.accessoryType = UITableViewCellAccessoryNone;
	}
	
	// Configure the cell.
	cell.textLabel.text = [NSString stringWithFormat:@"Row %d", indexPath.row];
	return cell;
}

- (void)mockSearch:(NSTimer*)timer
{
	[_data removeAllObjects];
	int count = 1 + random() % 20;
	for (int i = 0; i < count; i++) {
		[_data addObject:timer.userInfo];
	}
	[self.searchDisplayController.searchResultsTableView reloadData];
}

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
	[NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(mockSearch:) userInfo:searchString repeats:NO];
	return NO;
}

added from example */

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)dealloc {
    [super dealloc];
}

/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations.
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */

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

@end
