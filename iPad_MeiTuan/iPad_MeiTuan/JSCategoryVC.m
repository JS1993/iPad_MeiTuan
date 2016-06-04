//
//  JSCategoryVC.m
//  iPad_MeiTuan
//
//  Created by  江苏 on 16/6/4.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "JSCategoryVC.h"
#import "JSTwoTableView.h"

@interface JSCategoryVC ()

@property(nonatomic,strong)JSTwoTableView* twoTableView;

@end


@implementation JSCategoryVC


/*级联视图懒加载*/
-(JSTwoTableView *)twoTableView
{
    if (_twoTableView==nil) {
        _twoTableView=[JSTwoTableView twoTableView];
        _twoTableView.frame=self.view.bounds;
        [self.view addSubview:_twoTableView];
    }
    return _twoTableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self twoTableView];
 
}



@end