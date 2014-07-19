//
//  StatusCell.m
//  Veboo
//
//  Created by HeQingbao on 14-7-15.
//  Copyright (c) 2014年 HeQingbao. All rights reserved.
//

#import "StatusCell.h"
#import "Status.h"
#import "User.h"
#import "StatusCellFrame.h"
#import "GridImageView.h"
#import "AvatarView.h"

@interface StatusCell ()
{
    AvatarView *_avatarView;
    UILabel *_screenNameLabel;
    UILabel *_createAtLabel;
    UILabel *_sourceLabel;
    UILabel *_textLabel;
    GridImageView *_imageView;
    
    // 转发
    UIView *_retweetedView;
    UILabel *_retweetedText;
    GridImageView *_retweetedImageView;
    
}
@end

@implementation StatusCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addAllSubviews];
        
        [self addBackground];
    }
    return self;
}

- (void)setFrame:(CGRect)frame
{
    frame.origin.y += kCellBorderWidth;
    frame.size.height -= kCellBorderWidth;
    [super setFrame:frame];
}

- (void)addAllSubviews
{
    // 头像
    _avatarView = [[AvatarView alloc] init];
    [self.contentView addSubview:_avatarView];

    // 昵称
    _screenNameLabel = [[UILabel alloc] init];
    _screenNameLabel.font = kTimelineNameFont;
    [self.contentView addSubview:_screenNameLabel];
    
    // 创建时间
    _createAtLabel = [[UILabel alloc] init];
    _createAtLabel.font = kTimelineTimeFont;
    _createAtLabel.textColor = kColor(156, 156, 156);
    [self.contentView addSubview:_createAtLabel];
    
    // 来源
    _sourceLabel = [[UILabel alloc] init];
    _sourceLabel.font = kTimelineSourceFont;
    _sourceLabel.textColor = kColor(156, 156, 156);;
    [self.contentView addSubview:_sourceLabel];
    
    // 微博文本内容
    _textLabel = [[UILabel alloc] init];
    _textLabel.font = kTimelineTextFont;
    _textLabel.numberOfLines = 0;
    [self.contentView addSubview:_textLabel];
    
    // 微博图片
    _imageView = [[GridImageView alloc] init];
    [self.contentView addSubview:_imageView];
    
    // 转发的微博
    _retweetedView = [[UIView alloc] init];
    _retweetedView.backgroundColor = kColor(245, 245, 245);
    [self.contentView addSubview:_retweetedView];
    
    // 转发的文本
    _retweetedText = [[UILabel alloc] init];
    _retweetedText.font = kTimelineTextFont;
    _retweetedText.numberOfLines = 0;
    [_retweetedView addSubview:_retweetedText];
    
    // 转发的图片
    _retweetedImageView = [[GridImageView alloc] init];
    [_retweetedView addSubview:_retweetedImageView];
}

- (void)addBackground
{
    UIImageView *backgroundView = [[UIImageView alloc] init];
    backgroundView.backgroundColor = [UIColor whiteColor];
    self.backgroundView = backgroundView;
    
    UIView *selectedBackgroundView = [[UIView alloc] init];
    selectedBackgroundView.backgroundColor = kColor(208, 208, 208);
    self.selectedBackgroundView = selectedBackgroundView;
}

- (void)setStatusFrame:(StatusCellFrame *)statusFrame
{
    _statusFrame = statusFrame;
    
    Status *status = statusFrame.status;
    
    // 头像
    [_avatarView setUser:status.user type:kAvatarTypeSmall];
    _avatarView.frame = statusFrame.avatarFrame;
    
    // 昵称
    _screenNameLabel.text = status.user.screenName;
    _screenNameLabel.frame = statusFrame.nameFrame;
    
    // 创建时间
    _createAtLabel.text = status.createdAt;
    _createAtLabel.frame = statusFrame.createTimeFrame;
    
    // 来源
    _sourceLabel.text = status.source;
    _sourceLabel.frame = statusFrame.sourceFrame;
    
    // 微博内容
    _textLabel.text = status.text;
    _textLabel.frame = statusFrame.textFrame;
    
    // 图片
    if (status.picUrls.count > 0) {
        _imageView.hidden = NO;
        _imageView.frame = statusFrame.imageFrame;
        _imageView.imageUrls = status.picUrls;
    } else {
        _imageView.hidden = YES;
    }
    
    // 转发的微博
    if (status.retweetedStatus != nil) {
        _retweetedView.hidden = NO;
        _retweetedView.frame = statusFrame.retweetedFrame;
        
        _retweetedText.text = status.retweetedStatus.text;
        _retweetedText.frame = statusFrame.retweetedTextFrame;
        
        if (status.retweetedStatus.picUrls.count > 0) {
            _retweetedImageView.hidden = NO;
            _retweetedImageView.frame = statusFrame.retweetedImageFrame;
            _retweetedImageView.imageUrls = status.retweetedStatus.picUrls;
        } else {
            _retweetedImageView.hidden = YES;
        }
    } else {
        _retweetedView.hidden = YES;
    }
}

@end
