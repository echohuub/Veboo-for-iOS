//
//  HomeController.m
//  Veboo
//
//  Created by HeQingbao on 14-7-13.
//  Copyright (c) 2014年 HeQingbao. All rights reserved.
//

#import "HomeController.h"
#import "DetailController.h"
#import "StatusTool.h"
#import "Status.h"
#import "User.h"
#import "StatusCellFrame.h"
#import "StatusCell.h"

@interface HomeController ()
{
    NSMutableArray *_statuses;
}
@end

@implementation HomeController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"首页";
    
    [self loadStatusData];
    
    self.tableView.backgroundColor = kColor(232, 233, 232);
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void)loadStatusData
{
    _statuses = [NSMutableArray array];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:@50 forKey:@"count"];
    [StatusTool getStatusWithUrl:@"https://api.weibo.com/2/statuses/home_timeline.json" params:params success:^(NSArray *statuses) {
        [_statuses addObjectsFromArray:statuses];
        [self.tableView reloadData];
    } failure:^(NSError *error) {
        NSLog(@"%@", [error localizedDescription]);
    }];
}

#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _statuses.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"cell";
    StatusCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[StatusCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    StatusCellFrame *cellFrame = [[StatusCellFrame alloc] init];
    cellFrame.status = _statuses[indexPath.row];
    
    cell.statusFrame = cellFrame;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    StatusCellFrame *cellFrame = [[StatusCellFrame alloc] init];
    cellFrame.status = _statuses[indexPath.row];
    return cellFrame.cellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    DetailController *detail = [[DetailController alloc] init];
//    [self.navigationController pushViewController:detail animated:YES];
}

@end
