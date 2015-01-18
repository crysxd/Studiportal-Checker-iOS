//
//  NotificationHost.h
//  HFU Studiportal
//
//  Created by Christian Würthner on 17.01.15.
//  Copyright (c) 2015 Hochschule Furtwangen University. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NotificationHost : NSObject

-(void) showNotificationWithTitle:(NSString*)title andText:(NSString*) text;

@end
