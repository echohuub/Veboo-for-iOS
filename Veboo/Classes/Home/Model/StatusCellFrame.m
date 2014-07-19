//
//  StatusCellFrame.m
//  Veboo
//
//  Created by HeQingbao on 14-7-15.
//  Copyright (c) 2014年 HeQingbao. All rights reserved.
//

#import "StatusCellFrame.h"
#import "Status.h"
#import "User.h"
#import "GridImageView.h"
#import "AvatarView.h"

@implementation StatusCellFrame

- (void)setStatus:(Status *)status
{
    _status = status;
    
    CGFloat cellWidth = [UIScreen mainScreen].bounds.size.width;
    
    // 头像
    CGFloat avatarX = kCellBorderWidth;
    CGFloat avatarY = kCellBorderWidth;
    CGSize avatarSize = [AvatarView sizeWithUser:_status.user avatarType:kAvatarTypeSmall];
    _avatarFrame = (CGRect){{avatarX, avatarY}, avatarSize};

    // 昵称
    CGFloat nameX = CGRectGetMaxX(_avatarFrame) + kCellBorderWidth;
    CGFloat nameY = avatarY;
    CGSize nameSize = [_status.user.screenName sizeWithAttributes:@{NSFontAttributeName: kTimelineNameFont}];
    _nameFrame = (CGRect){{nameX, nameY}, nameSize};
    
    // 创建时间
    CGFloat timeX = nameX;
    CGFloat timeY = CGRectGetMaxY(_nameFrame) + kCommonSmallMargin;
    CGSize timeSize = [_status.createdAt sizeWithAttributes:@{NSFontAttributeName: kTimelineTimeFont}];
    _createTimeFrame = (CGRect){{timeX, timeY}, timeSize};
    
    // 来源
    CGFloat sourceX = CGRectGetMaxX(_createTimeFrame) + kCellBorderWidth;
    CGFloat sourceY = timeY;
    CGSize sourceSize = [_status.source sizeWithAttributes:@{NSFontAttributeName: kTimelineSourceFont}];
    _sourceFrame = (CGRect){{sourceX, sourceY}, sourceSize};
    
    // 微博内容
    CGFloat textX = avatarX;
    CGFloat textY = MAX(CGRectGetMaxY(_avatarFrame), CGRectGetMaxY(_textFrame)) + kCellBorderWidth;
    CGSize textSize = [_status.text boundingRectWithSize:CGSizeMake(cellWidth - 2 * kCellBorderWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: kTimelineTextFont} context:nil].size;
    _textFrame = (CGRect){{textX, textY}, textSize};
    
    // 图片
    if (_status.picUrls.count > 0) { // 有图片
        CGFloat imageX = textX;
        CGFloat imageY = CGRectGetMaxY(_textFrame) + kCellBorderWidth;
        CGSize imageSize = [GridImageView sizeWithImageCount:_status.picUrls.count];
        _imageFrame = (CGRect){{imageX, imageY}, imageSize};
    } else if (status.retweetedStatus != nil) { // 有转发
        // 被转发微博的整体
        CGFloat retweetedX = 0;
        CGFloat retweetedY = CGRectGetMaxY(_textFrame) + kCellBorderWidth;
        CGFloat retweetedWidth = cellWidth;
        CGFloat retweetedHeight = 0;
        
        // 转发微博的文本内容
        CGFloat retweetedTextX = textX;
        CGFloat retweetedTextY = kCellBorderWidth;
        CGSize retweetedTextSize = [_status.retweetedStatus.text boundingRectWithSize:CGSizeMake(retweetedWidth - 2 * kCellBorderWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: kTimelineTextFont} context:nil].size;
        _retweetedTextFrame = (CGRect){{retweetedTextX, retweetedTextY}, retweetedTextSize};
        
        // 转发微博的配图
        if (status.retweetedStatus.picUrls.count > 0) {
            CGFloat retweetedImageX = retweetedTextX;
            CGFloat retweetedImageY = CGRectGetMaxY(_retweetedTextFrame) + kCellBorderWidth;
            CGSize retweetedImageSize = [GridImageView sizeWithImageCount:status.retweetedStatus.picUrls.count];
            _retweetedImageFrame = (CGRect){{retweetedImageX, retweetedImageY}, retweetedImageSize};
            retweetedHeight = CGRectGetMaxY(_retweetedImageFrame) + kCellBorderWidth;
        } else {
            retweetedHeight = CGRectGetMaxY(_retweetedTextFrame) + kCellBorderWidth;
        }
        
        _retweetedFrame = CGRectMake(retweetedX, retweetedY, retweetedWidth, retweetedHeight);
    }
    
    // 整个cell的高度
    if (_status.picUrls.count > 0) {
        _cellHeight = CGRectGetMaxY(_imageFrame) + kCellBorderWidth;
    } else if (_status.retweetedStatus != nil) {
        _cellHeight = CGRectGetMaxY(_retweetedFrame) + kCellBorderWidth;
    } else {
        // 第一个kCellBorderWidth是内容与边框的距离
        // 第二个kCellBorderWidth是Cell之间的距离
        _cellHeight = CGRectGetMaxY(_textFrame) + kCellBorderWidth;
    }
    
    _cellHeight += kCellBorderWidth;
}

@end
