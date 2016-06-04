//
//  JSTwoTableView.m
//  iPad_MeiTuan
//
//  Created by  江苏 on 16/6/4.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "JSTwoTableView.h"
#import "CategoryModel.h"
#import "LeftTableViewCell.h"
#import "RightTableViewCell.h"


@interface JSTwoTableView()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *leftTableView;
@property (strong, nonatomic) IBOutlet UITableView *rightTableView;

@property(strong,nonatomic)NSArray* subDatas;

@end

@implementation JSTwoTableView


+(instancetype)twoTableView{
    return [[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil][0];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView==self.leftTableView) {//如果是左边的tableView
        
        return [self.dataSource numberOfRowsInLeftTableView:self];
        
    }else{
        return self.subDatas.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell* cell;
    
    if (tableView==self.leftTableView) {
        
        cell=[LeftTableViewCell cellWithTableView:tableView];
        
        cell.textLabel.text=[self.dataSource twoTableView:self andLeftTitleInRow:indexPath.row];
        
        if ([self.dataSource respondsToSelector:@selector(twoTableView:andImageInRow:)]) {
            cell.imageView.image=[self.dataSource twoTableView:self andImageInRow:indexPath.row];
        }
        if ([self.dataSource respondsToSelector:@selector(twoTableView:andHighLightedImageInRow:)]) {
            cell.imageView.highlightedImage=[self.dataSource twoTableView:self andHighLightedImageInRow:indexPath.row];
        } 
        
    }else{
        
        cell=[RightTableViewCell cellWithTableView:tableView];
        
        cell.textLabel.text=self.subDatas[indexPath.row];
    }
    
     return cell;
}

#pragma mark--tableView代理
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (tableView==self.leftTableView) {
        
        self.subDatas=[self.dataSource twoTableView:self andSubDataOfRow:indexPath.row];
        
        [self.rightTableView reloadData];
        
        if ([self.delegate respondsToSelector:@selector(twoTableView:andLeftTitleInRow:)]) {
            [self.delegate twoTableView:self didSelectedLeftIndex:self.leftTableView.indexPathForSelectedRow.row];
        }
        
    }else{
        
        if ([self.delegate respondsToSelector:@selector(twoTableView:didSelectedRightIndex:andLeftIndex:)]) {
            [self.delegate twoTableView:self didSelectedRightIndex:indexPath.row andLeftIndex:self.leftTableView.indexPathForSelectedRow.row];
        }
        
        
    }
}

@end
