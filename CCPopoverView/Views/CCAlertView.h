//
//  CCAlertView.h
//
//  Created by WeiPeng on 2017/8/15.
//  Copyright © 2017年 WeiPeng. All rights reserved.
//

#import "CCXibFoctory.h"

@interface CCAlertView : CCXibFoctory

@property (nonatomic, copy) void(^canceSureActionBlock)(BOOL isSure);

@end
