//
//  User.h
//  Veboo
//
//  Created by HeQingbao on 14-7-14.
//  Copyright (c) 2014年 HeQingbao. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    kVerifiedTypeNone = -1, // 没有认证
    kVerifiedTypePersonal = 0, // 个人认证
    kVerifiedTypeOrgEnterprice = 2, // 企业
    kVerifiedTypeOrgMedia = 3, // 媒体
    kVerifiedTypeOrgWebsite = 5, // 网站
    kVerifiedTypeDaren = 220 // 达人
} VerifiedType;

@interface User : NSObject

@property (nonatomic, copy) NSString *idStr;
@property (nonatomic, copy) NSString *screenName;
@property (nonatomic, copy) NSString *profileImageUrl; // 用户头像地址（中图），50×50像素
@property (nonatomic, copy) NSString *avatarLarge; // 用户头像地址（大图），180×180像素
@property (nonatomic, copy) NSString *avatarHd; // 用户头像地址（高清），高清头像原图
@property (nonatomic, assign) int followersCount;  //	粉丝数
@property (nonatomic, assign) int friendsCount;    // 关注数
@property (nonatomic, assign) int statusesCount;   //	微博数
@property (nonatomic, assign) int favouritesCount; // 收藏数
@property (nonatomic, assign) BOOL verified;    // 是否认证
@property (nonatomic, assign) VerifiedType verifiedType; // 认证类型

- (id)initWithDict:(NSDictionary *)dict;

@end
