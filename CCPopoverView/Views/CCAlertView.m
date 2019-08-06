//
//  CCAlertView.m
//
//  Created by WeiPeng on 2017/8/15.
//  Copyright © 2017年 WeiPeng. All rights reserved.
//

#import "CCAlertView.h"

@implementation CCAlertView

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.layer.cornerRadius = 6.0f;
    self.layer.masksToBounds = YES;
}

- (IBAction)canceSureAction:(UIButton *)sender
{
    if (self.canceSureActionBlock) {
        self.canceSureActionBlock(sender.tag);
    }
}

@end
