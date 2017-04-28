//
//  Constant.h
//  CloudContract_SDK
//
//  Created by 吴清正 on 16/5/6.
//  Copyright © 2016年 dazheng_wu. All rights reserved.
//

#import <Foundation/Foundation.h>
#define TEST_SERVICE                  1            

@interface YHTConstants : NSObject

/**
 *  查看网页合同'url'
 */
extern NSString * const kViewWebContract_URL;

/**
 *  'token'
 */
extern NSString * const kToken_URL;

/**
 *  'token_contract'
 */
extern NSString * const kTokenContract_URL;

+ (NSString *)urlByHost:(NSString *)path;
@end
