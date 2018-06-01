//
//  JQNetWorkAndCacheTool.h
//  CMB_ChamberOfCommerce
//
//  Created by zhangjiaqi on 2018/5/9.
//  Copyright © 2018年 zhangjiaqi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JQNetWorkAndCacheTool : NSObject

/**
 带缓存的网络请求
    1.YES（POST）/NO（GET）
    2.无网络情况下返回缓存信息
    3.sucess （code== 1） 请求成功数据 返回block
    4.elseCode (code!=1)  block
    5.isHub 是否开启 加载动画
 */
+ (void)JQNetWorkingCachePOST:(BOOL)POST
                   RequestURL:(NSString *)url
                   parameters:(NSDictionary *)parameters
                  sucessBLock:(void (^)(NSArray *result))sucess
                elseCodeBlock:(void (^)(NSString *meassage))elseCode isHub:(BOOL)isHub;


/**
 不带缓存网络请求
    1.YES（POST）/NO（GET）
    2.sucess （code== 1） 请求成功数据 返回block
    3.elseCode (code!=1)  block
    4.isHub 是否开启 加载动画
 */
+ (void)JQNetWorkingPOST:(BOOL)POST
              RequestURL:(NSString *)url
              parameters:(NSDictionary *)parameters
             sucessBLock:(void (^)(NSArray *result))sucess
           elseCodeBlock:(void (^)(NSString *meassage))elseCode isHub:(BOOL)isHub;


/**
 上传图片
 */
+ (void)UpImageData_RequestURL:(NSString *)url
                    parameters:(NSDictionary *)parameters
                    imageArray:(NSArray *)imageArray
                          name:(NSString *)Name
                     fileNames:(NSString *)fileNames
                    imageScale:(float )imageScale
                   sucessBLock:(void (^)(void))sucess;

@end
