//
//  Singleton.h
//  Veboo
//
//  Created by HeQingbao on 14-7-13.
//  Copyright (c) 2014年 HeQingbao. All rights reserved.
//

#define singleton_interface(class) + (class *)shared##class;

#define singleton_implements(class) \
static class *_instance; \
+ (class *)shared##class \
{ \
    if (_instance == nil) { \
        _instance = [[class alloc] init]; \
    } \
    return _instance; \
} \
 \
+ (id)allocWithZone:(struct _NSZone *)zone \
{ \
    static dispatch_once_t onceToken; \
    dispatch_once(&onceToken, ^{ \
        _instance = [super allocWithZone:zone]; \
    }); \
    return _instance; \
}