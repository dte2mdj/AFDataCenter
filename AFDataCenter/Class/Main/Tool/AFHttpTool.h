//
//  AFHttpTool.h
//  AFDataCenter
//
//  Created by Apple on 16/1/22.
//  Copyright © 2016年 AoFeng. All rights reserved.
//

#import "AFBasicHttpTool.h"

@interface AFHttpTool : AFBasicHttpTool
+ (void)loginWithParams:(NSDictionary *)params success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure;
@end
