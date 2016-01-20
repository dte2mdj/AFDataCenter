//
//  AFNavigationController.m
//  AFDataCenter
//
//  Created by Apple on 16/1/20.
//  Copyright © 2016年 AoFeng. All rights reserved.
//

#import "AFNavigationController.h"

@interface AFNavigationController ()
@property (nonatomic, strong) UIButton *backBtn;
@end

@implementation AFNavigationController

/**
 *  设置状态栏的颜色为白色
 */
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (UIButton *)backBtn
{
    if (!_backBtn) {
        _backBtn = [[UIButton alloc] init];
        _backBtn.frame = CGRectMake(0, 0, 44, 44);
        _backBtn.backgroundColor = [UIColor cyanColor];
        [_backBtn setImage:[UIImage imageNamed:@"arrow_back"] forState:UIControlStateNormal];
        [_backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backBtn;
}

// 只有当该类创建的时候才会调用
+ (void)initialize
{
    // 设置导航栏的背景
    UINavigationBar *navBar = [UINavigationBar appearance];
    [navBar setBarTintColor:AFColor(57, 57, 57)];
//    [navBar setBackgroundImage:[UIImage imageNamed:@"background_nav"] forBarMetrics:UIBarMetricsDefault];
    [navBar setBackgroundColor:AFColor(60, 66, 76)];
    
    // 设置导航栏的字体
    NSMutableDictionary *normalDict = [NSMutableDictionary dictionary];
    normalDict[NSFontAttributeName] = [UIFont systemFontOfSize:20]; // 字体大小
    normalDict[NSForegroundColorAttributeName] = [UIColor whiteColor]; // 颜色
    [navBar setTitleTextAttributes:normalDict];
}

/**
 *  能拦截所有的push操作
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (viewController.navigationItem.hidesBackButton != YES) { // 如果返回按钮设置为隐藏则不执行下面代码
        
        if (self.viewControllers.count > 0) { // 当push的不是栈底kongzhiqi的时候才隐藏，不然tabBar第一个push进来就会被隐藏
            viewController.hidesBottomBarWhenPushed = YES;
            viewController.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.backBtn];
        }
    }
    
    [super pushViewController:viewController animated:animated];
}

- (void)back
{
    // 发送返回通知
}

- (void)dealloc
{
    AFLog(@"dealloc--->%s", __func__);
}
@end
