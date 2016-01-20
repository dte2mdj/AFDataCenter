//
//  JMControllerTool.m
//
//

#import "AFControllerTool.h"
#import "DMTabBarController.h"
#import "AFNavigationController.h"
#import "AFLoginController.h"

#define WINDOW [UIApplication sharedApplication].keyWindow

@implementation AFControllerTool
+ (void)initialize
{
    [AFDefaultCenter addObserver:self selector:@selector(chooseRootViewController) name:LoginSuccess object:nil];
}

+ (void)chooseRootViewController
{
    int a = arc4random() % 2;
    AFLog(@"%d", a);
  
    if (a > 0) {
        AFLoginController *tmpVc = [[AFLoginController alloc] init];
        AFNavigationController *loginNav = [[AFNavigationController alloc] initWithRootViewController:tmpVc];
        WINDOW.rootViewController = loginNav;
    } else {
        DMTabBarController *tabBar = [[DMTabBarController alloc] init];
        WINDOW.rootViewController = tabBar;
    }
    
//    // 如何知道第一次使用这个版本？比较上次的使用情况
//    NSString *versionKey = (__bridge NSString *)kCFBundleVersionKey;
//    
//    // 从沙盒中取出上次存储的软件版本号(取出用户上次的使用记录)
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    NSString *lastVersion = [defaults objectForKey:versionKey];
//    
//    // 获得当前打开软件的版本号
//    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[versionKey];
//    
//    AFLog(@"当前版本号:%@ 上次存储的软件版本号:%@", currentVersion, lastVersion);
//    
//    UIWindow *window = [UIApplication sharedApplication].keyWindow;
//    if ([currentVersion isEqualToString:lastVersion]) {
//        // 当前版本号 == 上次使用的版本：显示JMTabBarViewController
//        [UIApplication sharedApplication].statusBarHidden = NO;
//        window.rootViewController = [[DMTabBarController alloc] init];
//    } else { // 当前版本号 != 上次使用的版本：显示版本新特性
//        
//        
//        // 存储这次使用的软件版本
//        [defaults setObject:currentVersion forKey:versionKey];
//        [defaults synchronize];
//    }
}

- (void)dealloc {

}
@end
