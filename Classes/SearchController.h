//
//  SearchController.h
//  SongBee
//
//  Created by Brian Osborne on 12/31/10.
//  Copyright 2011 Brian Osborne. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SearchController : UIViewController 
<UIPickerViewDataSource, UIPickerViewDelegate,UISearchDisplayDelegate, UITableViewDataSource, UITableViewDelegate> {
	IBOutlet UIPickerView *pickerView;
	NSMutableArray *webSites;
	IBOutlet UISearchBar *searchBar;
	NSMutableArray* searchResults;
	NSString *selectedSite;
}

-(NSString *)searchByURL:(NSString *) searchString;
-(NSString *)searchChordie: (NSString *) searchString;
-(NSString *)searchGuitartabs: (NSString *) searchString;
-(NSString *)searchUltimateguitar: (NSString *) searchString;
-(NSString *)searchYourchords: (NSString *) searchString;

@property (nonatomic, retain) IBOutlet UIPickerView *pickerView;
@property (nonatomic, retain) IBOutlet UISearchBar *searchBar;

@end

