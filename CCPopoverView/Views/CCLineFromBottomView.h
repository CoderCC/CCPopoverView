//
//  CCLineFromBottomView.h
//
//  Created by WeiPeng on 2019/8/2.
//  Copyright © 2019年 WeiPeng. All rights reserved.
//

#import "CCXibFoctory.h"

NS_ASSUME_NONNULL_BEGIN

@interface CCLineFromBottomView : CCXibFoctory

@property (nonatomic, copy) void(^doneActionBlock)(void);

@end

NS_ASSUME_NONNULL_END
