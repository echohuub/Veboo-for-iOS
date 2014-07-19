//
//  AvatarView.m
//  Veboo
//
//  Created by HeQingbao on 14-7-19.
//  Copyright (c) 2014年 HeQingbao. All rights reserved.
//

#import "AvatarView.h"
#import "User.h"
#import <UIImageView+WebCache.h>

#define kAvatarDefaultWidth 50
#define kAvatarDefaultHeight 50

#define kAvatarSmallWidth 34
#define kAvatarSmallHeight 34

#define kAvatarBigWidth 85
#define kAvatarBigHeight 85

#define kVerifiedWidth 18
#define kVerifiedHeight 18

#define kVerifiedViewCenterRatio 0.7

@interface AvatarView ()
{
    User *_user;
    
    UIImageView *_avatarView;
    UIImageView *_verifiedView;
}
@end

@implementation AvatarView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _avatarView = [[UIImageView alloc] init];
        CALayer *layer = _avatarView.layer;
        layer.cornerRadius = 2;
        layer.masksToBounds = YES;
        [self addSubview:_avatarView];
        
        _verifiedView = [[UIImageView alloc] init];
        [self addSubview:_verifiedView];
    }
    return self;
}

- (void)setUser:(User *)user type:(AvatarType)type
{
    [self setUser:user];
    [self setType:type];
}

- (void)setUser:(User *)user
{
    _user = user;
    
    NSString *verifiedIcon;
    switch (user.verifiedType) {
        case kVerifiedTypePersonal:
            verifiedIcon = @"avatar_vip.png";
            break;
        case kVerifiedTypeOrgEnterprice:
            verifiedIcon = @"avatar_enterprise_vip.png";
            break;
        case kVerifiedTypeDaren:
            verifiedIcon = @"avatar_grassroot.png";
            break;
        default:
            break;
    }
    
    if (verifiedIcon) {
        _verifiedView.hidden = NO;
        _verifiedView.image = [UIImage imageNamed:verifiedIcon];
    } else {
        _verifiedView.hidden = YES;
    }
}

- (void)setType:(AvatarType)type
{
    NSString *placeholder;
    CGSize avatarSize;
    switch (type) {
        case kAvatarTypeSmall:
            placeholder = @"avatar_default_small.png";
            avatarSize = (CGSize){kAvatarSmallWidth, kAvatarSmallHeight};
            break;
        case kAvatarTypeBig:
            placeholder = @"avatar_default_big";
            avatarSize = (CGSize){kAvatarBigWidth, kAvatarBigHeight};
            break;
        default:
            placeholder = @"avatar_default.png";
            avatarSize = (CGSize){kAvatarDefaultWidth, kAvatarDefaultHeight};
            break;
    }
    
    [_avatarView setImageWithURL:[NSURL URLWithString:_user.profileImageUrl] placeholderImage:[UIImage imageNamed:placeholder]];
    
    CGRect avatarFrame = (CGRect){CGPointZero, avatarSize};
    _avatarView.frame = avatarFrame;
    
    CGFloat verifiedViewX = CGRectGetMaxX(avatarFrame) - kVerifiedWidth * kVerifiedViewCenterRatio;
    CGFloat verifiedViewY = CGRectGetMaxY(avatarFrame) - kVerifiedHeight * kVerifiedViewCenterRatio;
    _verifiedView.frame = CGRectMake(verifiedViewX, verifiedViewY, kVerifiedWidth, kVerifiedHeight);
    
    // 自己的宽、高
    CGFloat width = CGRectGetMaxX(avatarFrame) + kVerifiedWidth * (1 - kVerifiedViewCenterRatio);
    CGFloat height = CGRectGetMaxY(avatarFrame) + kVerifiedHeight * (1 - kVerifiedViewCenterRatio);
    self.bounds = CGRectMake(0, 0, width, height);
}

+ (CGSize)sizeWithUser:(User *)user avatarType:(AvatarType)type
{
    CGSize avatarSize;
    switch (type) {
        case kAvatarTypeSmall:
            avatarSize = (CGSize){kAvatarSmallWidth, kAvatarSmallHeight};
            break;
        case kAvatarTypeBig:
            avatarSize = (CGSize){kAvatarBigWidth, kAvatarBigHeight};
            break;
        default:
            avatarSize = (CGSize){kAvatarDefaultWidth, kAvatarDefaultHeight};
            break;
    }
    
    CGFloat width = avatarSize.width;
    CGFloat height = avatarSize.height;
    
    if (user.verified) {
        width += kVerifiedWidth * (1 - kVerifiedViewCenterRatio);
        height += kVerifiedHeight * (1 - kVerifiedViewCenterRatio);
    }
    return CGSizeMake(width, height);
}

@end
