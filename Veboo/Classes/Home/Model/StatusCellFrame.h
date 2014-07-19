//
//  StatusCellFrame.h
//  Veboo
//
//  Created by HeQingbao on 14-7-15.
//  Copyright (c) 2014年 HeQingbao. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Status;
@interface StatusCellFrame : NSObject

@property (nonatomic, strong) Status *status;

@property (nonatomic, assign, readonly) CGRect avatarFrame;
@property (nonatomic, assign, readonly) CGRect nameFrame;
@property (nonatomic, assign, readonly) CGRect createTimeFrame;
@property (nonatomic, assign, readonly) CGRect sourceFrame;
@property (nonatomic, assign, readonly) CGRect textFrame;
@property (nonatomic, assign, readonly) CGRect imageFrame;

@property (nonatomic, assign, readonly) CGRect retweetedFrame;
@property (nonatomic, assign, readonly) CGRect retweetedTextFrame;
@property (nonatomic, assign, readonly) CGRect retweetedImageFrame;

@property (nonatomic, assign, readonly) CGFloat cellHeight;

@end
