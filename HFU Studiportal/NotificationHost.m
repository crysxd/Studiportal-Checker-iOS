//
//  NotificationHost.m
//  HFU Studiportal
//
//  Created by Christian Würthner on 17.01.15.
//  Copyright (c) 2015 Hochschule Furtwangen University. All rights reserved.
//

#import "NotificationHost.h"

@implementation NotificationHost

-(void) showNotificationWithTitle:(NSString*)title andText:(NSString*) text {
    NSString *body = [NSString stringWithFormat:@"%@: %@", title, text];
    
    NSDictionary *data  = [[NSDictionary alloc] initWithObjectsAndKeys:
                           title, @"title",
                           text, @"text",
                           nil];
    
    UILocalNotification *notification = [[UILocalNotification alloc]init];
    notification.repeatInterval = NSDayCalendarUnit;
    [notification setAlertBody: body];
    [notification setUserInfo: data];
    [notification setFireDate:[NSDate dateWithTimeIntervalSinceNow:1]];
    [notification setTimeZone:[NSTimeZone  defaultTimeZone]];
    [[UIApplication sharedApplication] setScheduledLocalNotifications:[NSArray arrayWithObject:notification]];
    
}

@end