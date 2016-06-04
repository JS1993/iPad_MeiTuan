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
#import "JSConst.h"
#import "CategoryModel.h"
#import "ZoneModel.h"
#import "JSSortViewController.h"

@interface ViewController ()

@property(nonatomic,strong)JSCategoryVC* categoryVC;

@property(nonatomic,strong)JSZoneViewController* zoneVC;

@property(nonatomic,strong)JSSortViewController* sortVC;

@property(nonatomic,weak)UIBarButtonItem* categoryItem;

@property(nonatomic,weak)UIBarButtonItem* zoneItem;

@property(nonatomic,weak)UIBarButtonItem* sortItem;


@end

@implementation ViewController


/*排序方式界面懒加载*/
-(JSSortViewController *)sortVC
{
    if (_sortVC==nil) {
        _sortVC=[[JSSortViewController alloc]init];
        _sortVC.modalPresentationStyle=UIModalPresentationPopover;
    }
    return _sortVC;
}


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
    
    [self setUpNoti];
    
}

-(void)setUpNoti{
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(categoryDidChange:) name:JSCategoryDidChangeNotification object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(zoneDidChange:) name:JSZoneDidChangeNotification object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(sortDidChange:) name:JSSortDidChangeNotification object:nil];
}

//排序方式改变时调用
-(void)sortDidChange:(NSNotification*)noti{
    //拿到顶部的分类视图进行修改
    JSTopItemView* sortItemView=(JSTopItemView*)self.sortItem.customView;
    
    [sortItemView setSubTitle:noti.userInfo[JSSortDidChangeNotificationKey]];
    
    //退出控制器
    [self dismissViewControllerAnimated:YES completion:nil];
}

//区域改变的通知方法
-(void)zoneDidChange:(NSNotification*)noti{
    
    ZoneModel* zone=noti.userInfo[JSZoneDidChangeNotificationKey];
    
    NSString* subZone=noti.userInfo[JSSubZoneDidChangeNotificationKey];
    
    JSTopItemView* zoneItemView=(JSTopItemView*)self.zoneItem.customView;
    
    if (!subZone) {
        [zoneItemView setTitle:@"广州"];
        [zoneItemView setSubTitle:zone.name];
    }else{
        
        [zoneItemView setTitle:zone.name];
        [zoneItemView setSubTitle:subZone];
        
    }
    
    //退出控制器
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

//分类改变的通知方法
-(void)categoryDidChange:(NSNotification*)noti{
    CategoryModel* category=noti.userInfo[JSCategoryDidChangeNotificationKey];
    NSString* subCategory=noti.userInfo[JSSubCategoryDidChangeNotificationKey];
    
    //拿到顶部的分类视图进行修改
    JSTopItemView* categoryItemView=(JSTopItemView*)self.categoryItem.customView;
    
    if (!subCategory) {//如果没有子类
        
        [categoryItemView setTitle:@"美团"];
        [categoryItemView setSubTitle:category.name];
        
    }else{
        
        [categoryItemView setTitle:category.name];
        [categoryItemView setSubTitle:subCategory];
        
    }
    
    [categoryItemView setImageWithName:category.icon highImage:category.highlighted_icon];
    
    //退出控制器
    [self dismissViewControllerAnimated:YES completion:nil];
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
    self.sortVC.popoverPresentationController.barButtonItem=self.sortItem;
    
    [self presentViewController:self.sortVC animated:YES completion:nil];
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

@end
