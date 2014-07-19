//
//  Status.h
//  Veboo
//
//  Created by HeQingbao on 14-7-14.
//  Copyright (c) 2014年 HeQingbao. All rights reserved.
//

#import <Foundation/Foundation.h>

@class User;
@interface Status : NSObject

@property (nonatomic, copy) NSString *createdAt;
@property (nonatomic, copy) NSString *idStr;
@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSString *source;
@property (nonatomic, assign) int repostsCount;	//	转发数
@property (nonatomic, assign) int commentsCount;   //	评论数
@property (nonatomic, assign) int attitudesCount; // 表态数
@property (nonatomic, strong) NSArray *picUrls; // 微博配图地址
@property (nonatomic, strong) User *user;
@property (nonatomic, strong) Status *retweetedStatus;

- (id)initWithDict:(NSDictionary *)dict;

@end
