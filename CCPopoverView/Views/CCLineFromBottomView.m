//
//  CCLineFromBottomView.m
//
//  Created by WeiPeng on 2019/8/2.
//  Copyright © 2019年 WeiPeng. All rights reserved.
//

#import "CCLineFromBottomView.h"

@interface CCLineFromBottomView ()

@end

@implementation CCLineFromBottomView

- (IBAction)doneAction:(id)sender
{
    if (self.doneActionBlock) {
        self.doneActionBlock();
    }
}

@end
