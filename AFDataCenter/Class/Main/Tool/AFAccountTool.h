//
//  AFAccountTool.h
//  AFDataCenter
//
//  Created by Apple on 16/1/22.
//  Copyright © 2016年 AoFeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AFAccountTool : NSObject

+ (void)saveAccount:(NSString *)account pass:(NSString *)pass;
+ (NSString *)getAccount;
+ (NSString *)getPass;

@end
