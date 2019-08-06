//
//  CCCardPickerView.h
//
//  Created by WeiPeng on 2017/8/16.
//  Copyright © 2017年 WeiPeng. All rights reserved.
//

#import "CCXibFoctory.h"

@interface CCCardPickerView : CCXibFoctory

@property (nonatomic, copy) void(^selectActionBlock)(NSUInteger currentPage);

- (void)updatePage:(NSUInteger)currentPage;
@end
