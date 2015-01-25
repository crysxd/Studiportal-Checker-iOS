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
        [self showLogin];
    
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
        [self showLogin];

    }
}

-(void)showLogin {
    LoginViewController *loginController = [[LoginViewController alloc] initWithNibName:@"Login" bundle:nil];
    [self.navigationController pushViewController:loginController animated:NO];

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if([self.selectedCategory exam:indexPath.row].class == [Seperator class]) {
        return 0.0;
    }
    
    return 72.0;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.selectedCategory.examCount;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Exam *e = [self.selectedCategory exam:indexPath.row];
    
    if(e.class == [Seperator class]) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SeperatorCell"];
        cell.separatorInset = UIEdgeInsetsMake(0, cell.bounds.size.width, 0, 0);
        return cell;
        
    }
    
    NSString *reuseId = e.stateEnum == ExamStateUndefined ? @"StatelessExamCell" : @"ExamCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    UILabel *label = (UILabel*) [cell viewWithTag:100];
    label.text = e.name;
    
    label = (UILabel*) [cell viewWithTag:101];
    label.text = @"Detail 1";
    
    label = (UILabel*) [cell viewWithTag:102];
    label.text = @"Detail 2";
    
    UIImageView *icon = (UIImageView*) [cell viewWithTag:103];
    
    if(icon != nil) {
        switch (e.stateEnum) {
            case ExamStateAN:
                icon.image = [UIImage imageNamed:@"an"];
                break;
            
            case ExamStateBE:
                icon.image = [UIImage imageNamed:@"be"];
                break;
            
            case ExamStateEN:
                icon.image = [UIImage imageNamed:@"en"];
                break;
            
            case ExamStateNB:
                icon.image = [UIImage imageNamed:@"nb"];
                break;
            
            default:
                icon.hidden = YES;
                break;
            
        }
    }
    
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
    [self showLogin];
    
}

-(void)reloadPressed {
    [self.sideMenuViewController hideMenuViewController];
    RefreshTask *task = [[RefreshTask alloc] initWithDialogHost:self delegate:self];
    [task start];
    
}

@end

