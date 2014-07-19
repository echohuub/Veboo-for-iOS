//
//  AppDelegate.m
//  Veboo
//
//  Created by HeQingbao on 14-7-13.
//  Copyright (c) 2014年 HeQingbao. All rights reserved.
//

#import "AppDelegate.h"
#import "NewFeatureController.h"
#import "MainController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // 从Info.plist中取出当前版本号
    NSString *versionKey = (NSString *)kCFBundleVersionKey;
    NSString *curVersion = [NSBundle mainBundle].infoDictionary[versionKey];
    
    // 从UserDefaults中取出版本号
    NSString *preVersion = [[NSUserDefaults standardUserDefaults] objectForKey:versionKey];
    
    if ([curVersion isEqualToString:preVersion]) {
        application.statusBarHidden = NO;
        self.window.rootViewController = [[MainController alloc] init];
    } else {
        // 第一次使用新版本
        [[NSUserDefaults standardUserDefaults] setObject:curVersion forKey:versionKey];
        [[NSUserDefaults standardUserDefaults] synchronize];
    
        application.statusBarHidden = YES;
        self.window.rootViewController = [[NewFeatureController alloc] init];
    }
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
}

- (void)applicationWillTerminate:(UIApplication *)application
{
}

@end
