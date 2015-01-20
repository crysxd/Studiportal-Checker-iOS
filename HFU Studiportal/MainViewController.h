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
#import "RESideMenu.h"
#import "CategoryMenuController.h"

@interface MainViewController : DialogHostViewController <RefreshTaskDelegate,  CategoryMenuControllerDelegate, UITableViewDelegate, UITableViewDataSource>

@property BOOL loggedIn;
@property StudiportalData *data;
@property ExamCategory *selectedCategory;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *btMenu;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)showMenu:(id)sender;

-(void) showLogin;
-(void)updateSideMenuControllerData;

@end
