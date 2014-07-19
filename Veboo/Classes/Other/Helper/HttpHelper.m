//
//  HttpHelper.m
//  Veboo
//
//  Created by HeQingbao on 14-7-13.
//  Copyright (c) 2014年 HeQingbao. All rights reserved.
//

#import "HttpHelper.h"
#import "AccountHelper.h"
#import "Account.h"
#import <AFNetworking.h>

@implementation HttpHelper

+ (void)postWithURL:(NSString *)url params:(NSDictionary *)params success:(void (^)(NSDictionary *))success failure:(void (^)(NSError *))failure
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/plain"];
    
    NSMutableDictionary *allParams = [NSMutableDictionary dictionary];
    if (params) {
        [allParams setDictionary:params];
    }
    
    NSString *accessToken = [AccountHelper sharedAccountHelper].account.accessToken;
    if (accessToken) {
        [allParams setObject:accessToken forKey:@"access_token"];
    }
    
    [manager POST:url parameters:allParams success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error);
    }];
}

+ (void)getWithURL:(NSString *)url params:(NSDictionary *)params success:(void(^)(NSDictionary *response))success failure:(void (^)(NSError *error))failure
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/plain"];
    
    NSMutableDictionary *allParams = [NSMutableDictionary dictionary];
    if (params) {
        [allParams setDictionary:params];
    }
    
    NSString *accessToken = [AccountHelper sharedAccountHelper].account.accessToken;
    if (accessToken) {
        [allParams setObject:accessToken forKey:@"access_token"];
    }
    
    [manager GET:url parameters:allParams success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error);
    }];
}

@end
