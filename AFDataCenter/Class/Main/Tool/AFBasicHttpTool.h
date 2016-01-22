//
//  AFHttpTool.h
//  AFDataCenter
//
//  Created by Apple on 16/1/22.
//  Copyright © 2016年 AoFeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface AFBasicHttpTool : NSObject
/**
 *  发送一个get请求
 *
 *  @param url     请求路径
 *  @param params  参数字典
 *  @param success 成功时执行
 *  @param failure 失败时执行
 */
+ (void)getWithURL:(NSString *)url params:(NSDictionary *)params success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure;
/**
 *  发送一个Post请求
 *
 *  @param url     请求路径
 *  @param params  参数字典
 *  @param success 成功时执行
 *  @param failure 失败时执行
 */
+ (void)postWithURL:(NSString *)url params:(NSDictionary *)params success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure;
/**
 *  发送一个Post请求
 *
 *  @param url     请求路径
 *  @param params  参数字典
 *  @param fmData  需要上传的数据
 *  @param success 成功时执行
 *  @param failure 失败时执行
 */
+ (void)postWithURL:(NSString *)url params:(NSDictionary *)params constructingBodyWithBlock:(void (^)(id <AFMultipartFormData> formData))fmData success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure;
@end
