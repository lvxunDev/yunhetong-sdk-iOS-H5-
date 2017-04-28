//
//  YHTContractWebView.m
//  CloudContract_SDK
//
//  Created by 吴清正 on 16/5/17.
//  Copyright © 2016年 dazheng_wu. All rights reserved.
//

#import "YHTContractWebView.h"
#import "YHTTokenManager.h"
#import "YHTConstants.h"
#import "NJKWebViewProgressView.h"
#import "NJKWebViewProgress.h"

@interface YHTContractWebView()<UIWebViewDelegate, NJKWebViewProgressDelegate>
@property (nonatomic, strong)NSNumber *contractID;
@property (nonatomic, strong)NSURL *contractURL;
@end

@implementation YHTContractWebView

+ (instancetype)instanceWithContractID:(NSNumber *)contractID delegate:(id<ContractWebViewDelegate>)delegate{
    YHTContractWebView *webView = [[YHTContractWebView alloc] init];
    webView.contractID = contractID;
    webView.contractDelegate = delegate;
    webView.scrollView.bounces=YES;
    webView.scalesPageToFit = YES;
    webView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;

    return webView;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupScrollView];
        [self setupProgress];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setupScrollView];
    [self setupProgress];
}

- (void)setupScrollView {
    self.scrollView.bounces = NO ;
    self.scalesPageToFit = YES;
    self.scrollView.showsHorizontalScrollIndicator = YES;
    self.scrollView.showsVerticalScrollIndicator = YES;
    for (int i = 0; i < self.scrollView.subviews.count ; i++) {
        UIView *__subView = [self.scrollView.subviews objectAtIndex:i];
        if ([__subView isKindOfClass:[UIImageView class]]) {
            __subView.hidden = YES ;
        }
    }
}

- (void)setupProgress {
    self.progressProxy = [[NJKWebViewProgress alloc] init];
    self.delegate = self.progressProxy;
    self.progressProxy.webViewProxyDelegate = self;
    self.progressProxy.progressDelegate = self;

    self.progressView = [[NJKWebViewProgressView alloc] initWithFrame:CGRectZero];

    self.progressView.frame = CGRectMake(0, 64, self.frame.size.width, 2);
    self.progressView.progressBarView.alpha = 0.0f;
    [self addSubview:self.progressView];
}

- (void)refresh{
    NSMutableString *__urlStr = [NSMutableString stringWithString:[YHTConstants urlByHost:kViewWebContract_URL]];
    [__urlStr appendFormat:@"?contractId=%ld", [self.contractID longValue]];
    [__urlStr appendFormat:@"&token=%@", [YHTTokenManager sharedManager].token];

    self.contractURL = [NSURL URLWithString:__urlStr];
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
    NSURLRequest *__request = [NSURLRequest requestWithURL:self.contractURL
                                               cachePolicy:NSURLRequestReloadIgnoringCacheData
                                           timeoutInterval: 20.0];
    [self loadRequest:__request];
}

#pragma mark - UIWebViewDelegate
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    if (self.contractDelegate) {
        [self.contractDelegate webViewDidFinishLoad:self];
    }
}

#pragma mark - NJKWebViewProgressDelegate
-(void)webViewProgress:(NJKWebViewProgress *)webViewProgress updateProgress:(float)progress {
    [self.progressView setProgress:progress animated:YES];
}

@end
