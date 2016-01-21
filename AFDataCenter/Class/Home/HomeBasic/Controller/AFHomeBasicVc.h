//
//  AFHomeBasicVc.h
//  AFDataCenter
//
//  Created by Apple on 16/1/20.
//  Copyright © 2016年 AoFeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFHomeBasicToolView.h"

@interface AFHomeBasicVc : UIViewController
/** 所有类别的tableView */
@property (nonatomic, strong) NSMutableArray *tbvs;
/** 工具view */
@property (nonatomic, strong) AFHomeBasicToolView *toolView;
/** 用来放置tableView */
@property (nonatomic, strong) UIScrollView *scrollView;
/** 类别的名称 */
@property (nonatomic, strong) NSArray *typeNames;
/** 当前的类别 */
@property (nonatomic, assign) NSInteger currentType;
@end
