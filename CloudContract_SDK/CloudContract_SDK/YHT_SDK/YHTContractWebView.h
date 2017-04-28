//
//  YHTContractWebView.h
//  CloudContract_SDK
//
//  Created by 吴清正 on 16/5/17.
//  Copyright © 2016年 dazheng_wu. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ContractWebViewDelegate;
@class NJKWebViewProgress;
@class NJKWebViewProgressView;

@interface YHTContractWebView : UIWebView

@property (nonatomic, strong)NJKWebViewProgressView *progressView;
@property (nonatomic, strong)NJKWebViewProgress *progressProxy;
@property (nonatomic, weak)id<ContractWebViewDelegate> contractDelegate;

- (void)refresh;
+ (instancetype)instanceWithContractID:(NSNumber *)contractID delegate:(id<ContractWebViewDelegate>)delegate;
@end

@protocol ContractWebViewDelegate <NSObject>
- (void)webViewDidFinishLoad:(YHTContractWebView *)webView;
@end
