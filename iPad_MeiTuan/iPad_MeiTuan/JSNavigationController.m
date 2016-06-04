//
//  JSNavigationController.m
//  iPad_MeiTuan
//
//  Created by  江苏 on 16/6/4.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "JSNavigationController.h"

@implementation JSNavigationController

+ (void)initialize{
    
    UINavigationBar* navBar=[UINavigationBar appearance];
    
    [navBar setBackgroundImage:[UIImage imageNamed:@"bg_navigationBar_normal"] forBarMetrics:UIBarMetricsDefault];
    
}

@end
