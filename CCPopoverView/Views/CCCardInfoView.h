//
//  CCCardInfoView.h
//
//  Created by WeiPeng on 2017/8/16.
//  Copyright © 2017年 WeiPeng. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    CCCardInfoTypeAlpha = 1, // 标题1
    CCCardInfoTypeBeta,        // 标题2
    CCCardInfoTypeGama,    // 标题3
} CCCardInfoType;

@interface CCCardInfoView : UIView

@property (nonatomic, copy) void(^closeActionBlock)();

+ (instancetype)xibWithCardInfoType:(CCCardInfoType)type;

@end
