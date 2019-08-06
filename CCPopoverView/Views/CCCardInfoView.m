//
//  CCCardInfoView.m
//
//  Created by WeiPeng on 2017/8/16.
//  Copyright © 2017年 WeiPeng. All rights reserved.
//

#import "CCCardInfoView.h"

static CCCardInfoType cardInfoType = CCCardInfoTypeAlpha;
@interface CCCardInfoView ()

@property (weak, nonatomic) IBOutlet UIImageView *cardInfoImageView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *cardInfoImageViewWCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *cardInfoImageViewHCons;

@end

@implementation CCCardInfoView

+ (instancetype)xibWithCardInfoType:(CCCardInfoType)type
{
    cardInfoType = type;
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil][0];
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.cardInfoImageView.layer.cornerRadius = 6.0f;
    self.cardInfoImageView.layer.masksToBounds = YES;
    
    NSString *imageName = [NSString stringWithFormat:@"Card%03lu_360", (unsigned long)cardInfoType];
    NSLog(@"%@", imageName);
    UIImage *image = [UIImage imageNamed:imageName];
    self.cardInfoImageView.image = image;
    
    self.cardInfoImageViewWCons.constant = image.size.width*0.2;
    self.cardInfoImageViewHCons.constant = image.size.height*0.2;
    
    CGRect selfFrame = self.frame;
    selfFrame.size = CGSizeMake(self.cardInfoImageViewWCons.constant, self.cardInfoImageViewHCons.constant);
    self.frame = selfFrame;
    
    UIButton *normalBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    CGFloat margin = (cardInfoType == CCCardInfoTypeAlpha) ? 20.0f : ((cardInfoType == CCCardInfoTypeGama) ? 10.0f : 0.0f);
    CGFloat btnWH = 30.0f;
    normalBtn.frame = CGRectMake(self.cardInfoImageViewWCons.constant - margin - btnWH, margin, btnWH, btnWH);
    [normalBtn setBackgroundColor:[UIColor clearColor]];
    [normalBtn addTarget:self action:@selector(closeAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.cardInfoImageView addSubview:normalBtn];
}

- (void)closeAction
{
    if (self.closeActionBlock) {
        self.closeActionBlock();
    }
}

@end
