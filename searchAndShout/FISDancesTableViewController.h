//
//  FISDancesTableViewController.h
//  searchAndShout
//
//  Created by Joe Burgess on 7/2/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FISDataStore;

@interface FISDancesTableViewController : UITableViewController

@property (strong, nonatomic) FISDataStore *store;

@end
