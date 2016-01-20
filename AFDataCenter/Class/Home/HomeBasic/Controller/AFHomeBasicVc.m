//
//  AFHomeBasicVc.m
//  AFDataCenter
//
//  Created by Apple on 16/1/20.
//  Copyright © 2016年 AoFeng. All rights reserved.
//

#import "AFHomeBasicVc.h"
#import "AFHomeBasicToolView.h"
#import "UIView+SDAutoLayout.h"

@interface AFHomeBasicVc ()
@property (nonatomic, strong) AFHomeBasicToolView *toolView;
@property (nonatomic, strong) UIScrollView *scrollView;
@end

@implementation AFHomeBasicVc

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = AFGlobalBg;
    
    // 创建上方的toolView
    _toolView = [[AFHomeBasicToolView alloc] init];
    [self.view addSubview:_toolView];
    
    // 创建scrollView
    _scrollView = [[UIScrollView alloc] init];
    _scrollView.backgroundColor = AFColor(189, 250, 250);
    _scrollView.contentSize = CGSizeMake(4 * SCW, 0);
    [self.view addSubview:_scrollView];
    
    
    // 设计约束
    _toolView.sd_layout
    .topSpaceToView(self.view, 64)
    .rightEqualToView(self.view)
    .leftEqualToView(self.view)
    .heightIs(44);
    
    _scrollView.sd_layout
    .topSpaceToView(_toolView, 0)
    .rightEqualToView(self.view)
    .leftEqualToView(self.view)
    .bottomSpaceToView(self.tabBarController.tabBar, 1);
}



@end
