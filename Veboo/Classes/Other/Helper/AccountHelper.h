//
//  AccountHelper.h
//  Veboo
//
//  Created by HeQingbao on 14-7-13.
//  Copyright (c) 2014年 HeQingbao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Singleton.h"

@class Account;
@interface AccountHelper : NSObject

@property (nonatomic, strong, readonly) Account *account;

- (void)saveAccount:(Account *)account;

singleton_interface(AccountHelper)

@end
