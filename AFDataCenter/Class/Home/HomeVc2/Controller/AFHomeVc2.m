//
//  AFHomeVc2.m
//  AFDataCenter
//
//  Created by Apple on 16/1/20.
//  Copyright © 2016年 AoFeng. All rights reserved.
//

#import "AFHomeVc2.h"

@interface AFHomeVc2 ()

@end

@implementation AFHomeVc2
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"激活";
    
    
    
    self.toolView.typeNames = self.typeNames;
}

- (void)setupParams:(NSMutableDictionary *)params type:(NSInteger)type tableView:(UITableView *)tbv
{
    [tbv.mj_header endRefreshing];
    params[@"values"] = @"AAA";
}
@end
