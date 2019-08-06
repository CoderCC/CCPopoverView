//
//  CCPopoverView.h
//
//  Created by WeiPeng on 2017/8/12.
//  Copyright © 2017年 WeiPeng. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 显示时动画弹框样式
 */
typedef NS_ENUM(NSInteger, CCPopoverStyle) {
    CCPopoverStyleNO = 0,               ///< 无动画
    CCPopoverStyleScale,                ///< 缩放动画，先放大，后恢复至原大小
    CCPopoverStyleShakeFromTop,         ///< 从顶部掉下到中间晃动动画
    CCPopoverStyleShakeFromBottom,      ///< 从底部往上到中间晃动动画
    CCPopoverStyleShakeFromLeft,        ///< 从左侧往右到中间晃动动画
    CCPopoverStyleShakeFromRight,       ///< 从右侧往左到中间晃动动画
    CCPopoverStyleCardDropFromLeft,     ///< 卡片从顶部左侧开始掉落动画
    CCPopoverStyleCardDropFromRight,    ///< 卡片从顶部右侧开始掉落动画
    CCPopoverStyleLineFromBottom,       ///< 平滑线性从底部推出来动画
};

/**
 移除时动画弹框样式
 */
typedef NS_ENUM(NSInteger, CCAnimationDismissStyle) {
    CCAnimationDismissStyleNO = 0,               ///< 无动画
    CCAnimationDismissStyleScale,                ///< 缩放动画
    CCAnimationDismissStyleDropToTop,            ///< 从中间直接掉落到顶部
    CCAnimationDismissStyleDropToBottom,         ///< 从中间直接掉落到底部
    CCAnimationDismissStyleDropToLeft,           ///< 从中间直接掉落到左侧
    CCAnimationDismissStyleDropToRight,          ///< 从中间直接掉落到右侧
    CCAnimationDismissStyleCardDropToLeft,       ///< 卡片从中间往左侧掉落
    CCAnimationDismissStyleCardDropToRight,      ///< 卡片从中间往右侧掉落
    CCAnimationDismissStyleCardDropToTop,        ///< 卡片从中间往顶部移动消失
    CCAnimationDismissStyleLineToBottom,         ///< 平滑线性掉落到底部动画
};

@interface CCPopoverView : UIView

/** 显示时点击背景是否移除弹框，默认为NO。 */
@property (nonatomic) BOOL isClickBGDismiss;
/** 显示时是否监听屏幕旋转，默认为NO */
@property (nonatomic) BOOL isObserverOrientationChange;
/** 显示时背景的透明度，取值(0.0~1.0)，默认为0.5 */
@property (nonatomic) CGFloat popBGAlpha;

/// 动画相关属性参数
/** 显示时动画时长，>= 0。不设置则使用默认的动画时长 */
@property (nonatomic) CGFloat popAnimationDuration;
/** 隐藏时动画时长，>= 0。不设置则使用默认的动画时长 */
@property (nonatomic) CGFloat dismissAnimationDuration;
/** 显示完成回调 */
@property (nullable, nonatomic, copy) void(^popComplete)(void);
/** 移除完成回调 */
@property (nullable, nonatomic, copy) void(^dismissComplete)(void);

/**
 通过自定义视图来构造弹框视图
 
 @param customView 自定义视图
 */
- (nullable instancetype)initWithCustomView:(UIView *_Nonnull)customView
                                   popStyle:(CCPopoverStyle)popStyle
                               dismissStyle:(CCAnimationDismissStyle)dismissStyle;

/**
 显示弹框
 */
- (void)pop;

/**
 移除弹框
 */
- (void)dismiss;

@end
