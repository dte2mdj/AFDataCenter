//
//  AFHomeVc3.m
//  AFDataCenter
//
//  Created by Apple on 16/1/20.
//  Copyright © 2016年 AoFeng. All rights reserved.
//

#import "AFHomeVc3.h"

@interface AFHomeVc3 () <AFHomeBasicVcDataSource>

@end

@implementation AFHomeVc3

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"订单";
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
    static NSString *ID = @"AFHomeVc3Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"测试数据%ld", (long)indexPath.row];
    
    return cell;
}

- (void)loadDataWithType:(NSInteger)type tableView:(UITableView *)tbv
{
    
}
@end
