//
//  NotificationHost.h
//  HFU Studiportal
//
//  Created by Christian Würthner on 17.01.15.
//  Copyright (c) 2015 Hochschule Furtwangen University. All rights reserved.
//

#include <string>
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#ifndef HFU_Studiportal_NotificationHost_h
#define HFU_Studiportal_NotificationHost_h

class NotificationHost {
public:
    void showNotification(std::string title, std::string text);

};
#endif
