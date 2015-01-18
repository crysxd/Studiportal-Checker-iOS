//
//  DialogHost.m
//  HFU Studiportal
//
//  Created by Christian Würthner on 17.01.15.
//  Copyright (c) 2015 Hochschule Furtwangen University. All rights reserved.
//

#import "DialogHostViewController.h"

@implementation DialogHostViewController

-(void)showDialogWithTitle:(NSString *)title andText:(NSString *)text {
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{

        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                        message:text
                                                       delegate:nil
                                              cancelButtonTitle:NSLocalizedString(@"dialog.button.ok", nil)
                                              otherButtonTitles:nil];
        [alert show];
        
    }];
}

-(void)showErrorDialogWithMessage:(NSString *)message {
    [self showDialogWithTitle:NSLocalizedString(@"dialog.name.error", nil) andText:message];
}

-(void)showIndeterminateProgressDialogWithTitle:(NSString *)title andText:(NSString *)text {
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        if(self.progressView == nil) {
            self.progressView = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        
        }
    
        [self.progressView setDimBackground:YES];
        [self.progressView setLabelText:title];
        [self.progressView setDetailsLabelText:text];
    }];
}

-(void)cancelProgressDialog {
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{

        if(self.progressView != nil) {
            [self.progressView hide:YES];
            self.progressView = nil;
        
        }
    }];
}

@end