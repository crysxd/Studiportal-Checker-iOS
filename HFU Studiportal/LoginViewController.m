//
//  ViewController.m
//  HFU Studiportal
//
//  Created by Christian Würthner on 14.01.15.
//  Copyright (c) 2015 Hochschule Furtwangen University. All rights reserved.
//

#import "LoginViewController.h"

@implementation LoginViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear: animated];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNeedsStatusBarAppearanceUpdate];
    self.sideMenuViewController.panGestureEnabled = false;
    
    CategoryMenuController *sideController = (CategoryMenuController*) self.sideMenuViewController.leftMenuViewController;
    sideController.data = nil;
    sideController.delegate = nil;
    
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

- (IBAction)loginAction:(id)sender {
    RefreshTask* task = [[RefreshTask alloc] initWithUserName:self.textViewUser.text password:self.textViewPassword.text dialogHost:self delegate:self];
    [task start];
    
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;

}

-(void)refreshCompleteWithError:(RefreshError *)error {
    if(error == nil || [error class] == [NoChangeRefreshError class]) {
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            [[[LoginStorage alloc] init] saveUser:self.textViewUser.text password:self.textViewPassword.text];
            [self performSegueWithIdentifier:@"showMain" sender:self];
        
         }];
        
    } else {
        [self showErrorDialogWithMessage:error.localizedMessage];
        
    }
}

@end
