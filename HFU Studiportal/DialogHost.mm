//
//  DialogHost.m
//  HFU Studiportal
//
//  Created by Christian Würthner on 17.01.15.
//  Copyright (c) 2015 Hochschule Furtwangen University. All rights reserved.
//

#import "DialogHost.h"

void DialogHost::showIndeterminateProgressDialog(std::string title, std::string text) {
    if(this->progressHUD == NULL) {
        this->progressHUD = [MBProgressHUD showHUDAddedTo:this->view animated:YES];
        [this->progressHUD setDimBackground:YES];
        
    }
    
    [this->progressHUD setLabelText: [NSString stringWithUTF8String: title.c_str()]];
    [this->progressHUD setDetailsLabelText: [NSString stringWithUTF8String: text.c_str()]];
    
}

void DialogHost::cancelProgressDialog() {
    if(this->progressHUD != NULL) {
        [this->progressHUD hide:YES];
        this->progressHUD = NULL;
        
    }
}

void DialogHost::showDialog(std::string title, std::string description) {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithUTF8String:title.c_str()]
                                                    message:[NSString stringWithUTF8String:description.c_str()]
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    
}

void DialogHost::showErrorDialog(std::exception e) {
    this->showDialog(localizeString("dialog.name.error"), e.what());
    
}