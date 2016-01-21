//
//  AFHomeBasicToolView.m
//  AFDataCenter
//
//  Created by Apple on 16/1/20.
//  Copyright © 2016年 AoFeng. All rights reserved.
//

#import "AFHomeBasicToolView.h"

NSString *const AFHomeTypeChangedNotification = @"AFHomeTypeChangedNotification";
NSString *const AFHomeType = @"AFHomeType";

@interface AFHomeBasicToolView ()
@property (nonatomic, strong) UIButton *currentBtn;
@property (nonatomic, strong) NSMutableArray *btns;
@end
@implementation AFHomeBasicToolView

- (NSMutableArray *)btns
{
    if (!_btns) {
        _btns = [NSMutableArray array];
    }
    return _btns;
}

- (void)setTypeNames:(NSArray *)typeNames
{
    _typeNames = typeNames;
    
    NSUInteger count = self.typeNames.count;
    CGFloat btnW = SCW / count;
    CGFloat btnH = 44;
    CGFloat btnY = 0;
    AFLog(@"%f", btnW);
    for (int i = 0; i < count; i++) {
        CGFloat btnX = i * btnW;
        
        UIButton *btn = [[UIButton alloc] init];
        [self.btns addObject:btn];
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        [btn setTitle:self.typeNames[i] forState:UIControlStateNormal];
        [btn setTitleColor:AFColor(73, 73, 73) forState:UIControlStateNormal];
        [btn setTitleColor:AFColor(255, 0, 0) forState:UIControlStateDisabled];
        btn.backgroundColor = AFColor(arc4random() % 256, arc4random() % 256, arc4random() % 256);
        btn.tag = i;
        [btn addTarget:self action:@selector(changeDate:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        
        if (i == 0) {
            [self changeDate:btn];
        }
    }
    
    _lineView = [[UIView alloc] init];
    _lineView.frame = CGRectMake(0, btnH - 1, btnW, 1);
    _lineView.backgroundColor = AFCutomerColor_red;
    [self addSubview:_lineView];
   
}

- (void)changeDate:(UIButton *)btn
{
    // 0、使用代理方法
    if ([self.delegate respondsToSelector:@selector(toolView:didSelectButtonFromOldType:toNewType:)]) {
        [self.delegate toolView:self didSelectButtonFromOldType:_currentBtn.tag toNewType:btn.tag];
    }
    
    // 1、切换按钮，并更换状态
    [self changeButtonStateWithTag:btn.tag];
}

/**
 *  切换按钮，并更换状态
 *
 *  @param index 需要切换按钮的索引
 */
- (void)changeButtonStateWithTag:(NSInteger)tag
{
    // 1.取出需要切换的按钮
    UIButton *btn = self.btns[tag];
    
    // 2.将当前按钮状态设为可用
    _currentBtn.enabled = YES;
    
    // 3.将切换后的按钮设为禁用
    btn.enabled = NO;
    
    // 4.将切换后的按钮保存成当前按钮
    _currentBtn = btn;
    
}


@end
