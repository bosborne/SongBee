//
//  SongController.h
//  SongBee
//
//  Created by Brian Osborne on 12/30/10.
//  Copyright 2011 Brian Osborne. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SongController : UIViewController {
	NSIndexPath *index;
	IBOutlet UITextView *songView;
	IBOutlet UILabel *artistView;
	IBOutlet UILabel *sourceView;
}

- (id)initWithIndexPath:(NSIndexPath *)indexPath;

@end
