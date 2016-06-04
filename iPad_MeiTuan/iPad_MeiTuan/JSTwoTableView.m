//
//  JSTwoTableView.m
//  iPad_MeiTuan
//
//  Created by  江苏 on 16/6/4.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "JSTwoTableView.h"
#import "CategoryModel.h"


@interface JSTwoTableView()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *leftTableView;
@property (strong, nonatomic) IBOutlet UITableView *rightTableView;

@property(strong,nonatomic)NSArray* subCategories;

@end

@implementation JSTwoTableView


+(instancetype)twoTableView{
    return [[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil][0];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView==self.leftTableView) {//如果是左边的tableView
        
        return  self.models.count;
        
    }else{
        return self.subCategories.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (tableView==self.leftTableView) {
        CategoryModel* cateModel=self.models[indexPath.row];
        static NSString* identifier=@"leftCell";
        UITableViewCell* cell=[tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell==nil) {
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        cell.textLabel.text=cateModel.name;
        cell.backgroundView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg_dropdown_leftpart"]];
        cell.selectedBackgroundView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg_dropdown_left_selected"]];
        cell.imageView.image=[UIImage imageNamed:cateModel.small_icon];
        cell.imageView.highlightedImage=[UIImage imageNamed:cateModel.small_highlighted_icon];
        return cell;
    }else{
        static NSString* identifier=@"rightCell";
        UITableViewCell* cell=[tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell==nil) {
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        cell.textLabel.text=self.subCategories[indexPath.row];
        cell.backgroundView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg_dropdown_rightpart"]];
        cell.selectedBackgroundView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg_dropdown_right_selected"]];
         return cell;
    }
}

#pragma mark--tableView代理
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (tableView==self.leftTableView) {
        
         CategoryModel* cateModel=self.models[indexPath.row];
        
        self.subCategories=cateModel.subcategories;
        
        [self.rightTableView reloadData];
        
    }else{
        
    }
}

@end
