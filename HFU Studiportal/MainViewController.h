//
//  MainViewController.h
//  HFU Studiportal
//
//  Created by Christian Würthner on 19.01.15.
//  Copyright (c) 2015 Hochschule Furtwangen University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RefreshTask.h"

@interface MainViewController : DialogHostViewController <RefreshTaskDelegate>

@property (weak, nonatomic) IBOutlet UIBarButtonItem *btRefresh;
- (IBAction)refresh:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
