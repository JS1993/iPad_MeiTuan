//
//  ViewController.m
//  iPad_MeiTuan
//
//  Created by  江苏 on 16/6/4.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "ViewController.h"
#import "JSTopItemView.h"
#import "JSCategoryVC.h"
#import "JSZoneViewController.h"

@interface ViewController ()

@property(nonatomic,strong)JSCategoryVC* categoryVC;

@property(nonatomic,strong)JSZoneViewController* zoneVC;

@property(nonatomic,weak)UIBarButtonItem* categoryItem;

@property(nonatomic,weak)UIBarButtonItem* zoneItem;

@property(nonatomic,weak)UIBarButtonItem* sortItem;


@end

@implementation ViewController


/*地区界面懒加载*/
-(JSZoneViewController *)zoneVC
{
    if (_zoneVC==nil) {
        _zoneVC=[[JSZoneViewController alloc]init];
        _zoneVC.modalPresentationStyle=UIModalPresentationPopover;
    }
    return _zoneVC;
}


/*分类界面懒加载*/
-(JSCategoryVC *)categoryVC
{
    if (_categoryVC==nil) {
        _categoryVC=[[JSCategoryVC alloc]init];
        _categoryVC.modalPresentationStyle=UIModalPresentationPopover;
    }
    return _categoryVC;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self setUpNav];
}

-(void)setUpNav{
    
    //图标
    UIBarButtonItem* leftBarBtnItem =[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"icon_meituan_logo"] style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.leftBarButtonItem.enabled=NO;
    
    //分类
    JSTopItemView* categoryView=[JSTopItemView topItemView];
    [categoryView addTarget:self action:@selector(cateClicked)];
    [categoryView setTitle:@"美团" andSubTitle:@"全部分类" andImage:@"icon_category_-1" andBgImage:@"icon_category_highlighted_-1"];
    UIBarButtonItem* categoryItem=[[UIBarButtonItem alloc]initWithCustomView:categoryView];
    self.categoryItem=categoryItem;

    //区域
    JSTopItemView* zoneView=[JSTopItemView topItemView];
    [zoneView addTarget:self action:@selector(zoneClicked)];
    [zoneView setTitle:@"广州" andSubTitle:@"全部区域" andImage:@"icon_district" andBgImage:@"icon_district_highlighted"];
    UIBarButtonItem* zoneItem=[[UIBarButtonItem alloc]initWithCustomView:zoneView];
    self.zoneItem=zoneItem;
    
    //排序
    JSTopItemView* sortView=[JSTopItemView topItemView];
    [sortView addTarget:self action:@selector(sortClicked)];
    [sortView setTitle:@"排序" andSubTitle:@"默认排序" andImage:@"icon_sort" andBgImage:@"icon_sort_highlighted"];
    UIBarButtonItem* sortItem=[[UIBarButtonItem alloc]initWithCustomView:sortView];
    self.sortItem=sortItem;
    
    self.navigationItem.leftBarButtonItems=@[leftBarBtnItem,categoryItem,zoneItem,sortItem];
    
}


#pragma mark--监听顶部导航栏按钮点击

/**
 *  点击了分类
 */
-(void)cateClicked{
    
    self.categoryVC.popoverPresentationController.barButtonItem=self.categoryItem;
    
    [self presentViewController:self.categoryVC animated:YES completion:nil];
}

/**
 *  点击了区域
 */
-(void)zoneClicked{
    self.zoneVC.popoverPresentationController.barButtonItem=self.zoneItem;
    
    [self presentViewController:self.zoneVC animated:YES completion:nil];
}


/**
 *  点击了排序
 */
-(void)sortClicked{
    
}

@end
