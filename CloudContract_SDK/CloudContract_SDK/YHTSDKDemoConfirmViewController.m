//
//  YHTSDKDemoConfirmViewController.m
//  CloudContract_SDK
//
//  Created by 吴清正 on 16/6/7.
//  Copyright © 2016年 dazheng_wu. All rights reserved.
//

#import "YHTSDKDemoConfirmViewController.h"
#import "MBProgressHUD+Wqz.h"
#import "YHTSDKDemoTokenListener.h"
#import "YHTTokenManager.h"
#import "YHTContractContentViewController.h"
@interface YHTSDKDemoConfirmViewController ()
@property (nonatomic, strong)NSNumber *contractID;
@end

@implementation YHTSDKDemoConfirmViewController

+ (instancetype)instance{
    YHTSDKDemoConfirmViewController *__vc = [[YHTSDKDemoConfirmViewController alloc] init];
    return __vc;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"确认业务细节";
    [self setRadiusAndBorderWithButton:self.confirmBtn];

}

- (IBAction)confirmBtn_Action:(id)sender {
    [MBProgressHUD showHTTPMessage:@""];

    [[YHTSDKDemoTokenListener sharedManager] getTokenContractWithCompletionHander:^(id obj) {
        [MBProgressHUD hideHUDWithBlock:^{
            [[YHTTokenManager sharedManager] setTokenWithString:obj[@"token"]];
            self.contractID = obj[@"contractId"];
            //查看合同
            [self.navigationController pushViewController:[YHTContractContentViewController instanceWithContractID:_contractID] animated:YES];
        }];

    }];
    
}

- (void)setRadiusAndBorderWithButton:(UIButton *)button{
    button.layer.cornerRadius = 8.0f;
    button.layer.masksToBounds = YES;
    button.layer.borderWidth = 1.0f;
    button.layer.borderColor = [UIColor lightGrayColor].CGColor;
}

@end
