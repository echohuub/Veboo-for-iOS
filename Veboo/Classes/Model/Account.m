//
//  Account.m
//  Veboo
//
//  Created by HeQingbao on 14-7-13.
//  Copyright (c) 2014年 HeQingbao. All rights reserved.
//

#import "Account.h"

@implementation Account

- (id)initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    if (self) {
        _accessToken = [decoder decodeObjectForKey:@"access_token"];
        _uid = [decoder decodeObjectForKey:@"uid"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder
{
    [coder encodeObject:_accessToken forKey:@"access_token"];
    [coder encodeObject:_uid forKey:@"uid"];
}

@end
