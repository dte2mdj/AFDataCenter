//
//  AFHomeVc4.m
//  AFDataCenter
//
//  Created by Apple on 16/1/20.
//  Copyright © 2016年 AoFeng. All rights reserved.
//

#import "AFHomeVc4.h"

@interface AFHomeVc4 ()

@end

@implementation AFHomeVc4

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"激活";
    
    
    
    self.toolView.typeNames = self.typeNames;
}

- (void)setupParams:(NSMutableDictionary *)params type:(NSInteger)type
{
    params[@"values"] = @"KKK";
}
@end
