
#import "DMTabBarButton.h"

@implementation DMTabBarButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/**
 *  只要覆盖了这个方法,按钮就不存在高亮状态
 */
- (void)setHighlighted:(BOOL)highlighted
{
//    [super setHighlighted:highlighted];
}
@end
