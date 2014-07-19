//
//  StatusTool.m
//  Veboo
//
//  Created by HeQingbao on 14-7-19.
//  Copyright (c) 2014年 HeQingbao. All rights reserved.
//

#import "StatusTool.h"
#import "HttpHelper.h"
#import "Status.h"

@implementation StatusTool

+ (void)getStatusWithUrl:(NSString *)path params:(NSMutableDictionary *)params success:(void (^)(NSArray *statuses))success failure:(void (^)(NSError *error))failure
{
    [HttpHelper getWithURL:path params:params success:^(NSDictionary *response) {
        NSArray *array = response[@"statuses"];
        
        NSMutableArray *statuses = [NSMutableArray arrayWithCapacity:array.count];
        for (NSDictionary *dict in array) {
            Status *s = [[Status alloc] initWithDict:dict];
            [statuses addObject:s];
        }
        success(statuses);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

@end
