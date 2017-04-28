//
//  Constant.m
//  CloudContract_SDK
//
//  Created by 吴清正 on 16/5/6.
//  Copyright © 2016年 dazheng_wu. All rights reserved.
//

#import "YHTConstants.h"

@implementation YHTConstants

NSString * const kViewWebContract_URL      = @"sdk/viewsopen/m/contract_view_m.html";

#pragma mark - Java
NSString * const kToken_URL                = @"sdkdemo/token";
NSString * const kTokenContract_URL        = @"sdkdemo/token_contract";

#pragma mark - PHP
//NSString * const kToken_URL                = @"phpDemo/token.php";
//NSString * const kTokenContract_URL        = @"phpDemo/token_contract.php";

+ (NSString *)host {
    NSString *__returnURL = @"http://testsdk.yunhetong.com";
#ifdef TEST_SERVICE
    __returnURL = @"http://testsdk.yunhetong.com";
#else
    __returnURL = @"http://sdk.yunhetong.com";
#endif

    return __returnURL;
}

+ (NSString *)urlByHost:(NSString *)path{
    NSURL *__url = [[NSURL URLWithString:[self host]] URLByAppendingPathComponent:path];
    NSLog(@"__url:%@",__url.absoluteString);
    return __url.absoluteString;
}

@end
