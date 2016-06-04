//
//  JSZoneViewController.m
//  iPad_MeiTuan
//
//  Created by  江苏 on 16/6/4.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "JSZoneViewController.h"
#import "JSTwoTableView.h"
#import "MJExtension.h"
#import "ZoneModel.h"
#import "JSConst.h"

@interface JSZoneViewController ()<JSTwoTableViewDataSource,JSTwoTableViewDelegate>

@property(nonatomic,strong)JSTwoTableView* twoTableView;

@property(nonatomic,strong)NSArray* zones;

@end


@implementation JSZoneViewController


/*地区数组*/
-(NSArray *)zones
{
    if (_zones==nil) {
        _zones=[ZoneModel objectArrayWithFilename:@"gz.plist"];
    }
    return _zones;
}


/*级联视图懒加载*/
-(JSTwoTableView *)twoTableView
{
    if (_twoTableView==nil) {
        _twoTableView=[JSTwoTableView twoTableView];
        _twoTableView.frame=self.view.bounds;
        _twoTableView.dataSource=self;
        _twoTableView.delegate=self;
        [self.view addSubview:_twoTableView];
    }
    return _twoTableView;
}

-(void)viewDidLoad{
    [super viewDidLoad];
    
    [self twoTableView];
    
}

#pragma mark--JSTwoTableViewDataSource

-(NSInteger)numberOfRowsInLeftTableView:(JSTwoTableView*)twoTableView{
    return  self.zones.count;
}

-(NSString*)twoTableView:(JSTwoTableView*)twoTableView andLeftTitleInRow:(NSInteger)row{
    ZoneModel* zone=self.zones[row];
    return zone.name;
}

-(NSArray*)twoTableView:(JSTwoTableView*)twoTableView andSubDataOfRow:(NSInteger)row{
    ZoneModel* zone=self.zones[row];
    return zone.subregions;
}

#pragma mark--JSTwoTableViewDelegate

-(void)twoTableView:(JSTwoTableView *)twoTableView didSelectedLeftIndex:(NSInteger)leftIndex{
    ZoneModel* zone=self.zones[leftIndex];
    
    //如果没有子菜单，就发送通知
    if (zone.subregions.count==0) {
        
        NSDictionary* userInfo=@{JSZoneDidChangeNotificationKey:zone};
        
        [[NSNotificationCenter defaultCenter] postNotificationName:JSZoneDidChangeNotification object:nil userInfo:userInfo];
    }
    
}

-(void)twoTableView:(JSTwoTableView *)twoTableView didSelectedRightIndex:(NSInteger)rightIndex andLeftIndex:(NSInteger)leftIndex{
    
    ZoneModel* zone=self.zones[leftIndex];
    NSString* subZone=zone.subregions[rightIndex];
    NSDictionary* userInfo=@{JSZoneDidChangeNotificationKey:zone,
                             JSSubZoneDidChangeNotificationKey:subZone};
    [[NSNotificationCenter defaultCenter] postNotificationName:JSZoneDidChangeNotification object:nil userInfo:userInfo];
}


@end
