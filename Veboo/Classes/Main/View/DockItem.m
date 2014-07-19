//
//  DockItem.m
//  Veboo
//
//  Created by HeQingbao on 14-7-13.
//  Copyright (c) 2014年 HeQingbao. All rights reserved.
//

#import "DockItem.h"

// 文字的高度比例
#define kTitleRatio 0.3

#define kDockItemSelectedBG @"tabbar_slider.png"

@implementation DockItem

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.titleLabel.font = [UIFont systemFontOfSize:12];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        
        self.imageView.contentMode = UIViewContentModeCenter;
        
        [self setBackgroundImage:[UIImage imageNamed:kDockItemSelectedBG] forState:UIControlStateSelected];
    }
    return self;
}

- (void)setHighlighted:(BOOL)highlighted
{}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleWidth = contentRect.size.width;
    CGFloat titleHeight = contentRect.size.height * kTitleRatio;
    CGFloat titleX = 0;
    CGFloat titleY = contentRect.size.height - titleHeight - 3;
    return CGRectMake(titleX, titleY, titleWidth, titleHeight);
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat titleX = 0;
    CGFloat titleY = 0;
    CGFloat titleWidth = contentRect.size.width;
    CGFloat titleHeight = contentRect.size.height * (1 - kTitleRatio);
    return CGRectMake(titleX, titleY, titleWidth, titleHeight);
}

@end
