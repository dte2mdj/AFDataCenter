//
//  AFHttpTool.m
//  AFDataCenter
//
//  Created by Apple on 16/1/22.
//  Copyright © 2016年 AoFeng. All rights reserved.
//

#import "AFHttpTool.h"

@implementation AFHttpTool
+ (void)loginWithParams:(NSDictionary *)params success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure
{
    [self postWithURL:@"" params:params success:^(id responseObj) {
        if (success) {
            success(responseObj);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}
@end
