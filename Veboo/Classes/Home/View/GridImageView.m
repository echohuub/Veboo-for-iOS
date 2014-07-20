//
//  GridImageView.m
//  Veboo
//
//  Created by HeQingbao on 14-7-19.
//  Copyright (c) 2014年 HeQingbao. All rights reserved.
//

#import "GridImageView.h"
#import "ImageItemView.h"

#define kImageCount 9

#define kSingleImageWidth 120
#define kSingleImageHeight 120

#define kMultipleImageWidth 80
#define kMutipleImageHeight 80
#define kMutipleImageMargin 5

@implementation GridImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        for (int i = 0; i < kImageCount; i++) {
            ImageItemView *imageView = [[ImageItemView alloc] init];
            [self addSubview:imageView];
        }
    }
    return self;
}

- (void)setImageUrls:(NSArray *)imageUrls
{
    _imageUrls = imageUrls;
    
    int count = imageUrls.count;
    for (int i = 0; i < kImageCount; i++) {
        ImageItemView *childView = self.subviews[i];
        if (i >= count) {
            childView.hidden = YES;
            continue;
        }
        
        childView.hidden = NO;
        childView.imageUrl = imageUrls[i];
        
        if (count == 1) { // 只有一张图片
            childView.contentMode = UIViewContentModeScaleAspectFit;
            childView.frame = CGRectMake(0, 0, kSingleImageWidth, kSingleImageHeight);
            continue;
        }
        
        childView.contentMode = UIViewContentModeScaleAspectFill;
        childView.clipsToBounds = YES;
        
        int temp = count == 4 ? 2 : 3;
        CGFloat row = i / temp;
        CGFloat coloum = i % temp;
        CGFloat x = (kMultipleImageWidth + kMutipleImageMargin) * coloum;
        CGFloat y = (kMutipleImageHeight + kMutipleImageMargin) * row;
        childView.frame = CGRectMake(x, y, kMultipleImageWidth, kMutipleImageHeight);
    }
}

+ (CGSize)sizeWithImageCount:(int)count
{
    if (count == 1) {
        return CGSizeMake(kSingleImageWidth, kSingleImageHeight);
    }
    
    int coloums = (count == 4) ? 2 : 3; // 总列数
    int rows = (count + coloums - 1) / coloums; // 总行数

    CGFloat width = (kMultipleImageWidth + kMutipleImageMargin) * coloums - kMutipleImageMargin;
    CGFloat height = (kMutipleImageHeight + kMutipleImageMargin) * rows - kMutipleImageMargin;
    return CGSizeMake(width, height);
}

@end
