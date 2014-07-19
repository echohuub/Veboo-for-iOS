//
//  UIImage+Extra.m
//  Veboo
//
//  Created by HeQingbao on 14-7-13.
//  Copyright (c) 2014年 HeQingbao. All rights reserved.
//

#import "UIImage+Extra.h"
#import "NSString+Extra.h"

@implementation UIImage (Extra)

+ (UIImage *)fullScreenImage:(NSString *)imageName
{
    if ([UIScreen mainScreen].bounds.size.height == 568) {
        imageName = [imageName append:@"-568h@2x"];
    }
    return [self imageNamed:imageName];
}

@end
