//
//  ViewController.m
//  iPad_MeiTuan
//
//  Created by  江苏 on 16/6/4.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "ViewController.h"
#import "JSTopItemView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self setUpNav];
}

-(void)setUpNav{
    
    UIBarButtonItem* leftBarBtnItem =[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"icon_meituan_logo"] style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.leftBarButtonItem.enabled=NO;
    
    JSTopItemView* categoryView=[JSTopItemView topItemView];
    [categoryView addTarget:self action:@selector(cateClicked)];
    [categoryView setTitle:@"美团" andSubTitle:@"全部分类" andImage:@"icon_category_-1" andBgImage:@"icon_category_highlighted_-1"];
    UIBarButtonItem* categoryItem=[[UIBarButtonItem alloc]initWithCustomView:categoryView];

    JSTopItemView* zoneView=[JSTopItemView topItemView];
    [zoneView addTarget:self action:@selector(zoneClicked)];
    [zoneView setTitle:@"广州" andSubTitle:@"全部区域" andImage:@"icon_district" andBgImage:@"icon_district_highlighted"];
    UIBarButtonItem* zoneItem=[[UIBarButtonItem alloc]initWithCustomView:zoneView];
    
    JSTopItemView* sortView=[JSTopItemView topItemView];
    [sortView addTarget:self action:@selector(sortClicked)];
    [sortView setTitle:@"排序" andSubTitle:@"默认排序" andImage:@"icon_sort" andBgImage:@"icon_sort_highlighted"];
    UIBarButtonItem* sortItem=[[UIBarButtonItem alloc]initWithCustomView:sortView];
    
    self.navigationItem.leftBarButtonItems=@[leftBarBtnItem,categoryItem,zoneItem,sortItem];
    
}

/**
 *  点击了分类
 */
-(void)cateClicked{
    
}

/**
 *  点击了区域
 */
-(void)zoneClicked{
    
}


/**
 *  点击了排序
 */
-(void)sortClicked{
    
}

@end
