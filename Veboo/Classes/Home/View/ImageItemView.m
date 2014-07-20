//
//  ImageItemView.m
//  Veboo
//
//  Created by HeQingbao on 14-7-20.
//  Copyright (c) 2014年 HeQingbao. All rights reserved.
//

#import "ImageItemView.h"
#import <UIImageView+WebCache.h>

@interface ImageItemView ()
{
    UIImageView *_gifView;
}
@end

@implementation ImageItemView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _gifView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"timeline_image_gif.png"]];
        [self addSubview:_gifView];
    }
    return self;
}

- (void)setImageUrl:(NSString *)imageUrl
{
    _imageUrl = imageUrl;
    
    [self setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:[UIImage imageNamed:@"timeline_image_loading.png"]];
    
    _gifView.hidden = ![imageUrl.lowercaseString hasSuffix:@"gif"];
}

- (void)setFrame:(CGRect)frame
{
    CGRect gifFrame = _gifView.frame;
    gifFrame.origin.x = frame.size.width - gifFrame.size.width;
    gifFrame.origin.y = frame.size.height - gifFrame.size.height;
    _gifView.frame = gifFrame;
    
    [super setFrame:frame];
}

@end
