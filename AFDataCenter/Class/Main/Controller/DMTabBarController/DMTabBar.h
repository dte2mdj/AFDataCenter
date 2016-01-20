
#import <UIKit/UIKit.h>
@class DMTabBar;

@protocol DMTabBarDelegate <NSObject>

@optional
- (void)tabBar:(DMTabBar *)tabBar didSelectButtonFrom:(NSInteger)from to:(NSInteger)to;

@end

@interface DMTabBar : UIView
@property (nonatomic, weak) id<DMTabBarDelegate> delegate;

/**
 *  用来添加一个内部的按钮
 *
 *  @param name    按钮图片
 *  @param selName 按钮选中时的图片
 */
- (void)addTabButtonWithName:(NSString *)name selName:(NSString *)selName;

/**
 *  增加tabBar按钮
 *
 *  @param title 按钮的文字
 */
- (void)addTabButtonWithTitle:(NSString *)title;
@end
