//
//  MainController.m
//  Veboo
//
//  Created by HeQingbao on 14-7-13.
//  Copyright (c) 2014年 HeQingbao. All rights reserved.
//

#import "MainController.h"
#import "HomeController.h"
#import "MessageController.h"
#import "MeController.h"
#import "SquareController.h"
#import "MoreController.h"
#import "Dock.h"

@interface MainController () <UINavigationControllerDelegate>

@end

@implementation MainController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self addAllViewControllers];
    
    [self addDockItems];
}

- (void)addAllViewControllers
{
    HomeController *home = [[HomeController alloc] init];
    UINavigationController *homeNav = [[UINavigationController alloc] initWithRootViewController:home];
    homeNav.delegate = self;
    [self addChildViewController:homeNav];
    
    MessageController *message = [[MessageController alloc] init];
    UINavigationController *messageNav = [[UINavigationController alloc] initWithRootViewController:message];
    messageNav.delegate = self;
    [self addChildViewController:messageNav];
    
    MeController *me = [[MeController alloc] init];
    UINavigationController *meNav = [[UINavigationController alloc] initWithRootViewController:me];
    meNav.delegate = self;
    [self addChildViewController:meNav];
    
    SquareController *square = [[SquareController alloc] init];
    UINavigationController *squareNav = [[UINavigationController alloc] initWithRootViewController:square];
    squareNav.delegate = self;
    [self addChildViewController:squareNav];
    
    MoreController *more = [[MoreController alloc] init];
    UINavigationController *moreNav = [[UINavigationController alloc] initWithRootViewController:more];
    moreNav.delegate = self;
    [self addChildViewController:moreNav];
}

- (void)addDockItems
{
    [self.dock addItem:@"tabbar_home.png" selected:@"tabbar_home_selected.png" title:@"首页"];
    [self.dock addItem:@"tabbar_message_center.png" selected:@"tabbar_message_center_selected.png" title:@"消息"];
    [self.dock addItem:@"tabbar_profile.png" selected:@"tabbar_profile_selected.png" title:@"我"];
    [self.dock addItem:@"tabbar_discover.png" selected:@"tabbar_discover_selected.png" title:@"广场"];
    [self.dock addItem:@"tabbar_more.png" selected:@"tabbar_more_selected.png" title:@"更多"];
}

#pragma mark UINavigationControllerDelegate
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    UIViewController *root = navigationController.viewControllers[0];
    if (root != viewController) { // 不是根控制器
        // 拉长导航控制器的view
        CGRect frame = navigationController.view.frame;
        frame.size.height = [UIScreen mainScreen].bounds.size.height;
        navigationController.view.frame = frame;
        
        // 添加Dock到根控制器的view上面
        [self.dock removeFromSuperview];
        CGRect dockFrame = self.dock.frame;
        dockFrame.origin.y = root.view.frame.size.height - kDockHeight;
        if ([root.view isKindOfClass:[UIScrollView class]]) { // 根控制器的view是能滚动
            UIScrollView *scroll = (UIScrollView *)root.view;
            dockFrame.origin.y += scroll.contentOffset.y;
        }
        self.dock.frame = dockFrame;
        [root.view addSubview:self.dock];
    }
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{

    UIViewController *root = navigationController.viewControllers[0];
    if (viewController == root) {
        // 让导航控制器view的高度还原
        CGRect frame = navigationController.view.frame;
        frame.size.height = [UIScreen mainScreen].bounds.size.height - kDockHeight;
        navigationController.view.frame = frame;
        
        // 添加Dock到mainView上面
        [self.dock removeFromSuperview];
        CGRect dockFrame = self.dock.frame;
        // 调整dock的y值
        dockFrame.origin.y = self.view.frame.size.height - kDockHeight;
        self.dock.frame = dockFrame;
        [self.view addSubview:self.dock];
    }
}

@end
