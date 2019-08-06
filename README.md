# CCPopoverView
### CCPopoverView 是一个 轻量，无侵入，简洁易用，易扩展的弹框视图

## 1.用法Usage

### 1.1 初始化一个popoverView
```
/** 初始化一个popoverView
@param customView 需要显示的View
@param popStyle 显示时动画弹框样式
@param dismissStyle 移除时动画弹框样式
*/
- (nullable instancetype)initWithCustomView:(UIView *_Nonnull)customView
                                   popStyle:(CCPopoverStyle)popStyle
                               dismissStyle:(CCAnimationDismissStyle)dismissStyle;

/**
 显示时动画弹框样式
 */
typedef NS_ENUM(NSInteger, CCPopoverStyle) {
    CCPopoverStyleNO = 0,               ///< 无动画
    CCPopoverStyleScale,                
    CCPopoverStyleShakeFromTop,         
    CCPopoverStyleShakeFromBottom,      
    CCPopoverStyleShakeFromLeft,        
    CCPopoverStyleShakeFromRight,       
    CCPopoverStyleCardDropFromLeft,    
    CCPopoverStyleCardDropFromRight,    
    CCPopoverStyleLineFromBottom,
};

/**
 移除时动画弹框样式
 */
typedef NS_ENUM(NSInteger, CCAnimationDismissStyle) {
    CCAnimationDismissStyleNO = 0,               ///< 无动画
    CCAnimationDismissStyleScale,                
    CCAnimationDismissStyleDropToTop,            
    CCAnimationDismissStyleDropToBottom,         
    CCAnimationDismissStyleDropToLeft,           
    CCAnimationDismissStyleDropToRight,          
    CCAnimationDismissStyleCardDropToLeft,       
    CCAnimationDismissStyleCardDropToRight,      
    CCAnimationDismissStyleCardDropToTop,        
    CCAnimationDismissStyleLineToBottom,
};
```

### 1.2 设置popoverView属性
```
CCPopoverView *popoverView = [[CCPopoverView alloc] initWithCustomView:theCustomView
                                                                  popStyle:popoverStyle
                                                              dismissStyle:dismissStyle];
    popoverView.popBGAlpha = .5f;
    popoverView.isObserverOrientationChange = YES;
    
    popoverView.popComplete = ^{
        // callback
    };
    
    popoverView.dismissComplete = ^{
        // callback
    };
              ...
              ...
              ...
```
### 1.3 显示popoverView
``` [popoverView pop]; ```

### 1.4 移除弹框
``` [popoverView dismiss]```

## 2.效果展示

![image](https://github.com/CoderCC/CCPopoverView/blob/master/CCPopoverView/Untitled001.gif)

![image](https://github.com/CoderCC/CCPopoverView/blob/master/CCPopoverView/Untitled002.gif)

![image](https://github.com/CoderCC/CCPopoverView/blob/master/CCPopoverView/Untitled003.gif)

![image](https://github.com/CoderCC/CCPopoverView/blob/master/CCPopoverView/Untitled004.gif)

![image](https://github.com/CoderCC/CCPopoverView/blob/master/CCPopoverView/Untitled005.gif)
