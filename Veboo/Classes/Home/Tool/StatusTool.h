//
//  StatusTool.h
//  Veboo
//
//  Created by HeQingbao on 14-7-19.
//  Copyright (c) 2014年 HeQingbao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StatusTool : NSObject

+ (void)getStatusWithUrl:(NSString *)path params:(NSDictionary *)params success:(void (^)(NSArray *statuses))success failure:(void (^)(NSError *error))failure;

@end
