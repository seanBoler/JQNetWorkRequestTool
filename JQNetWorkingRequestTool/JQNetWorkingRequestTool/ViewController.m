//
//  ViewController.m
//  JQNetWorkingRequestTool
//
//  Created by zhangjiaqi on 2018/6/1.
//  Copyright © 2018年 zhangjiaqi. All rights reserved.
//

#import "ViewController.h"
#import "JQNetWorkAndCacheTool.h"
#import "PPNetworkHelper.h"

#define SCREEWIDTH self.view.frame.size.width
#define SCREEHEIGHT self.view.frame.size.height

@interface ViewController ()

@property (nonatomic,strong)UIButton *RequestPostBtn;
@property (nonatomic,strong)UIButton *RequestGetBtn;
@property (nonatomic,strong)UITextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    _RequestPostBtn= [[UIButton alloc]initWithFrame:CGRectZero];
    [_RequestPostBtn setTitle:@"POST 请求" forState:UIControlStateNormal];
    [_RequestPostBtn setBackgroundColor:[UIColor colorWithRed:135/255.0f green:206/255.0f blue:255/255.0f alpha:1]];
    [_RequestPostBtn setTintColor:[UIColor whiteColor]];
    _RequestPostBtn.titleLabel.font =[UIFont systemFontOfSize:14.0f];
    _RequestPostBtn.frame = CGRectMake(30, SCREEHEIGHT*0.2, SCREEWIDTH*0.3, 40);
    [self.view addSubview:_RequestPostBtn];
    _RequestPostBtn.tag = YES;
    [_RequestPostBtn addTarget:self action:@selector(requestAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    _RequestGetBtn= [[UIButton alloc]initWithFrame:CGRectZero];
    [_RequestGetBtn setTitle:@"GET 请求" forState:UIControlStateNormal];
    [_RequestGetBtn setBackgroundColor:[UIColor colorWithRed:135/255.0f green:206/255.0f blue:255/255.0f alpha:1]];
    [_RequestGetBtn setTintColor:[UIColor whiteColor]];
    _RequestGetBtn.tag = NO;
    _RequestGetBtn.titleLabel.font =[UIFont systemFontOfSize:14.0f];
    _RequestGetBtn.frame = CGRectMake(CGRectGetMaxX(_RequestPostBtn.frame)+30, SCREEHEIGHT*0.2, SCREEWIDTH*0.3, 40);
    [self.view addSubview:_RequestGetBtn];
    [_RequestGetBtn addTarget:self action:@selector(requestAction:) forControlEvents:UIControlEventTouchUpInside];
    
    _textView = [[UITextView alloc]initWithFrame:CGRectZero];
    _textView.frame = CGRectMake(20, CGRectGetMaxY(_RequestGetBtn.frame)+20, SCREEWIDTH-40, SCREEHEIGHT *0.6);
    [self.view addSubview:_textView];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)requestAction:(UIButton *)btn{
    
    
    NSDictionary *dic = @{@"endindex":@(10),@"startindex":@(0),@"type":@"f800debe-5e33-47d9-8edb-0380b34356f9",@"ukey":@"17660412882"};
    [JQNetWorkAndCacheTool JQNetWorkingPOST:btn.tag
                                 RequestURL:@"http://jingbo.cmb.tl-kj.com/api/get_news.ashx"
                                 parameters:dic
                                sucessBLock:^(NSArray *result) {
                                    
                                    self.textView.text = [NSString stringWithFormat:@"%@",result];
                                    
                                } elseCodeBlock:^(NSString *meassage) {
                                    
                                    
                                } isHub:YES]; //isHub 是否需要加载框
}


@end
