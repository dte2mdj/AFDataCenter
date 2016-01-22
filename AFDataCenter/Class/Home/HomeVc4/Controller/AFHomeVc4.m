//
//  AFHomeVc4.m
//  AFDataCenter
//
//  Created by Apple on 16/1/20.
//  Copyright © 2016年 AoFeng. All rights reserved.
//

#import "AFHomeVc4.h"
#import "AFLoginController.h"

@interface AFHomeVc4 () <AFHomeBasicVcDataSource>

@end

@implementation AFHomeVc4

- (instancetype)init
{
    self = [super init];
    if (self) {
        UIButton *cancelBtn = [[UIButton alloc] init];
        cancelBtn.frame = CGRectMake(0, 0, 44, 44);
        [cancelBtn setTitle:@"注销" forState:UIControlStateNormal];
        [cancelBtn setTitleColor:AFColor(255, 255, 255) forState:UIControlStateNormal];
        [cancelBtn addTarget:self action:@selector(cancel) forControlEvents:UIControlEventTouchUpInside];
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:cancelBtn];
    }
    return self;
}

- (void)cancel
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"是否注销" preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *confirm = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        AFLoginController *tmpVc = [[AFLoginController alloc] init];
        WINDOW.rootViewController = tmpVc;
    }];
    [alert addAction:cancel];
    [alert addAction:confirm];
    
    [self presentViewController:alert animated:YES completion:nil];
}

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
    static NSString *ID = @"AFHomeVc4Cell";
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
