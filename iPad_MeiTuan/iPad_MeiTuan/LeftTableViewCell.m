//
//  LeftTableViewCell.m
//  iPad_MeiTuan
//
//  Created by  江苏 on 16/6/4.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "LeftTableViewCell.h"

@implementation LeftTableViewCell

+(instancetype)cellWithTableView:(UITableView*)tableView{
    static NSString* identifier=@"leftCell";
    LeftTableViewCell* cell=[tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell==nil) {
        cell=[[LeftTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.backgroundView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg_dropdown_leftpart"]];
    cell.selectedBackgroundView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg_dropdown_left_selected"]];
    return cell;
}

@end
