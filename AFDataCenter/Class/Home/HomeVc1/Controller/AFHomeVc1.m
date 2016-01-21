//
//  AFHomeVc1.m
//  AFDataCenter
//
//  Created by Apple on 16/1/20.
//  Copyright © 2016年 AoFeng. All rights reserved.
//

#import "AFHomeVc1.h"

@interface AFHomeVc1 () <UITableViewDataSource>

@end

@implementation AFHomeVc1

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"激活";
    
    for (int i = 0; i < self.typeNames.count; i++) {
        [self setupTableViewWithIndex:i];
    }
    
    [AFDefaultCenter addObserver:self selector:@selector(homeTypeChanged:) name:AFHomeTypeChangedNotification object:self.toolView];
}

/**
 *  设置tableView
 *
 *  @param index 索引
 */
- (void)setupTableViewWithIndex:(int)index
{
    UITableView *tbv = [[UITableView alloc] init];
    [self.tbvs addObject:tbv];
    [self.scrollView addSubview:tbv];
    tbv.sd_layout
    .widthRatioToView(self.scrollView, 1)
    .heightRatioToView(self.scrollView, 1)
    .yIs(0)
    .xIs(index * SCW);
    
    
}


#pragma mark tbv数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"HomeCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"测试数据%ld", (long)indexPath.row];
    
    return cell;
}

- (void)homeTypeChanged:(NSNotification *)notification
{
    NSString *type = notification.userInfo[AFHomeType];
    UITableView *tableView = self.tbvs[type.intValue];
    tableView.dataSource = self;
    [tableView reloadData];
}
@end
