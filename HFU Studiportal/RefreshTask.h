//
//  RefreshTask.h
//  HFU Studiportal
//
//  Created by Christian Würthner on 17.01.15.
//  Copyright (c) 2015 Hochschule Furtwangen University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DialogHostViewController.h"
#import "NotificationHost.h"


@interface RefreshTask : NSObject

@property NSString *userName;
@property NSString *password;
@property DialogHostViewController *dialogHost;

-(id) initWithUserName:(NSString*)userName Password:(NSString*)password DialogHost:(DialogHostViewController*) dialogHost;
-(void) start;

@end