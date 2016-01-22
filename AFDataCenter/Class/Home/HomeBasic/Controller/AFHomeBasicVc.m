//
//  AFHomeBasicVc.m
//  AFDataCenter
//
//  Created by Apple on 16/1/20.
//  Copyright © 2016年 AoFeng. All rights reserved.
//

#import "AFHomeBasicVc.h"
#import "UIView+SDAutoLayout.h"

@interface AFHomeBasicVc () <UITableViewDataSource, AFHomeBasicToolViewDelegate, UIScrollViewDelegate>

/** 所有类别的tableView */
@property (nonatomic, strong) NSMutableArray *tbvs;
/** 用来放置tableView */
@property (nonatomic, strong) UIScrollView *scrollView;
/** 当前的类别 */
@property (nonatomic, assign) NSInteger currentType;
@end

@implementation AFHomeBasicVc


- (NSArray *)typeNames
{
    if (!_typeNames) {
        _typeNames = [NSArray array];
        _typeNames = @[@"日", @"周", @"月", @"年"];
    }
    return _typeNames;
}


- (NSMutableArray *)tbvs
{
    if (!_tbvs) {
        _tbvs = [NSMutableArray array];
    }
    return _tbvs;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = AFGlobalBg;
    
    // 1、设置上方工具View
    [self setupToolView];
    
    // 2、设置scrollView
    [self setupScrollView];
}

/**
 *  设置上方工具View
 */
- (void)setupToolView
{
    // 创建上方的toolView
    _toolView = [[AFHomeBasicToolView alloc] init];
    [self.view addSubview:_toolView];
    
    // 设计约束
    _toolView.sd_layout
    .topSpaceToView(self.view, 64)
    .rightEqualToView(self.view)
    .leftEqualToView(self.view)
    .heightIs(44);
    
    _toolView.delegate = self;
    
}

/**
 *  设置scrollView
 */
- (void)setupScrollView
{
    NSInteger tmpCount = self.typeNames.count;
    // 创建scrollView
    _scrollView = [[UIScrollView alloc] init];
    _scrollView.delegate = self;
    _scrollView.pagingEnabled = YES;
    _scrollView.backgroundColor = AFColor(189, 250, 250);
    _scrollView.contentSize = CGSizeMake(tmpCount * SCW, 0);
    [self.view addSubview:_scrollView];
    
    _scrollView.sd_layout
    .topSpaceToView(_toolView, 0)
    .rightEqualToView(self.view)
    .leftEqualToView(self.view)
    .bottomSpaceToView(self.tabBarController.tabBar, 1);
    
    for (int i = 0; i < self.typeNames.count; i++) {
        [self setupTableViewWithType:i];
    }
}

/**
 *  设置tableView
 *
 *  @param index 索引
 */
- (void)setupTableViewWithType:(int)type
{
    UITableView *tbv = [[UITableView alloc] init];
    [self.tbvs addObject:tbv];
    [self.scrollView addSubview:tbv];
    tbv.sd_layout
    .widthRatioToView(self.scrollView, 1)
    .heightRatioToView(self.scrollView, 1)
    .yIs(0)
    .xIs(type * SCW);
    
    tbv.dataSource = self;
    
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadNewData方法）
    
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self loadNewDataWithType:type];
    }];
    // 设置header
    tbv.mj_header = header;
}

- (void)loadNewDataWithType:(NSInteger)type
{
    AFLog(@"loadNewData.......");
    
    [self sendRequestWithType:type];
}

#pragma mark tbv数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataSource homeTableView:tableView numberOfRowsInSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.dataSource homeTableView:tableView cellForRowAtIndexPath:indexPath];
}

#pragma mark - AFHomeBasicToolViewDelegate代理方法
- (void)toolView:(AFHomeBasicToolView *)toolView didSelectButtonFromOldType:(NSInteger)oldType toNewType:(NSInteger)newType
{
    [UIView animateWithDuration:0.3 animations:^{
        _scrollView.contentOffset = CGPointMake(newType * SCW, 0);
    }];
    
    // 发送请求，获得数据
    [self sendRequestWithType:newType];
}

#pragma mark - UIScrollView代理方法
/**
 *  scrollView发生滚动的时候调用
 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat sx = scrollView.contentOffset.x / self.typeNames.count;
    _toolView.lineView.transform = CGAffineTransformMakeTranslation(sx, 0);
}

/**
 *  当拖动scroll滚动停止的时候调用
 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    // 停止滚动的时候，计算出第几页
    NSInteger type = scrollView.contentOffset.x / SCW;
    
    // 如果当前页发生变化
    if (type != _currentType) {
        // 保存当前的currenTtype
        _currentType = type;
        
        // 更新toolView按钮状态
        [_toolView changeButtonStateWithTag:type];
        
        // 发送请求，获得数据
        [self sendRequestWithType:type];
    }
}

- (void)sendRequestWithType:(NSInteger)type
{
    // 保存当前的类别
    _currentType = type;

    // 请求获取数据
    [self loadDataWithType:type tableView:self.tbvs[type]];
}

@end
