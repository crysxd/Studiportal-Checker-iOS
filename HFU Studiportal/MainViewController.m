//
//  MainViewController.m
//  HFU Studiportal
//
//  Created by Christian Würthner on 19.01.15.
//  Copyright (c) 2015 Hochschule Furtwangen University. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController()

@end

@implementation MainViewController

-(void)loadView {
    [super loadView];
    self.loggedIn = [[[LoginStorage alloc] init] isLoggedIn];
    self.data = [[StudiportalData alloc] initFromDisk];
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleLightContent;
    
}

-(void)viewDidLoad {
    [super viewDidLoad];
    self.btMenu.tintColor = [UIColor whiteColor];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;

    if(self.loggedIn) {
        RefreshTask *task = [[RefreshTask alloc] initWithDialogHost:nil delegate:self];
        [task start];
    
    } else {
        [self showLoginAnimated:NO];
    
    }
}

-(void)updateSideMenuControllerData {
    CategoryMenuController *sideController = (CategoryMenuController*) self.sideMenuViewController.leftMenuViewController;
    sideController.data = self.data = [[StudiportalData alloc] initFromDisk];
    sideController.delegate = self;
    
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    
    self.sideMenuViewController.panGestureEnabled = YES;

    [self updateSideMenuControllerData];
    
    if(self.data.categoryCount > 0)
        [self categorySelected:[self.data category:0]];

}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
    
}

-(void)refreshCompleteWithError:(RefreshError *)error {
    if(error != nil && [error class] != [NoChangeRefreshError class]) {
        if([error class] == [LoginRefreshError class] && self.loggedIn) {
            [self showErrorDialogWithMessage:error.localizedMessage];
        
        }
    } else {
        [self updateSideMenuControllerData];
        [self.tableView reloadData];
        
    }
    
    if(error != nil && [error class] == [LoginRefreshError class]) {
        [self showLoginAnimated:YES];

    }
}

-(void)showLoginAnimated:(BOOL)animated {
    LoginViewController *loginController = [[LoginViewController alloc] initWithNibName:@"Login" bundle:nil];
    [self.navigationController pushViewController:loginController animated:animated];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.selectedCategory.examCount;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    
    cell.textLabel.text = [self.selectedCategory exam:indexPath.row].name;
    return cell;
    
}

-(void)categorySelected:(ExamCategory *)category {
    [self.sideMenuViewController hideMenuViewController];
    self.selectedCategory = category;
    self.navigationBar.title = category.categoryName;
    [self.tableView reloadData];
    
}

-(void)logoutPressed {
    [self.sideMenuViewController hideMenuViewController];
    [self showLoginAnimated:YES];
    
}

-(void)reloadPressed {
    [self.sideMenuViewController hideMenuViewController];
    RefreshTask *task = [[RefreshTask alloc] initWithDialogHost:self delegate:self];
    [task start];
    
}

@end

