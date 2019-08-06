//
//  CCXibFoctory.m
//  CCAnimationPopViewDemo
//
//  Created by WeiPeng on 2017/8/15.
//  Copyright © 2017年 WeiPeng. All rights reserved.
//

#import "CCXibFoctory.h"

@implementation CCXibFoctory

+ (instancetype)xib
{
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil][0];
}

@end
