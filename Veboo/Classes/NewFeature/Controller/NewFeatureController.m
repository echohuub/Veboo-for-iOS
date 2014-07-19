//
//  NewFeatureController.m
//  Veboo
//
//  Created by HeQingbao on 14-7-13.
//  Copyright (c) 2014年 HeQingbao. All rights reserved.
//

#import "NewFeatureController.h"
#import "OAuthController.h"
#import "UIImage+Extra.h"

#define kBackgroundCount 4

@interface NewFeatureController ()<UIScrollViewDelegate>
{
    UIScrollView *_scrollView;
    UIPageControl *_pageControl;
}
@end

@implementation NewFeatureController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    UIImageView *backgroundView = [[UIImageView alloc] init];
    backgroundView.image = [UIImage fullScreenImage:@"new_feature_background.png"];
    backgroundView.frame = [UIScreen mainScreen].applicationFrame;
    backgroundView.userInteractionEnabled = YES;
    self.view = backgroundView;
    
    [super viewDidLoad];
    
    [self addScrollView];
    
    [self addScrollImages];
    
    [self addPageControl];
}

- (void)addScrollView
{
    _scrollView = [[UIScrollView alloc] init];
    _scrollView.frame = self.view.bounds;
    _scrollView.pagingEnabled = YES;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.delegate = self;
    _scrollView.contentSize = CGSizeMake(self.view.bounds.size.width * kBackgroundCount, 0);
    [self.view addSubview:_scrollView];
}

- (void)addScrollImages
{
    CGSize size = _scrollView.frame.size;
    for (int i = 0; i < kBackgroundCount; i++) {
        UIImageView *scrollImageView = [[UIImageView alloc] init];
        NSString *imageName = [NSString stringWithFormat:@"new_feature_%d.png", i + 1];
        scrollImageView.image = [UIImage fullScreenImage:imageName];
        scrollImageView.frame = CGRectMake(i * size.width, 0, size.width, size.height);
        [_scrollView addSubview:scrollImageView];
        
        // 最后一页
        if (i == kBackgroundCount - 1) {
            scrollImageView.userInteractionEnabled = YES;
            
            UIButton *startButton = [UIButton buttonWithType:UIButtonTypeCustom];
            UIImage *startNormalImage = [UIImage imageNamed:@"new_feature_finish_button.png"];
            [startButton setImage:startNormalImage forState:UIControlStateNormal];
            [startButton setImage:[UIImage imageNamed:@"new_feature_finish_button_highlighted.png"] forState:UIControlStateHighlighted];
            startButton.center = CGPointMake(size.width / 2, size.height * 0.8);
            startButton.bounds = (CGRect){CGPointZero, startNormalImage.size};
            [startButton addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
            [scrollImageView addSubview:startButton];
            
            UIButton *shareButton = [UIButton buttonWithType:UIButtonTypeCustom];
            UIImage *shareNormalImage = [UIImage imageNamed:@"new_feature_share_true.png"];
            [shareButton setImage:shareNormalImage forState:UIControlStateNormal];
            [shareButton setImage:[UIImage imageNamed:@"new_feature_share_false.png"] forState:UIControlStateSelected];
            shareButton.adjustsImageWhenHighlighted = NO;
            shareButton.center = CGPointMake(size.width / 2, startButton.center.y - 50);
            shareButton.bounds = (CGRect){CGPointZero, shareNormalImage.size};
            [shareButton addTarget:self action:@selector(share:) forControlEvents:UIControlEventTouchUpInside];
            
            [scrollImageView addSubview:shareButton];
        }
    }
}

- (void)addPageControl
{
    CGSize size = self.view.frame.size;
    _pageControl = [[UIPageControl alloc] init];
    _pageControl.center = CGPointMake(size.width / 2, size.height * 0.95);
    _pageControl.bounds = CGRectMake(0, 0, 150, 0);
    _pageControl.numberOfPages = 4;
    _pageControl.currentPageIndicatorTintColor = kColor(91, 84, 84);
    _pageControl.pageIndicatorTintColor = kColor(206, 206, 206);
    _pageControl.backgroundColor = [UIColor redColor];
    [self.view addSubview:_pageControl];
}

- (void)start
{
    [UIApplication sharedApplication].statusBarHidden = NO;
    self.view.window.rootViewController = [[OAuthController alloc] init];
}

- (void)share:(UIButton *)shareButton
{
    shareButton.selected = !shareButton.selected;
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int page = scrollView.contentOffset.x / self.view.frame.size.width;
    _pageControl.currentPage = page;
}

@end
