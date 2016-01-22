//
//  AFLoginController.m
//  AFDataCenter
//
//  Created by Apple on 16/1/20.
//  Copyright © 2016年 AoFeng. All rights reserved.
//

#import "AFLoginController.h"
#import "UIView+SDAutoLayout.h"
#import "AFTextField.h"
#import "DMTabBarController.h"

@interface AFLoginController ()
/** 账号 */
@property (nonatomic, strong) AFTextField *name;
/** 密码 */
@property (nonatomic, strong) AFTextField *pass;
@end

@implementation AFLoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"登录";
    AFLog(@"%@", NSStringFromCGRect(self.view.frame));
    
    _name = [[AFTextField alloc] init];
    [self.view addSubview:_name];
    _name.placeholder = @"账号";
    
    _pass = [[AFTextField alloc] init];
    _pass.placeholder = @"密码";
    [self.view addSubview:_pass];
    
    UIButton *loginbtn = [[UIButton alloc] init];
    [loginbtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginbtn setTitleColor:AFColor(255, 189, 189) forState:UIControlStateDisabled];
    [loginbtn addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginbtn];
 
    _name.sd_layout
    .topSpaceToView(self.view, 98)
    .leftSpaceToView(self.view, 21)
    .rightSpaceToView(self.view, 21)
    .heightIs(30);
    
    _pass.sd_layout
    .topSpaceToView(_name, 20)
    .leftEqualToView(_name)
    .rightEqualToView(_name)
    .heightIs(30);
    
    loginbtn.sd_layout
    .topSpaceToView(_pass, 20)
    .leftEqualToView(_pass)
    .rightEqualToView(_pass)
    .heightIs(30);
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    _name.text = [AFAccountTool getAccount];
    _pass.text = [AFAccountTool getPass];
}

- (void)login:(UIButton *)btn
{
//    btn.enabled = NO;
    AFLog(@"点击了->禁用");
    if ([_name.text isEqualToString:@"123"] && [_pass.text isEqualToString:@"123"]) {
        
        // 保存账户密码
        [AFAccountTool saveAccount:_name.text pass:_pass.text];
        
        DMTabBarController *tabBar = [[DMTabBarController alloc] init];
        WINDOW.rootViewController = tabBar;
        
    }
}

@end
