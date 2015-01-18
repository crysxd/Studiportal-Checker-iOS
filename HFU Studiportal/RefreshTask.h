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

#define URL_LOGIN @"https://studi-portal.hs-furtwangen.de/qisserver/rds?state=user&type=1&category=auth.login&startpage=portal.vm&breadCrumbSource=portal"
#define URL_LOGOUT @"https://studi-portal.hs-furtwangen.de/qisserver/rds?state=user&type=4&re=last&category=auth.logout&breadCrumbSource=portal"
#define URL_OBSERVE @"https://studi-portal.hs-furtwangen.de/qisserver/rds?state=htmlbesch&moduleParameter=Student&menuid=notenspiegel&breadcrumb=notenspiegel&breadCrumbSource=menu&asi=%@"

@interface RefreshTask : NSObject

@property NSString *userName;
@property NSString *password;
@property NSString *asi;
@property DialogHostViewController *dialogHost;

-(id) initWithUserName:(NSString*)userName Password:(NSString*)password DialogHost:(DialogHostViewController*) dialogHost;
-(void) start;

@end