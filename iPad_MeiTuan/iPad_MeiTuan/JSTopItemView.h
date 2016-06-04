//
//  JSTopItemView.h
//  iPad_MeiTuan
//
//  Created by  江苏 on 16/6/4.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JSTopItemView : UIView

+(instancetype)topItemView;

-(void)setTitle:(NSString*)title andSubTitle:(NSString*)subTitle andImage:(NSString*)image andBgImage:(NSString*)bgImage;

- (void)setSubTitle:(NSString *)subTitle;

- (void)setTitle:(NSString *)title;

- (void)addTarget:(id)target action:(SEL)action;

- (void)setImageWithName:(NSString *)name highImage:(NSString *)highImage;

@end
