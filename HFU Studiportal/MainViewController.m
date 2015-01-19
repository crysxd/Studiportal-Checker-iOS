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

}

-(void)viewDidLoad {
    [super viewDidLoad];
    self.btRefresh.tintColor = [UIColor whiteColor];
    
    RefreshTask *task = [[RefreshTask alloc] initWithDialogHost:nil delegate:self];
    [task start];
    
    
    
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    if(!self.loggedIn) {
        [self showLogin];
        
    }
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
    
}

-(void)refreshCompleteWithError:(RefreshError *)error {
    if(error != nil && [error class] != [NoChangeRefreshError class]) {
        [self showErrorDialogWithMessage:error.localizedMessage];
        
    }
    
    if(error != nil && [error class] == [LoginRefreshError class]) {
        [self showLogin];

    }
}

-(void)showLogin {
    [self performSegueWithIdentifier:@"showLogin" sender:self];

}

- (IBAction)refresh:(id)sender {
    RefreshTask* task = [[RefreshTask alloc] initWithDialogHost:self delegate:self];
    [task start];
    
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [self.data category:section].categoryName;
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.data.categoryCount;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.data category:section].examCount;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [[self.data category:indexPath.section] exam:indexPath.row].name;
    return cell;
    
}

@end

