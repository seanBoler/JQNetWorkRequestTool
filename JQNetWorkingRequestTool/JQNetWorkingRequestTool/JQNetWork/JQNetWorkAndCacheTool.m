//
//  JQNetWorkAndCacheTool.m
//  CMB_ChamberOfCommerce
//
//  Created by zhangjiaqi on 2018/5/9.
//  Copyright © 2018年 zhangjiaqi. All rights reserved.
//


/**
    网络请求
        1.缓存功能
        2.清除缓存功能
        3.加载动画 开关
        4.图片上传等
            需要    pod 'AFNetworking'
                    pod 'PPNetworkHelper'       封装AFNetworking 缓存
                    pod 'SVProgressHUD'         加载动画
 */

#import "JQNetWorkAndCacheTool.h"
#import "PPNetworkHelper.h"
#import <SVProgressHUD/SVProgressHUD.h>

@implementation JQNetWorkAndCacheTool

+(NSString *)responseObjectCode{
    return @"code";
}

+(NSString *)responseresult{
    return @"result";
}
+ (NSString *)responsemeassage{
    return @"meassage";
}

+ (NSString *)JQNetWorkingBeaseUrl{
    //return @"https://www.wanweiwang.com";
    return @"";
}

+ (void)JQNetWorkingCachePOST:(BOOL)POST RequestURL:(NSString *)url parameters:(NSDictionary *)parameters sucessBLock:(void (^)(NSArray *))sucess elseCodeBlock:(void (^)(NSString *))elseCode isHub:(BOOL)isHub{
    
    [PPNetworkHelper openLog];      //开启打印日志
    
    if (isHub) {
        [SVProgressHUD show];
        [SVProgressHUD showWithStatus:@"加载中..."];
    }
    
    NSString *requestUrl =  [[JQNetWorkAndCacheTool JQNetWorkingBeaseUrl] stringByAppendingString:url];
    
    if (POST) {
        [PPNetworkHelper POST:requestUrl parameters:parameters responseCache:^(id responseCache) {
            
            if (isHub) {
                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [SVProgressHUD dismiss];
                    });
                });
            }
            
            //缓存数据
            if (!kIsNetwork) {
                if ([responseCache[[JQNetWorkAndCacheTool responseObjectCode]] integerValue] == 1) {
                    NSArray *result = responseCache[[JQNetWorkAndCacheTool responseresult]];
                    if (sucess) {
                        sucess(result.copy);
                    }
                }else{
                    NSString *meassage = responseCache[[JQNetWorkAndCacheTool responsemeassage]];
                    
                    if (elseCode) {
                        elseCode(meassage);
                    }
                }
            }
        } success:^(id responseObject) {
            
            if (isHub) {
                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [SVProgressHUD dismiss];
                    });
                });
            }
            //缓存数据
            if (kIsNetwork) {
                if ([responseObject[[JQNetWorkAndCacheTool responseObjectCode]] integerValue] == 1) {
                    NSArray *result = responseObject[[JQNetWorkAndCacheTool responseresult]];
                    if (sucess) {
                        sucess(result.copy);
                    }
                }else{
                    NSString *meassage = responseObject[[JQNetWorkAndCacheTool responsemeassage]];
                    
                    if (elseCode) {
                        elseCode(meassage);
                    }
                }
            }
            
        } failure:^(NSError *error) {
            NSLog(@"打印出来的错误信息 ----- error ==%@", [error userInfo][@"com.alamofire.serialization.response.error.string"]);
            
            [SVProgressHUD setMinimumDismissTimeInterval:2];
            [SVProgressHUD showErrorWithStatus:@"网络连接失败!"];
        }];
        
    }else{
        [PPNetworkHelper GET:requestUrl parameters:parameters responseCache:^(id responseCache) {
            
            if (isHub) {
                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [SVProgressHUD dismiss];
                    });
                });
            }
            
            //缓存数据
            if (!kIsNetwork) {
                if ([responseCache[[JQNetWorkAndCacheTool responseObjectCode]] integerValue] == 1) {
                    NSArray *result = responseCache[[JQNetWorkAndCacheTool responseresult]];
                    if (sucess) {
                        sucess(result.copy);
                    }
                }else{
                    NSString *meassage = responseCache[[JQNetWorkAndCacheTool responsemeassage]];
                    
                    if (elseCode) {
                        elseCode(meassage);
                    }
                }
            }
            
        } success:^(id responseObject) {
            
            if (isHub) {
                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [SVProgressHUD dismiss];
                    });
                });
            }
            //缓存数据
            if (kIsNetwork) {
                if ([responseObject[[JQNetWorkAndCacheTool responseObjectCode]] integerValue] == 1) {
                    NSArray *result = responseObject[[JQNetWorkAndCacheTool responseresult]];
                    if (sucess) {
                        sucess(result.copy);
                    }
                }else{
                    NSString *meassage = responseObject[[JQNetWorkAndCacheTool responsemeassage]];
                    
                    if (elseCode) {
                        elseCode(meassage);
                    }
                }
            }
            
        } failure:^(NSError *error) {
            NSLog(@"打印出来的错误信息 ----- error ==%@", [error userInfo][@"com.alamofire.serialization.response.error.string"]);
            
            [SVProgressHUD setMinimumDismissTimeInterval:2];
            [SVProgressHUD showErrorWithStatus:@"网络连接失败!"];
        }];
        
    }
    
}



+ (void)JQNetWorkingPOST:(BOOL)POST RequestURL:(NSString *)url parameters:(NSDictionary *)parameters sucessBLock:(void (^)(NSArray *))sucess elseCodeBlock:(void (^)(NSString *))elseCode isHub:(BOOL)isHub{
    [PPNetworkHelper openLog];      //开启打印日志
    
    if (isHub) {
        [SVProgressHUD show];
        [SVProgressHUD showWithStatus:@"加载中..."];
    }
    
    NSString *requestUrl =  [[JQNetWorkAndCacheTool JQNetWorkingBeaseUrl] stringByAppendingString:url];
    
    if (POST) {
        [PPNetworkHelper POST:requestUrl parameters:parameters success:^(id responseObject) {
            
            if (isHub) {
                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [SVProgressHUD dismiss];
                    });
                });
            }
            
            if ([responseObject[[JQNetWorkAndCacheTool responseObjectCode]] integerValue] == 1) {
                NSArray *result = responseObject[[JQNetWorkAndCacheTool responseresult]];
                if (sucess) {
                    sucess(result.copy);
                }
            }else{
                NSString *meassage = responseObject[[JQNetWorkAndCacheTool responsemeassage]];
                
                if (elseCode) {
                    elseCode(meassage);
                }
            }
            
        } failure:^(NSError *error) {
            NSLog(@"打印出来的错误信息 ----- error ==%@", [error userInfo][@"com.alamofire.serialization.response.error.string"]);
            
            [SVProgressHUD setMinimumDismissTimeInterval:2];
            [SVProgressHUD showErrorWithStatus:@"网络连接失败!"];
        }];
        
    }else{
        
        [PPNetworkHelper GET:requestUrl parameters:parameters success:^(id responseObject) {
            
            if (isHub) {
                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [SVProgressHUD dismiss];
                    });
                });
            }
            
            if ([responseObject[[JQNetWorkAndCacheTool responseObjectCode]] integerValue] == 1) {
                NSArray *result = responseObject[[JQNetWorkAndCacheTool responseresult]];
                if (sucess) {
                    sucess(result.copy);
                }
            }else{
                NSString *meassage = responseObject[[JQNetWorkAndCacheTool responsemeassage]];
                
                if (elseCode) {
                    elseCode(meassage);
                }
            }
            
            
        } failure:^(NSError *error) {
            NSLog(@"打印出来的错误信息 ----- error ==%@", [error userInfo][@"com.alamofire.serialization.response.error.string"]);
            
            [SVProgressHUD setMinimumDismissTimeInterval:2];
            [SVProgressHUD showErrorWithStatus:@"网络连接失败!"];
        }];
        
    }
}


+ (void)UpImageData_RequestURL:(NSString *)url parameters:(NSDictionary *)parameters imageArray:(NSArray *)imageArray name:(NSString *)Name fileNames:(NSString *)fileNames imageScale:(float)imageScale sucessBLock:(void (^)(void))sucess{
    
    __block NSMutableArray *fileNamesArray = [NSMutableArray array];
    for (int index = 0; index< imageArray.count; index++) {
        [fileNamesArray addObject:fileNames];
    }
    
    NSString *requestUrl =  [[JQNetWorkAndCacheTool JQNetWorkingBeaseUrl] stringByAppendingString:url];
    [PPNetworkHelper uploadImagesWithURL:requestUrl parameters:parameters name:Name images:imageArray fileNames:fileNamesArray imageScale:imageScale imageType:nil progress:^(NSProgress *progress) {
        
        float pr = [progress.localizedDescription floatValue];
        [SVProgressHUD showProgress:pr status:@"正在上传"];
        
    } success:^(id responseObject) {

        [SVProgressHUD setMinimumDismissTimeInterval:2];
        [SVProgressHUD showSuccessWithStatus:responseObject[[JQNetWorkAndCacheTool responsemeassage]]];
        if (sucess) {
            sucess();
        }
        
    } failure:^(NSError *error) {
        NSLog(@"打印出来的错误信息 ----- error ==%@", [error userInfo][@"com.alamofire.serialization.response.error.string"]);
        [SVProgressHUD setMinimumDismissTimeInterval:2];
        [SVProgressHUD showErrorWithStatus:@"网络连接失败!"];
    }];
}


@end
