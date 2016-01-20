
#import "DMTabBarController.h"
#import "DMTabBar.h"
#import "DMTabBarButton.h"

#import "AFNavigationController.h"

#import "AFHomeVc1.h"
#import "AFHomeVc2.h"
#import "AFHomeVc3.h"
#import "AFHomeVc4.h"


@interface DMTabBarController () <DMTabBarDelegate>
@end

@implementation DMTabBarController

- (instancetype)init
{
    self = [super init];
    if (self) {
        AFHomeVc1 *vc1 = [[AFHomeVc1 alloc] init];
        AFNavigationController *nav1 = [[AFNavigationController alloc] initWithRootViewController:vc1];
        
        AFHomeVc2 *vc2 = [[AFHomeVc2 alloc] init];
        AFNavigationController *nav2 = [[AFNavigationController alloc] initWithRootViewController:vc2];
        
        AFHomeVc3 *vc3 = [[AFHomeVc3 alloc] init];
        AFNavigationController *nav3 = [[AFNavigationController alloc] initWithRootViewController:vc3];
        
        AFHomeVc4 *vc4 = [[AFHomeVc4 alloc] init];
        AFNavigationController *nav4 = [[AFNavigationController alloc] initWithRootViewController:vc4];
        
        self.viewControllers = @[nav1, nav2, nav3, nav4];
    }
    return self;
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // 1.添加自己的tabbar
    DMTabBar *myTabBar = [[DMTabBar alloc] init];
    myTabBar.delegate = self;
    myTabBar.frame = self.tabBar.bounds;
    [self.tabBar addSubview:myTabBar];
    // 2.添加对应个数的按钮
    NSArray *titles = [NSArray array];
    titles = @[@"会员激活", @"会员申请", @"精品壹佰", @"精佰礼包"];
    
    for (int i = 0; i < self.viewControllers.count; i++) {
        [myTabBar addTabButtonWithTitle:titles[i]];
//        NSString *name = [NSString stringWithFormat:@"TabBar%d", i + 1];
//        NSString *selName = [NSString stringWithFormat:@"TabBar%dSel", i + 1];
//        [myTabBar addTabButtonWithName:name selName:selName];
    }
}

/**
 normal : 普通状态
 highlighted : 高亮(用户长按的时候达到这个状态)
 disable : enabled = NO
 selected :  selected = YES
 */

#pragma mark - DMTabBar的代理方法
- (void)tabBar:(DMTabBar *)tabBar didSelectButtonFrom:(NSInteger)from to:(NSInteger)to
{
    // 选中最新的控制器
    self.selectedIndex = to;
}
@end