//
//  AFHomeBasicToolView.h
//  AFDataCenter
//
//  Created by Apple on 16/1/20.
//  Copyright © 2016年 AoFeng. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AFHomeBasicToolView;

extern NSString *const AFHomeTypeChangedNotification;
extern NSString *const AFHomeType;

@protocol AFHomeBasicToolViewDelegate <NSObject>

@optional
- (void)toolView:(AFHomeBasicToolView *)toolView didSelectButtonFromOldType:(NSInteger)oldType toNewType:(NSInteger)newType;

@end
@interface AFHomeBasicToolView : UIView
@property (nonatomic, weak) id<AFHomeBasicToolViewDelegate> delegate;

@property (nonatomic, weak) NSArray *typeNames;
/** view下方红色线 */
@property (nonatomic, strong) UIView *lineView;

/** 更新按钮状态 */
- (void)changeButtonStateWithTag:(NSInteger)tag;
@end
