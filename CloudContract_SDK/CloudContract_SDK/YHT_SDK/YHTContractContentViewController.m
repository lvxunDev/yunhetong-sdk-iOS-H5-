//
//  YHTContractContentViewController.m
//  CloudContract_SDK
//
//  Created by 吴清正 on 16/5/10.
//  Copyright © 2016年 dazheng_wu. All rights reserved.
//

#import "YHTContractContentViewController.h"
#import "YHTContractWebView.h"

@interface YHTContractContentViewController ()
@property (nonatomic, strong)YHTContractWebView *webView;
@property (nonatomic, strong)NSNumber *contractID;
@end

@implementation YHTContractContentViewController

+ (instancetype)instanceWithContractID:(NSNumber *)contractID{
    YHTContractContentViewController *vc = [[YHTContractContentViewController alloc] init];
    vc.contractID = contractID;

    return vc;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    self.title = @"签署合同";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.webView];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.webView refresh];
    });

}

#pragma mark - GET/SET

- (YHTContractWebView *)webView{
    if (!_webView) {
        _webView = [YHTContractWebView instanceWithContractID:_contractID delegate:nil];
        _webView.frame = self.view.frame;
    }
    return _webView;
}

@end
