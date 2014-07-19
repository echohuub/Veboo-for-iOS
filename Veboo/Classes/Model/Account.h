//
//  Account.h
//  Veboo
//
//  Created by HeQingbao on 14-7-13.
//  Copyright (c) 2014年 HeQingbao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Account : NSObject <NSCoding>

@property (nonatomic, copy) NSString *accessToken;
@property (nonatomic, copy) NSString *uid;

@end
