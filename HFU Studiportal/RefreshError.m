//
//  RefreshError.m
//  HFU Studiportal
//
//  Created by Christian Würthner on 18.01.15.
//  Copyright (c) 2015 Hochschule Furtwangen University. All rights reserved.
//

#import "RefreshError.h"

@implementation RefreshError

-(id)initWithMessageKey:(NSString *)key {
    self.messageKey = key;
    return self;
    
}

-(NSString *)localizedMessage {
    return NSLocalizedString(self.messageKey, nil);
    
}

@end

@implementation NoChangeRefreshError

-(instancetype)init {
    return [super initWithMessageKey:@"refresh.error.no_change"];
    
}

@end

@implementation LoginRefreshError

-(instancetype)init {
    return [super initWithMessageKey:@"refresh.error.login"];
    
}

@end

@implementation NoConnectinonRefreshError

-(instancetype)init {
    return [super initWithMessageKey:@"refresh.error.no_connection"];
    
}

@end