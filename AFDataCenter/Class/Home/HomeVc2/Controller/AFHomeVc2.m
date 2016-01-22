//
//  AFHomeVc2.m
//  AFDataCenter
//
//  Created by Apple on 16/1/20.
//  Copyright © 2016年 AoFeng. All rights reserved.
//

#import "AFHomeVc2.h"

@interface AFHomeVc2 () <AFHomeBasicVcDataSource>

@end

@implementation AFHomeVc2

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"申请";
    self.toolView.typeNames = self.typeNames;
    
    // 设置数据源
    self.dataSource = self;
}

- (NSInteger)homeTableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)homeTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"AFHomeVc2Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"测试数据%ld", (long)indexPath.row];
    
    return cell;
}

- (void)loadDataWithType:(NSInteger)type tableView:(UITableView *)tbv
{
    [tbv.mj_header endRefreshing];
}
@end
