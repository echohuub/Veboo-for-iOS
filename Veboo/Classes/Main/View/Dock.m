//
//  MainDock.m
//  Veboo
//
//  Created by HeQingbao on 14-7-13.
//  Copyright (c) 2014年 HeQingbao. All rights reserved.
//

#import "Dock.h"
#import "DockItem.h"

@interface Dock ()
{
    DockItem *_selectedItem;
}
@end

@implementation Dock

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    
    self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tabbar_background.png"]];
}

- (void)addItem:(NSString *)icon selected:(NSString *)selected title:(NSString *)title
{
    DockItem *item = [DockItem buttonWithType:UIButtonTypeCustom];
    [item setTitle:title forState:UIControlStateNormal];
    [item setImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
    [item setImage:[UIImage imageNamed:selected] forState:UIControlStateSelected];
    [item addTarget:self action:@selector(itemClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:item];
    
    int count = self.subviews.count;
    CGFloat width = self.frame.size.width / count;
    CGFloat height = self.frame.size.height;
    for (int i = 0; i < count; i++) {
        DockItem *item = self.subviews[i];
        item.tag = i;
        item.frame = CGRectMake(i * width, 0, width, height);
        
        if (i == 0) {
            [self itemClicked:item];
        }
    }
}

- (void)itemClicked:(DockItem *)item
{
    if (_selectedItem == item) {
        return;
    }
    
    if ([self.delegate respondsToSelector:@selector(dock:itemSelectedFrom:to:)]) {
        [self.delegate dock:self itemSelectedFrom:_selectedItem.tag to:item.tag];
    }
    
    _selectedItem.selected = NO;
    item.selected = YES;
    _selectedItem = item;
}

@end
