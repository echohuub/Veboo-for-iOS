//
//  AvatarView.h
//  Veboo
//
//  Created by HeQingbao on 14-7-19.
//  Copyright (c) 2014年 HeQingbao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum
{
    kAvatarTypeDefault,
    kAvatarTypeSmall,
    kAvatarTypeBig
} AvatarType;

@class User;
@interface AvatarView : UIView

- (void)setUser:(User *)user type:(AvatarType)type;

+ (CGSize)sizeWithUser:(User *)user avatarType:(AvatarType)type;

@end
