//
//  RootController.h
//  SongBee
//
//  Created by Brian Osborne on 12/30/10.
//  Copyright 2011 Brian Osborne. All rights reserved.
//
// Controls the first page containing the Song list

#import <UIKit/UIKit.h>

@interface RootController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
	UITableView *tableView;
	NSMutableArray *songs;
	IBOutlet UIBarButtonItem *searchButton;
	IBOutlet UIBarButtonItem *aboutButton;
}

-(IBAction) pushedSearchButton:(id) sender;
-(IBAction) pushedAboutButton:(id) sender;

@property (nonatomic, retain) IBOutlet UITableView *tableView;

@end

