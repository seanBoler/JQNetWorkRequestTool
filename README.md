# JQNetWorkRequestTool

##功能介绍：
```ruby
网络请求
1.缓存功能
2.清除缓存功能
3.加载动画 开关
4.图片上传等
需要    pod 'AFNetworking'
       pod 'PPNetworkHelper'       封装AFNetworking 缓存
       pod 'SVProgressHUD'         加载动画
```

```ruby
网络请求工具
封装AFNetWorking
简化网络请求代码量，
```

 ##     带缓存的网络请求
        1.YES（POST）/NO（GET）
        2.无网络情况下返回缓存信息
        3.sucess （code== 1） 请求成功数据 返回block
        4.elseCode (code!=1)  block
        5.isHub 是否开启 加载动画

     
``` objc

+ (void)JQNetWorkingCachePOST:(BOOL)POST
                   RequestURL:(NSString *)url
                   parameters:(NSDictionary *)parameters
                  sucessBLock:(void (^)(NSArray *result))sucess
                elseCodeBlock:(void (^)(NSString *meassage))elseCode isHub:(BOOL)isHub;
```

       



##      不带缓存网络请求
        1.YES（POST）/NO（GET）
        2.sucess （code== 1） 请求成功数据 返回block
        3.elseCode (code!=1)  block
        4.isHub 是否开启 加载动画


``` objc    
+ (void)JQNetWorkingPOST:(BOOL)POST
              RequestURL:(NSString *)url
              parameters:(NSDictionary *)parameters
             sucessBLock:(void (^)(NSArray *result))sucess
           elseCodeBlock:(void (^)(NSString *meassage))elseCode isHub:(BOOL)isHub;
           
  ```
