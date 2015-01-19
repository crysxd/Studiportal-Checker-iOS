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
    
}

@end
