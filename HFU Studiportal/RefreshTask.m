//
//  RefreshTask.cpp
//  HFU Studiportal
//
//  Created by Christian Würthner on 17.01.15.
//  Copyright (c) 2015 Hochschule Furtwangen University. All rights reserved.
//

#include "RefreshTask.h"

@interface RefreshTask()

-(void) start0;
-(void) onPreExecute;
-(void) doInBackground;
-(void) onPostExecute;
-(void) login;
-(void) logout;
-(void) checkDataChange;
-(NSString*) sendPostToURL:(NSString*)url withParams:(NSString*)params;
-(NSString*) sendGetToURL:(NSString*) url;

@end

@implementation RefreshTask

-(id) initWithUserName:(NSString*)userName Password:(NSString*)password DialogHost:(DialogHostViewController*) dialogHost {
    self.userName = userName;
    self.password = password;
    self.dialogHost = dialogHost;
    
    return self;
    
}

-(void)start {
    [self performSelectorInBackground:@selector(start0) withObject:nil];

}

-(void)start0 {
    [self onPreExecute];
    [self doInBackground];
    [self onPostExecute];
    
}

-(void) onPreExecute {
    
}

-(void) doInBackground {
    [self login];
    [self checkDataChange];
    [self logout];

}

-(void) onPostExecute {
    if(self.dialogHost != nil) {
        [self.dialogHost cancelProgressDialog];
        
    }
    
    NotificationHost* host = [[NotificationHost alloc] init];
    [host showNotificationWithTitle:@"Formale Sprachen" andText:@"1,0 - Bestanden"];
    
}

-(void) login {
    if(self.dialogHost != nil) {
        [self.dialogHost showIndeterminateProgressDialogWithTitle:NSLocalizedString(@"dialog.name.refresh", nil) andText:NSLocalizedString(@"dialog.text.refresh.login", nil)];
        
    }
    
    [NSThread sleepForTimeInterval:2.0f];
    
}

-(void) logout {
    if(self.dialogHost != nil) {
        [self.dialogHost showIndeterminateProgressDialogWithTitle:NSLocalizedString(@"dialog.name.refresh", nil) andText:NSLocalizedString(@"dialog.text.refresh.logout", nil)];
        
    }
    
    [NSThread sleepForTimeInterval:2.0f];
    
}

-(void) checkDataChange {
    if(self.dialogHost != nil) {
        [self.dialogHost showIndeterminateProgressDialogWithTitle:NSLocalizedString(@"dialog.name.refresh", nil) andText:NSLocalizedString(@"dialog.text.refresh.check", nil)];
        
    }
    
    [NSThread sleepForTimeInterval:2.0f];
    
}

-(NSString*) sendPostToURL:(NSString*)url withParams:(NSString*)params {
    return nil;
    
}

-(NSString*) sendGetToURL:(NSString*) url {
    return nil;
    
}

@end