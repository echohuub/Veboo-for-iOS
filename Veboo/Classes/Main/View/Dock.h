//
//  Dock.h
//  Veboo
//
//  Created by HeQingbao on 14-7-13.
//  Copyright (c) 2014年 HeQingbao. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kDockHeight 44

@class Dock;
@protocol DockDelegate <NSObject>

- (void)dock:(Dock *)dock itemSelectedFrom:(int)from to:(int)to;

@end

@interface Dock : UIView

@property (nonatomic, weak) id<DockDelegate> delegate;

- (void)addItem:(NSString *)icon selected:(NSString *)selected title:(NSString *)title;

@end
