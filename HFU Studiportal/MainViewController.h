//
//  MainViewController.h
//  HFU Studiportal
//
//  Created by Christian Würthner on 19.01.15.
//  Copyright (c) 2015 Hochschule Furtwangen University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RefreshTask.h"
#import "LoginStorage.h"

@interface MainViewController : DialogHostViewController <RefreshTaskDelegate,  UITableViewDelegate, UITableViewDataSource>

@property BOOL loggedIn;
@property StudiportalData *data;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *btRefresh;
- (IBAction)refresh:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

-(void) showLogin;

@end
