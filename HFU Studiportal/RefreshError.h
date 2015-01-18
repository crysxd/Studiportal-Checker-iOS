//
//  RefreshError.h
//  HFU Studiportal
//
//  Created by Christian Würthner on 18.01.15.
//  Copyright (c) 2015 Hochschule Furtwangen University. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RefreshError : NSObject

@property NSString* messageKey;
-(NSString*)localizedMessage;
-(id) initWithMessageKey:(NSString*)key;

@end

@interface NoChangeRefreshError : RefreshError

@end

@interface LoginRefreshError : RefreshError

@end

@interface NoConnectinonRefreshError : RefreshError

@end

