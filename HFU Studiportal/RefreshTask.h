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
#import "RefreshError.h"
#import "StudiportalData.h"

#define URL_LOGIN @"https://studi-portal.hs-furtwangen.de/qisserver/rds?state=user&type=1&category=auth.login&startpage=portal.vm&breadCrumbSource=portal"
#define URL_LOGOUT @"https://studi-portal.hs-furtwangen.de/qisserver/rds?state=user&type=4&re=last&category=auth.logout&breadCrumbSource=portal"
#define URL_OBSERVE @"https://studi-portal.hs-furtwangen.de/qisserver/rds?state=htmlbesch&moduleParameter=Student&menuid=notenspiegel&breadcrumb=notenspiegel&breadCrumbSource=menu&asi=%@"

@protocol RefreshTaskDelegate <NSObject>

-(void)refreshCompleteWithError:(RefreshError*) error;

@end

@interface RefreshTask : NSObject

@property NSString *userName;
@property NSString *password;
@property NSString *asi;
@property DialogHostViewController *dialogHost;
@property id<RefreshTaskDelegate> delegate;

-(id) initWithUserName:(NSString*)userName password:(NSString*)password dialogHost:(DialogHostViewController*)dialogHost delegate:(id<RefreshTaskDelegate>)delegate;
-(void) start;

@end