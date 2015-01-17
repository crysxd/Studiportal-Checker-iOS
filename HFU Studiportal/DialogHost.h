//
//  DialogHost.h
//  HFU Studiportal
//
//  Created by Christian Würthner on 17.01.15.
//  Copyright (c) 2015 Hochschule Furtwangen University. All rights reserved.
//

#include <string>
#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
#import "LocalStrings.h"

#ifndef HFU_Studiportal_DialogHost_h
#define HFU_Studiportal_DialogHost_h

class DialogHost {
    UIView *view;
    MBProgressHUD *progressHUD = NULL;
    
public:
    DialogHost(UIView *view) : view(view) {}
    void showIndeterminateProgressDialog(std::string title, std::string text);
    void cancelProgressDialog();
    void showErrorDialog(std::exception e);
    void showDialog(std::string title, std::string text);
    
};

#endif
