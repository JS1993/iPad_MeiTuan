//
//  RightTableViewCell.m
//  iPad_MeiTuan
//
//  Created by  江苏 on 16/6/4.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "RightTableViewCell.h"

@implementation RightTableViewCell

+(instancetype)cellWithTableView:(UITableView *)tableView{
    
    static NSString* identifier=@"rightCell";
    
    RightTableViewCell* cell=[tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell==nil) {
        cell=[[RightTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.backgroundView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg_dropdown_rightpart"]];
    cell.selectedBackgroundView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg_dropdown_right_selected"]];
    
    return cell;
    
}


@end
