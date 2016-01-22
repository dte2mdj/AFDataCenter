//
//  AFAccountTool.m
//  AFDataCenter
//
//  Created by Apple on 16/1/22.
//  Copyright © 2016年 AoFeng. All rights reserved.
//

#import "AFAccountTool.h"

#define AFUserDefaults [NSUserDefaults standardUserDefaults]

@implementation AFAccountTool
+ (void)saveAccount:(NSString *)account pass:(NSString *)pass
{
    [AFUserDefaults setObject:account forKey:@"account"];
    [AFUserDefaults setObject:pass forKey:@"pass"];
    [AFUserDefaults synchronize];
}

+ (NSString *)getAccount
{
    return [AFUserDefaults stringForKey:@"account"];
}

+ (NSString *)getPass
{
    return [AFUserDefaults stringForKey:@"pass"];
}
@end
