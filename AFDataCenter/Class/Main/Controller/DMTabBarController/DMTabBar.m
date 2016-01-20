
#import "DMTabBar.h"
#import "DMTabBarButton.h"

@interface DMTabBar()
/**
 *  记录当前选中的按钮
 */
@property (nonatomic, weak) DMTabBarButton *selectedButton;
@end

@implementation DMTabBar

/**
 *  增加tabBar按钮
 *
 *  @param name    未选中图片的名称
 *  @param selName 选中时图片的名称
 */
- (void)addTabButtonWithName:(NSString *)name selName:(NSString *)selName
{
    // 创建按钮
    DMTabBarButton *button = [DMTabBarButton buttonWithType:UIButtonTypeCustom];
    
    // 设置图片
    [button setBackgroundImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:selName] forState:UIControlStateSelected];
    
    [self setupBtn:button];
}

/**
 *  增加tabBar按钮
 *
 *  @param title 按钮的文字
 */
- (void)addTabButtonWithTitle:(NSString *)title
{
    // 创建按钮
    DMTabBarButton *button = [DMTabBarButton buttonWithType:UIButtonTypeCustom];
    
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateSelected];
    
    [button setTitleColor:AFColor(73, 73, 73) forState:UIControlStateNormal];
    [button setTitleColor:AFColor(255, 0, 97) forState:UIControlStateSelected];
    [self setupBtn:button];
}

/**
 *  设置按钮的属性
 */
- (void)setupBtn:(DMTabBarButton *)button
{
    // 添加
    [self addSubview:button];
    
    // 监听
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    
    // 默认选中第0个按钮
    if (self.subviews.count == 1) {
        [self buttonClick:button];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];

    NSInteger count = self.subviews.count;
    for (int i = 0; i<count; i++) {
        DMTabBarButton *button = self.subviews[i];
        button.tag = i;
        
        // 设置frame
        CGFloat buttonY = 0;
        CGFloat buttonW = self.frame.size.width / count;
        CGFloat buttonH = self.frame.size.height;
        CGFloat buttonX = i * buttonW;
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
    }
}

/**
 *  监听按钮点击
 */
- (void)buttonClick:(DMTabBarButton *)button
{
    // 0.通知代理
    if ([self.delegate respondsToSelector:@selector(tabBar:didSelectButtonFrom:to:)]) {
        [self.delegate tabBar:self didSelectButtonFrom:self.selectedButton.tag to:button.tag];
    }
    
    // 1.让当前选中的按钮取消选中
    self.selectedButton.selected = NO;
    
    // 2.让新点击的按钮选中
    button.selected = YES;
    
    // 3.新点击的按钮就成为了"当前选中的按钮"
    self.selectedButton = button;
}
@end