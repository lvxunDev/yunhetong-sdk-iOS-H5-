#### 横屏显示不正常
在加载合同内容的 `webView`，设置 `webView` 以下属性

```
webView.scalesPageToFit = YES;
webView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
```

#### 横屏时状态栏消失

定义一个一个 `UIViewController` 的 `Category`，并重写以下方法

```
//设置样式
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

//设置是否隐藏
- (BOOL)prefersStatusBarHidden {
    return NO;
}

//设置隐藏动画
- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation {
    return UIStatusBarAnimationNone;
}
```