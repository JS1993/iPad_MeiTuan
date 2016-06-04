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
#import "JSConst.h"

@interface JSCategoryVC ()<JSTwoTableViewDataSource,JSTwoTableViewDelegate>

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
        _twoTableView.dataSource=self;
        _twoTableView.delegate=self;
        _twoTableView.frame=self.view.bounds;
        [self.view addSubview:_twoTableView];
    }
    return _twoTableView;
}

-(void)viewDidLoad{
    [super viewDidLoad];
    
    [self twoTableView];
    
    //设置控制器在popover中显示的尺寸
    self.preferredContentSize=CGSizeMake(320,400);
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

-(UIImage *)twoTableView:(JSTwoTableView *)twoTableView andImageInRow:(NSInteger)row{
    CategoryModel* cateModel=self.Categories[row];
    return [UIImage imageNamed:cateModel.small_icon];
}

-(UIImage*)twoTableView:(JSTwoTableView*)twoTableView andHighLightedImageInRow:(NSInteger)row{
    CategoryModel* cateModel=self.Categories[row];
    return [UIImage imageNamed:cateModel.small_highlighted_icon];
}

#pragma mark--JSTwoTableViewDelegate

-(void)twoTableView:(JSTwoTableView *)twoTableView didSelectedLeftIndex:(NSInteger)leftIndex{
    CategoryModel* cateModel=self.Categories[leftIndex];
    
    //如果没有子菜单，就发送通知
    if (cateModel.subcategories.count==0) {
        
         NSDictionary* userInfo=@{JSCategoryDidChangeNotificationKey:cateModel};
        
        [[NSNotificationCenter defaultCenter] postNotificationName:JSCategoryDidChangeNotification object:nil userInfo:userInfo];
    }
    
}

-(void)twoTableView:(JSTwoTableView *)twoTableView didSelectedRightIndex:(NSInteger)rightIndex andLeftIndex:(NSInteger)leftIndex{
    
    CategoryModel* cateModel=self.Categories[leftIndex];
    NSString* subCategory=cateModel.subcategories[rightIndex];
    NSDictionary* userInfo=@{JSCategoryDidChangeNotificationKey:cateModel,
                             JSSubCategoryDidChangeNotificationKey:subCategory};
    [[NSNotificationCenter defaultCenter] postNotificationName:JSCategoryDidChangeNotification object:nil userInfo:userInfo];
    
}

@end
