//
//  SideMenuController.h
//  HFU Studiportal
//
//  Created by Christian Würthner on 19.01.15.
//  Copyright (c) 2015 Hochschule Furtwangen University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StudiportalData.h"

@interface CategoryMenuController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property UITableView* table;
@property (nonatomic) StudiportalData* data;

@end