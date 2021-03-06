//
//  YHTSDKDemoRootViewController.m
//  CloudContract_SDK
//
//  Created by 吴清正 on 16/6/6.
//  Copyright © 2016年 dazheng_wu. All rights reserved.
//

#import "YHTSDKDemoShowViewController.h"
#import "YHTSDKDemoContractListViewController.h"
#import "YHTSDKDemoConfirmViewController.h"
#import "MBProgressHUD+Wqz.h"
#import "YHTSDKDemoTokenListener.h"
#import "YHTSDKDemoContract.h"
#import "YHTTokenManager.h"
@interface YHTSDKDemoShowViewController ()
@property (nonatomic, strong)NSMutableArray *contractArray;
@end

@implementation YHTSDKDemoShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"云合同SDK演示Demo";

    [self setRadiusAndBorderWithButton:self.button_preView];
    [self setRadiusAndBorderWithButton:self.button_partyA];
    [self setRadiusAndBorderWithButton:self.button_partyB];
}

- (IBAction)partyA_Action:(id)sender {

    [self.navigationController pushViewController:[YHTSDKDemoConfirmViewController instance] animated:YES];
}

- (IBAction)partyB_Action:(id)sender {
    [MBProgressHUD showHTTPMessage:@""];
    [[YHTSDKDemoTokenListener sharedManager] getTokenWithCompletionHander:^(id obj) {
        [[YHTTokenManager sharedManager] setTokenWithString:obj[@"value"][@"token"]];
        self.contractArray = [YHTSDKDemoContract pasingJSONWithDictionary:obj[@"value"]];
        YHTSDKDemoContractListViewController *vc = [YHTSDKDemoContractListViewController instanceWithContractArray:_contractArray];
        [self.navigationController pushViewController:vc animated:YES];
    }];
}

- (void)setRadiusAndBorderWithButton:(UIButton *)button{
    button.layer.cornerRadius = 8.0f;
    button.layer.masksToBounds = YES;
    button.layer.borderWidth = 1.0f;
    button.layer.borderColor = [UIColor lightGrayColor].CGColor;
}

@end
