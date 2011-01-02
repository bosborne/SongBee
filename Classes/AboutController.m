//
//  AboutController.m
//  SongBee
//
//  Created by Brian Osborne on 12/31/10.
//  Copyright 2011 Brian Osborne. All rights reserved.
//

#import "AboutController.h"
#import "SongBeeDelegate.h"

@implementation AboutController

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc. that aren't in use.
}

// viewDidLoad does additional setup after loading the view, typically from a nib.
// Here we're just reading HTML and the control of the *about UIWebView happens in RootController:pushedAboutButton()
- (void)viewDidLoad {
	// Create a URL object using name of file in Resources/
	NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"About" ofType:@"html"]];
	// URL Request Object
	NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
	// Load the request in the UIWebView.
	[about loadRequest:requestObj];
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)dealloc {
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
