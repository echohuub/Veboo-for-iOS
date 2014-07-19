//
//  OAuthController.m
//  Veboo
//
//  Created by HeQingbao on 14-7-13.
//  Copyright (c) 2014年 HeQingbao. All rights reserved.
//

#import "OAuthController.h"
#import "MainController.h"
#import "HttpHelper.h"
#import "WeiboConfig.h"
#import "Account.h"
#import "AccountHelper.h"

#import <TSMessage.h>

@interface OAuthController () <UIWebViewDelegate>
{
    UIWebView *_webView;
}
@end

@implementation OAuthController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)loadView
{
    _webView = [[UIWebView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
    _webView.delegate = self;
    self.view = _webView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *urlStr = [kAuthorizeURI stringByAppendingFormat:@"?display=mobile&client_id=%@&redirect_uri=%@", kAppKey, kRedirectURI];
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
}

#pragma mark UIWebViewDelegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSString *urlStr = request.URL.absoluteString;
    NSRange range = [urlStr rangeOfString:@"code="];
    if (range.length) {
        NSString *requestToken = [urlStr substringFromIndex:range.location + range.length];
        
        [self getAccessToken:requestToken];
        
        return NO;
    }
    return YES;
}

- (void)getAccessToken:(NSString *)requestToken
{
    NSDictionary *params = @{@"client_id":kAppKey, @"client_secret":kAppSecret, @"grant_type":@"authorization_code", @"code":requestToken, @"redirect_uri":kRedirectURI};
    
    [HttpHelper postWithURL:kAccessTokenURI params:params success:^(NSDictionary *response) {
        // 保存账号信息
        Account *account = [[Account alloc] init];
        account.accessToken = response[@"access_token"];
        account.uid = response[@"uid"];
        [[AccountHelper sharedAccountHelper] saveAccount:account];
        
        self.view.window.rootViewController = [[MainController alloc] init];
    } failure:^(NSError *error) {
        [TSMessage showNotificationInViewController:self title:@"发生错误" subtitle:@"登录出错，请重试" type:TSMessageNotificationTypeError];
    }];
}

@end
