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
-(RefreshError*) doInBackground;
-(void) onPostExecute:(RefreshError*) occuredError;
-(RefreshError*) login;
-(void) logout;
-(RefreshError*) checkDataChange;
-(NSString*) sendPostToURL:(NSString*)url withParams:(NSString*)params;
-(NSString*) sendGetToURL:(NSString*) url;

@end

@implementation RefreshTask

-(id) initWithUserName:(NSString*)userName password:(NSString*)password dialogHost:(DialogHostViewController*)dialogHost delegate:(id<RefreshTaskDelegate>)delegate {
    self.userName = userName;
    self.password = password;
    self.dialogHost = dialogHost;
    self.delegate = delegate;
    
    return self;
    
}

-(void)start {
    [self performSelectorInBackground:@selector(start0) withObject:nil];

}

-(void)start0 {
    [self onPreExecute];
    RefreshError *occuredError = [self doInBackground];
    [self onPostExecute: occuredError];
    
}

-(void) onPreExecute {
    
}

-(RefreshError*) doInBackground {
    RefreshError *occuredError = nil;
    
    occuredError = [self login];
    
    if(occuredError != nil)
        return occuredError;
    
    occuredError = [self checkDataChange];
    
    if(occuredError != nil)
        return occuredError;
    
    [self logout];

    return nil;
    
}

-(void) onPostExecute:(RefreshError*) occuredError{
    if(self.dialogHost != nil) {
        [self.dialogHost cancelProgressDialog];
        
        if(occuredError != nil && [occuredError class] != [NoChangeRefreshError class]) {
            [self.dialogHost showErrorDialogWithMessage:occuredError.localizedMessage];
            
        }
    }
    
    if(self.delegate != nil) {
        [self.delegate refreshCompleteWithError:occuredError];
        
    }
}

-(RefreshError*) login {
    if(self.dialogHost != nil) {
        [self.dialogHost showIndeterminateProgressDialogWithTitle:NSLocalizedString(@"dialog.name.refresh", nil) andText:NSLocalizedString(@"dialog.text.refresh.login", nil)];
        
    }
    
    if(self.userName == nil || self.password == nil || self.userName.length == 0 || self.password.length == 0) {
        return [[LoginRefreshError alloc] init];
        
    }
    
    NSString *params = [NSString stringWithFormat:@"%@=%@&%@=%@", @"asdf", self.userName, @"fdsa", self.password];
    NSString *response = [self sendPostToURL:URL_LOGIN withParams:params];
    
    if(response.length == 0) {
        return [[NoConnectinonRefreshError alloc] init];
        
    }
    
    NSRange range = [response rangeOfString:@";asi="];
    
    if(range.location == NSNotFound) {
        return [[LoginRefreshError alloc] init];
        
    }
    
    NSUInteger start = NSMaxRange(range);
    range = [response rangeOfString:@"\"" options:0 range:NSMakeRange(start, 1024)];
    NSUInteger end = range.location;
    self.asi = [response substringWithRange:NSMakeRange(start, end-start)];
    NSLog(@"asi:\n%@", self.asi);

    if([response rangeOfString:@"Anmeldung Fehlgeschlagen" options:NSCaseInsensitiveSearch].location != NSNotFound) {
        return [[LoginRefreshError alloc] init];

    }
    
    return nil;
    
}

-(void) logout {
    if(self.dialogHost != nil) {
        [self.dialogHost showIndeterminateProgressDialogWithTitle:NSLocalizedString(@"dialog.name.refresh", nil) andText:NSLocalizedString(@"dialog.text.refresh.logout", nil)];
        
    }
    
    [self sendGetToURL:URL_LOGOUT];
    
}

-(RefreshError*) checkDataChange {
    if(self.dialogHost != nil) {
        [self.dialogHost showIndeterminateProgressDialogWithTitle:NSLocalizedString(@"dialog.name.refresh", nil) andText:NSLocalizedString(@"dialog.text.refresh.check", nil)];
        
    }
    
    NSString *response = [self sendGetToURL:[NSString stringWithFormat:URL_OBSERVE, self.asi]];
    
    if(response.length == 0) {
        return [[NoConnectinonRefreshError alloc] init];
        
    }
    
    
    return [[NoChangeRefreshError alloc] init];
    
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