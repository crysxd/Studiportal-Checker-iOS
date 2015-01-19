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
@end

