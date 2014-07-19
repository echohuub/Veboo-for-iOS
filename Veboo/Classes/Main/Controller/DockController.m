//
//  DockController.m
//  Veboo
//
//  Created by HeQingbao on 14-7-13.
//  Copyright (c) 2014年 HeQingbao. All rights reserved.
//

#import "DockController.h"
#import "Dock.h"

@interface DockController () <DockDelegate>

@end

@implementation DockController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self addDock];
}

- (void)addDock
{
    CGSize size = self.view.frame.size;
    
    _dock = [[Dock alloc] init];
    _dock.delegate = self;
    _dock.frame = CGRectMake(0, self.view.frame.size.height - kDockHeight, size.width, kDockHeight);
    [self.view addSubview:_dock];
}

#pragma mark DockDelegate
- (void)dock:(Dock *)dock itemSelectedFrom:(int)from to:(int)to
{
    if (to < 0 || to >= self.childViewControllers.count) {
        return;
    }
    
    UIViewController *oldController = self.childViewControllers[from];
    [oldController.view removeFromSuperview];
    
    UIViewController *newController = self.childViewControllers[to];
    CGFloat width = self.view.frame.size.width;
    CGFloat height = self.view.frame.size.height - kDockHeight;
    newController.view.frame = CGRectMake(0, 0, width, height);
    [self.view addSubview:newController.view];
}

@end
