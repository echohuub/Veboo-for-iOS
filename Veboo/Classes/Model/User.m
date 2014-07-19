//
//  User.m
//  Veboo
//
//  Created by HeQingbao on 14-7-14.
//  Copyright (c) 2014年 HeQingbao. All rights reserved.
//

#import "User.h"

@implementation User

- (id)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        _idStr = dict[@"idstr"];
        _screenName = dict[@"screen_name"];
        _profileImageUrl = dict[@"profile_image_url"];
        _avatarLarge = dict[@"avatar_large"];
        _avatarHd = dict[@"avatar_hd"];
        
        _followersCount = [dict[@"followers_count"] intValue];
        _friendsCount = [dict[@"friends_count"] intValue];
        _statusesCount = [dict[@"statuses_count"] intValue];
        _favouritesCount = [dict[@"favourites_count"] intValue];
        
        _verified = [dict[@"verified"] boolValue];
        _verifiedType = [dict[@"verified_type"] intValue];
        
    }
    return self;
}

@end
