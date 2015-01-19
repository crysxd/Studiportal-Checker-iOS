//
//  KeyChain.h
//  HFU Studiportal
//
//  Created by Christian Würthner on 19.01.15.
//  Copyright (c) 2015 Hochschule Furtwangen University. All rights reserved.
//

#import "UICKeyChainStore.h"

#define LOGIN_STORAGE_USERNAME_KEY @"asdf"
#define LOGIN_STORAGE_PASSWORD_KEY @"fdsa"
#define LOGIN_STORAGE_SERVICE_NAME @"login_storage"

@interface LoginStorage : NSObject

@property UICKeyChainStore* keychain;
-(void) saveUser:(NSString*)username password:(NSString*)password;
-(NSString*) user;
-(NSString*) password;
-(void) deleteUserAndPassword;
-(BOOL) isLoggedIn;

@end
