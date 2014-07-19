//
//  NSString+Extra.m
//  Veboo
//
//  Created by HeQingbao on 14-7-13.
//  Copyright (c) 2014年 HeQingbao. All rights reserved.
//

#import "NSString+Extra.h"

@implementation NSString (Extra)

- (NSString *)append:(NSString *)append
{
    NSString *ext = [self pathExtension];
    NSString *imageName = [self stringByDeletingPathExtension];
    imageName = [imageName stringByAppendingString:append];
    return [imageName stringByAppendingPathExtension:ext];
}

@end
