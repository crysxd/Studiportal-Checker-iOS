//
//  Strings.m
//  HFU Studiportal
//
//  Created by Christian Würthner on 15.01.15.
//  Copyright (c) 2015 Hochschule Furtwangen University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LocalStrings.h"

std::string localizeString(std::string id) {
    NSString *string = NSLocalizedString([NSString stringWithUTF8String:id.c_str()], nil);
    return [string UTF8String];
    
}

