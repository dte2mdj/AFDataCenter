//
//  AFHomeBasicToolView.m
//  AFDataCenter
//
//  Created by Apple on 16/1/20.
//  Copyright © 2016年 AoFeng. All rights reserved.
//

#import "AFHomeBasicToolView.h"

@interface AFHomeBasicToolView ()
@property (nonatomic, strong) UIButton *currentBtn;
@property (nonatomic, strong) NSArray *titles;
@end
@implementation AFHomeBasicToolView

- (NSArray *)titles
{
    if (!_titles) {
        _titles = [NSArray array];
        _titles = @[@"日", @"周", @"月", @"年"];
    }
    return _titles;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup
{
    NSUInteger count = self.titles.count;
    CGFloat btnW = SCW / count;
    CGFloat btnH = 44;
    CGFloat btnY = 0;
    AFLog(@"%f", btnW);
    for (int i = 0; i < count; i++) {
        CGFloat btnX = i * btnW;
        
        UIButton *btn = [[UIButton alloc] init];
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        [btn setTitle:self.titles[i] forState:UIControlStateNormal];
        [btn setTitleColor:AFColor(73, 73, 73) forState:UIControlStateNormal];
        [btn setTitleColor:AFColor(255, 0, 0) forState:UIControlStateDisabled];
        btn.backgroundColor = AFColor(arc4random() % 256, arc4random() % 256, arc4random() % 256);
        [btn addTarget:self action:@selector(changeDate:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        
        if (i == 0) {
            [self changeDate:btn];
        }
        
    }
}

- (void)changeDate:(UIButton *)btn
{
    _currentBtn.enabled = YES;
    
    btn.enabled = NO;
    
    _currentBtn = btn;
    
    AFLog(@"%@", btn.titleLabel.text);
}
@end
