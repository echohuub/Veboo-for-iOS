//
//  GridImageView.h
//  Veboo
//
//  Created by HeQingbao on 14-7-19.
//  Copyright (c) 2014年 HeQingbao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GridImageView : UIView

@property (nonatomic, strong) NSArray *imageUrls;

+ (CGSize)sizeWithImageCount:(int)count;

@end
