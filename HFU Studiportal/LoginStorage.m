//
//  KeyChain.m
//  HFU Studiportal
//
//  Created by Christian Würthner on 19.01.15.
//  Copyright (c) 2015 Hochschule Furtwangen University. All rights reserved.
//

#import "LoginStorage.h"

@implementation LoginStorage

-(id) init {
    self.keychain = [UICKeyChainStore keyChainStoreWithServer:[NSURL URLWithString:@"https://studi-portal.hs-furtwangen.de/"]
                                                 protocolType:UICKeyChainStoreProtocolTypeHTTPS
                                           authenticationType:UICKeyChainStoreAuthenticationTypeHTMLForm];
    return [super init];
    
}

-(void) saveUser:(NSString*)username password:(NSString*)password {
    [self deleteUserAndPassword];
    NSError* error;
    [self.keychain setString:username forKey:LOGIN_STORAGE_USERNAME_KEY error:&error];
    [self.keychain setString:password forKey:LOGIN_STORAGE_PASSWORD_KEY error:&error];

    if (error) {
        NSLog(@"%@", error.localizedDescription);
    }
}

-(NSString*) user {
    return [self.keychain stringForKey:LOGIN_STORAGE_USERNAME_KEY];
    
}

-(NSString*) password {
    return [self.keychain stringForKey:LOGIN_STORAGE_PASSWORD_KEY];

}

-(void) deleteUserAndPassword {
    [self.keychain setString:nil forKey:LOGIN_STORAGE_USERNAME_KEY];
    [self.keychain setString:nil forKey:LOGIN_STORAGE_PASSWORD_KEY];
    
}

-(BOOL) isLoggedIn {
    return [self user] != nil && [self password] != nil;
    
}

@end
