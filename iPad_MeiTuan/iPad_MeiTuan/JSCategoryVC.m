//
//  JSCategoryVC.m
//  iPad_MeiTuan
//
//  Created by  江苏 on 16/6/4.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "JSCategoryVC.h"
#import "JSTwoTableView.h"
#import "CategoryModel.h"
#import "MJExtension.h"

@interface JSCategoryVC ()<JSTwoTableViewDataSource>

@property(nonatomic,strong)JSTwoTableView* twoTableView;

@property(strong,nonatomic)NSArray* Categories;

@end


@implementation JSCategoryVC


/*懒加载子数据*/
-(NSArray *)Categories
{
    if (_Categories==nil) {
        _Categories=[CategoryModel objectArrayWithFilename:@"categories.plist"];
    }
    return _Categories;
}


/*级联视图懒加载*/
-(JSTwoTableView *)twoTableView
{
    if (_twoTableView==nil) {
        _twoTableView=[JSTwoTableView twoTableView];
        _twoTableView.frame=self.view.bounds;
        _twoTableView.dataSource=self;
        [self.view addSubview:_twoTableView];
    }
    return _twoTableView;
}


#pragma mark--JSTwoTableViewDataSource

-(NSInteger)numberOfRowsInLeftTableView:(JSTwoTableView*)twoTableView{
    return self.Categories.count;
}

-(NSString*)twoTableView:(JSTwoTableView*)twoTableView andLeftTitleInRow:(NSInteger)row{
    CategoryModel* cateModel=self.Categories[row];
    return cateModel.name;
}

-(NSArray*)twoTableView:(JSTwoTableView*)twoTableView andSubDataOfRow:(NSInteger)row{
    CategoryModel* cateModel=self.Categories[row];
    return cateModel.subcategories;
}

@end
