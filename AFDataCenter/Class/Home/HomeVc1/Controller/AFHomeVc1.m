//
//  AFHomeVc1.m
//  AFDataCenter
//
//  Created by Apple on 16/1/20.
//  Copyright © 2016年 AoFeng. All rights reserved.
//

#import "AFHomeVc1.h"

@interface AFHomeVc1 () <AFHomeBasicToolViewDelegate>

@end

@implementation AFHomeVc1

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"激活";
    self.toolView.typeNames = self.typeNames;
}

- (void)setupParams:(NSMutableDictionary *)params type:(NSInteger)type
{
    params[@"values"] = @"MMMM";
}
@end
