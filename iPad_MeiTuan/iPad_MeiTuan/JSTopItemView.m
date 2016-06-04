//
//  JSTopItemView.m
//  iPad_MeiTuan
//
//  Created by  江苏 on 16/6/4.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "JSTopItemView.h"


@interface JSTopItemView()
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *subTitleLabel;

@property (strong, nonatomic) IBOutlet UIButton *iconBtn;
@end

@implementation JSTopItemView

+(instancetype)topItemView{
    
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] firstObject];
    
}

-(void)setTitle:(NSString*)title andSubTitle:(NSString*)subTitle andImage:(NSString*)image andBgImage:(NSString*)bgImage{
    self.titleLabel.text=title;
    self.subTitleLabel.text=subTitle;
    [self.iconBtn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [self.iconBtn setImage:[UIImage imageNamed:bgImage] forState:UIControlStateHighlighted];
}


- (void)setTitle:(NSString *)title
{
    self.titleLabel.text = title;
}
- (void)setSubTitle:(NSString *)subTitle
{
    self.subTitleLabel.text = subTitle;
}
- (void)setImageWithName:(NSString *)name highImage:(NSString *)highImage
{
    [self.iconBtn setImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
    [self.iconBtn setImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
}

- (void)addTarget:(id)target action:(SEL)action{
    
    [self.iconBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
}
@end
