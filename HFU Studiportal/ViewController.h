//
//  ViewController.h
//  HFU Studiportal
//
//  Created by Christian Würthner on 14.01.15.
//  Copyright (c) 2015 Hochschule Furtwangen University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RefreshTask.h"

@interface ViewController : DialogHostViewController <RefreshTaskDelegate>

- (IBAction)loginAction:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *textViewUser;
@property (weak, nonatomic) IBOutlet UITextField *textViewPassword;

@end

