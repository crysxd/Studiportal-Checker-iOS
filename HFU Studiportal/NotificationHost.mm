//
//  NotificationHost.m
//  HFU Studiportal
//
//  Created by Christian Würthner on 17.01.15.
//  Copyright (c) 2015 Hochschule Furtwangen University. All rights reserved.
//

#import "NotificationHost.h"

void NotificationHost::showNotification(std::string title, std::string text) {
    NSString *nstitle = [NSString stringWithUTF8String: title.c_str()];
    NSString *nstext = [NSString stringWithUTF8String: text.c_str()];
    NSString *body = [NSString stringWithFormat:@"%@: %@", nstitle, nstext ];
    
    NSDictionary *data  = [[NSDictionary alloc] initWithObjectsAndKeys:
                           nstitle, @"title",
                           nstext, @"text",
                           nil];
    
    UILocalNotification *notification = [[UILocalNotification alloc]init];
    notification.repeatInterval = NSDayCalendarUnit;
    [notification setAlertBody: body];
    [notification setUserInfo: data];
    [notification setFireDate:[NSDate dateWithTimeIntervalSinceNow:1]];
    [notification setTimeZone:[NSTimeZone  defaultTimeZone]];
    [[UIApplication sharedApplication] setScheduledLocalNotifications:[NSArray arrayWithObject:notification]];
    
}
