//
//  AFHomeVc3.m
//  AFDataCenter
//
//  Created by Apple on 16/1/20.
//  Copyright © 2016年 AoFeng. All rights reserved.
//

#import "AFHomeVc3.h"

@interface AFHomeVc3 ()

@end

@implementation AFHomeVc3

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"激活";
    
    
    
    self.toolView.typeNames = self.typeNames;
}
- (void)setupParams:(NSMutableDictionary *)params type:(NSInteger)type
{
    params[@"values"] = @"QQQ";
}

@end
