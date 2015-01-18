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
    
    //TODO CHECK IF USERNAME OR PASSWORD IS EMPTY, RASISE EXCEPTION IF TRUE
    
    NSString *params = [NSString stringWithFormat:@"%@=%@&%@=%@", @"asdf", self.userName, @"fdsa", self.password];
    NSString *response = [self sendPostToURL:URL_LOGIN withParams:params];
    
    NSRange range = [response rangeOfString:@";asi="];
    NSUInteger start = NSMaxRange(range);
    range = [response rangeOfString:@"\"" options:0 range:NSMakeRange(start, 1024)];
    NSUInteger end = range.location;
    self.asi = [response substringWithRange:NSMakeRange(start, end-start)];
    NSLog(@"asi:\n%@", self.asi);

    //TODO CHECK IF RESPONSE CONTAINS "ANMELDUNG FEHLGESCHLAGEN"
    
}

-(void) logout {
    if(self.dialogHost != nil) {
        [self.dialogHost showIndeterminateProgressDialogWithTitle:NSLocalizedString(@"dialog.name.refresh", nil) andText:NSLocalizedString(@"dialog.text.refresh.logout", nil)];
        
    }
    
    [self sendGetToURL:URL_LOGOUT];
    
}

-(void) checkDataChange {
    if(self.dialogHost != nil) {
        [self.dialogHost showIndeterminateProgressDialogWithTitle:NSLocalizedString(@"dialog.name.refresh", nil) andText:NSLocalizedString(@"dialog.text.refresh.check", nil)];
        
    }
    
    NSString *response = [self sendGetToURL:[NSString stringWithFormat:URL_OBSERVE, self.asi]];
    NSLog(@"Response:\n%@", response);
    
}

-(NSString*) sendPostToURL:(NSString*)url withParams:(NSString*)params {
    NSData *postData = [params dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%lu",(unsigned long)[postData length]];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:url]];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    
    NSURLResponse* response;
    NSError* error = nil;
    NSData* result = [NSURLConnection sendSynchronousRequest:request  returningResponse:&response error:&error];

    return [[NSString alloc] initWithData:result encoding:NSUTF8StringEncoding];
    
}

-(NSString*) sendGetToURL:(NSString*) url {
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:url]];
    [request setHTTPMethod:@"GET"];

    NSURLResponse* response;
    NSError* error = nil;
    NSData* result = [NSURLConnection sendSynchronousRequest:request  returningResponse:&response error:&error];
    
    return [[NSString alloc] initWithData:result encoding:NSUTF8StringEncoding];
    
}

@end