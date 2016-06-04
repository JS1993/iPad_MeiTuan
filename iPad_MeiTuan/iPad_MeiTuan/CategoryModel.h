//
//  CategoryModel.h
//  iPad_MeiTuan
//
//  Created by  江苏 on 16/6/4.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CategoryModel : NSObject

@property(copy,nonatomic)NSString* highlighted_icon;

@property(copy,nonatomic)NSString* icon;

@property(copy,nonatomic)NSString* name;

@property(copy,nonatomic)NSString* small_highlighted_icon;

@property(copy,nonatomic)NSString* small_icon;

@property(strong,nonatomic)NSArray* subcategories;

@end
