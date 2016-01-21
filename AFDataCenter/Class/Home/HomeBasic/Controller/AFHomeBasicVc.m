//
//  AFHomeBasicVc.m
//  AFDataCenter
//
//  Created by Apple on 16/1/20.
//  Copyright © 2016年 AoFeng. All rights reserved.
//

#import "AFHomeBasicVc.h"
#import "UIView+SDAutoLayout.h"

@interface AFHomeBasicVc () <AFHomeBasicToolViewDelegate, UIScrollViewDelegate>

@property (nonatomic, strong) UIView *coverView;
@end

@implementation AFHomeBasicVc

- (UIView *)coverView
{
    if (!_coverView) {
        _coverView = [[UIView alloc] init];
        _coverView.backgroundColor = [UIColor yellowColor];
        _coverView.frame = _scrollView.frame;
        [self.view addSubview:_coverView];
    }
    return _coverView;
}

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
    
    // 3、设置数据
     _toolView.typeNames = self.typeNames;
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
    int tmpCount = self.typeNames.count;
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
    
}
#pragma mark - AFHomeBasicToolViewDelegate代理方法
- (void)toolView:(AFHomeBasicToolView *)toolView didSelectButtonFromOldType:(NSInteger)oldType toNewType:(NSInteger)newType
{

    [UIView animateWithDuration:0.3 animations:^{
        _scrollView.contentOffset = CGPointMake(newType * SCW, 0);
    } completion:^(BOOL finished) {
        [_coverView removeFromSuperview];
    }];
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
 *  当scroll滚动停止的时候调用
 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    AFLog(@"这里面会不会进来呢");
    
    // 停止滚动的时候，计算出第几页
    NSInteger type = scrollView.contentOffset.x / SCW;
    
    // 如果当前页发生变化
    if (type != _currentType) {
        // 保存当前的currenTtype
        _currentType = type;
        
        AFLog(@"更新按钮状态，tableView进行刷新tag:%d    %d", type, _currentType);
        
        // 更新toolView按钮状态
        [_toolView changeButtonStateWithTag:type];
    }

}
@end
