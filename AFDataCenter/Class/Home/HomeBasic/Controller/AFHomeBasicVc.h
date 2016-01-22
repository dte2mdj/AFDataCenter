//
//  AFHomeBasicVc.h
//  AFDataCenter
//
//  Created by Apple on 16/1/20.
//  Copyright © 2016年 AoFeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFHomeBasicToolView.h"
#import "MJRefresh.h"

@interface AFHomeBasicVc : UIViewController
/** 类别的名称 */
@property (nonatomic, strong) NSArray *typeNames;
/** 工具view */
@property (nonatomic, strong) AFHomeBasicToolView *toolView;

// 设置请求参数（让子类去设置）
- (void)setupParams:(NSMutableDictionary *)params type:(NSInteger)type tableView:(UITableView *)tbv;
@end
