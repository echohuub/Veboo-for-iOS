//
//  HttpHelper.h
//  Veboo
//
//  Created by HeQingbao on 14-7-13.
//  Copyright (c) 2014年 HeQingbao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpHelper : NSObject

+ (void)postWithURL:(NSString *)url params:(NSDictionary *)params success:(void(^)(NSDictionary *response))success failure:(void (^)(NSError *error))failure;
+ (void)getWithURL:(NSString *)url params:(NSDictionary *)params success:(void(^)(NSDictionary *response))success failure:(void (^)(NSError *error))failure;

@end
