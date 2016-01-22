//
//  AFHomeBasicVc.h
//  AFDataCenter
//
//  Created by Apple on 16/1/20.
//  Copyright © 2016年 AoFeng. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AFHomeBasicVc;
#import "AFHomeBasicToolView.h"
#import "MJRefresh.h"


@protocol AFHomeBasicVcDataSource <NSObject>

@required // 必须实现，否则失败
/**
 *  每组有多少个
 *
 *  @return 数量
 */
- (NSInteger)homeTableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
/**
 *  显示数据的cell
 *
 *  @param indexPath indexPath
 *
 *  @return cell
 */
- (UITableViewCell *)homeTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
@end

@protocol AFHomeBasicVcDelegate <NSObject>



@end

@interface AFHomeBasicVc : UIViewController
/** 类别的名称 */
@property (nonatomic, strong) NSArray *typeNames;
/** 工具view */
@property (nonatomic, strong) AFHomeBasicToolView *toolView;

@property (nonatomic, weak) id<AFHomeBasicVcDataSource> dataSource;
@property (nonatomic, weak) id<AFHomeBasicVcDelegate> delegate;

// ===================================================================
// ============================子类需要继承的方法========================
/**
 *  请求刷新数据
 *
 *  @param type 类别
 *  @param tbv  显示数据的tableView
 */
- (void)loadDataWithType:(NSInteger)type tableView:(UITableView *)tbv;
// ===================================================================


@end
