//
//  SearchController.m
//  SongBee
//
//  Created by Brian Osborne on 12/31/10.
//  Copyright 2011 Brian Osborne. All rights reserved.
//

#import "SearchController.h"
#import "SearchDelegate.h"

@implementation SearchController

@synthesize pickerView;
@synthesize searchBar;

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	// default is chordie.com
	selectedSite = @"chordie.com";
	
	// populate the picker view
	webSites = [[NSMutableArray alloc] init];
	[webSites addObject:@"chordie.com"];
	[webSites addObject:@"ultimate-guitar.com"];
	[webSites addObject:@"guitaretabs.com"];
	[webSites addObject:@"yourchords.com"];
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

- (void)pickerView:(UIPickerView *)thePickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
	selectedSite = [webSites objectAtIndex:row];
	NSLog(@"Selected site: %@", selectedSite);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)aTableView {
	// Return the number of sections.
	return 1;
}

- (NSInteger)tableView:(UITableView *)aTableView numberOfRowsInSection:(NSInteger)section {
	//return [_data count]; 
	return 10; // works
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
	// 	cell.textLabel.text = [NSString stringWithFormat:@"Row %d: %@", indexPath.row, [_data objectAtIndex:indexPath.row]];
	return cell;
} 

- (void) searchBarSearchButtonClicked:(UISearchBar*) searchBar {
    NSString *searchText = [searchBar.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
	
	if ([selectedSite isEqualToString:@"chordie.com"]) {
		NSLog(@"here in chordie: %@", selectedSite);
		NSString *resp = [self searchChordie:searchText];
	} else if ([selectedSite isEqualToString:@"guitaretabs.com"]) {
		NSString *resp = [self searchGuitartabs:searchText];
	} else if ([selectedSite isEqualToString:@"ultimate-guitar.com"]) {
		NSString *resp = [self searchUltimateguitar:searchText];
	} else if ([selectedSite isEqualToString:@"yourchords.com"]) {
		NSString *resp = [self searchYourchords:searchText];
	} else {
		//[];
	}
}

- (NSString *)searchChordie: (NSString *)searchString {
	// http://www.chordie.com/?q=SEARCHSTRING&np=0&ps=10&wf=2221&s=RPD&wf=2221&wm=wrd&type=&sp=1&sy=1&cat=&ul=&np=0
			
	NSString *searchURL = [[NSString alloc] initWithFormat:@"http://www.chordie.com/?q=%@%@", searchString, 
						   @"&np=0&ps=10&wf=2221&s=RPD&wf=2221&wm=wrd&type=&sp=1&sy=1&cat=&ul=&np=0"];
	
	// NSLog(@"url: %@", searchURL);
	NSString *resp = [self searchByURL: searchURL];	
	return resp;
}

- (NSString *)searchGuitartabs: (NSString *)searchString {
	//
	
	NSString *resp = [self searchByURL: searchString];
	return resp;
}

- (NSString *)searchUltimateguitar: (NSString *)searchString {
	// 
	
	NSString *resp = [self searchByURL: searchString];
	return resp;
}

- (NSString *)searchYourchords: (NSString *)searchString {
	// 
		
	NSString *resp = [self searchByURL: searchString];
	return resp;
}

- (NSString *)searchByURL:(NSString *) searchString {
	// [searchResults removeAllObjects];
	NSURLResponse *resp = nil;
	NSError *err = nil;
	
	NSString *escapedString =[searchString stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding];
	NSURL *theUrl = [[NSURL URLWithString:escapedString] retain]; 
	NSURLRequest *theRequest = [NSURLRequest requestWithURL:theUrl];

	NSData *theResponse = [NSURLConnection sendSynchronousRequest: theRequest returningResponse: &resp error: &err];
	NSString *theString = [[NSString alloc] initWithData:theResponse encoding:NSUTF8StringEncoding]; 
	
	NSLog(@"response: %@", theString);
	return theString;
}

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString {
	// http://www.chordie.com/?q=SEARCHSTRING&np=0&ps=10&wf=2221&s=RPD&wf=2221&wm=wrd&type=&sp=1&sy=1&cat=&ul=&np=0
	
	// NSLog(@"input: %@", searchString);	
	
	NSString *unescapedString = [NSString stringWithFormat:@"http://www.chordie.com/?q=shady grove&np=0&ps=10&wf=2221&s=RPD&wf=2221&wm=wrd&type=&sp=1&sy=1&cat=&ul=&np=0"];
	NSString *escapedString =[unescapedString stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding];
	
	// When you call a method, the first thing in the brackets is the object (in this case, self) 
	// and then the method name, and then the parameter.
	[self searchByURL: escapedString]; // not [searchByURL: searchString]
	
	return YES;
}

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
	[pickerView release];
	[searchBar release];
	[selectedSite release];
	[searchResults release];
	[webSites release];
    [super dealloc];
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
