//
//  UIViewController+Ext.m
//  CloudContract_SDK
//
//  Created by 吴清正 on 2017/4/28.
//  Copyright © 2017年 dazheng_wu. All rights reserved.
//

#import "UIViewController+Ext.h"

@implementation UIViewController (Ext)
//设置样式
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

//设置是否隐藏
- (BOOL)prefersStatusBarHidden {
    //    [super prefersStatusBarHidden];
    return NO;
}

//设置隐藏动画
- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation {
    return UIStatusBarAnimationNone;
}
@end
