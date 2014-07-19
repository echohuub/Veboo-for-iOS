//
//  AccountHelper.m
//  Veboo
//
//  Created by HeQingbao on 14-7-13.
//  Copyright (c) 2014年 HeQingbao. All rights reserved.
//

#import "AccountHelper.h"

#define kFile [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:@"account.data"]

@implementation AccountHelper

singleton_implements(AccountHelper)

- (id)init
{
    self = [super init];
    if (self) {
        _account = [NSKeyedUnarchiver unarchiveObjectWithFile:kFile];
    }
    return self;
}

- (void)saveAccount:(Account *)account
{
    _account = account;
    [NSKeyedArchiver archiveRootObject:account toFile:kFile];
}

@end
