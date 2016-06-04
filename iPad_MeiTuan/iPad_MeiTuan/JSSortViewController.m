//
//  JSSortViewController.m
//  iPad_MeiTuan
//
//  Created by  江苏 on 16/6/4.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "JSSortViewController.h"
#import "SortModel.h"
#import "MJExtension.h"
#import "JSConst.h"

@interface JSSortViewController ()

@property(strong,nonatomic)NSArray* sorts;

@property(strong,nonatomic)UIButton* selectedBtn;

@end

@implementation JSSortViewController

/*排序数组*/
-(NSArray *)sorts
{
    if (_sorts==nil) {
        _sorts=[SortModel objectArrayWithFilename:@"sorts.plist"];
    }
    return _sorts;
}

- (void)viewDidLoad {
    [super viewDidLoad];
 
    [self setUpBtns];
}

-(void)setUpBtns{
    
    NSInteger count=self.sorts.count;
    
    CGFloat btnW=120;
    CGFloat btnH=40;
    CGFloat topMargin=10;
    CGFloat LRMargin=20;
    
    for (NSInteger i=0; i<count; i++) {
        UIButton* btn=[UIButton buttonWithType:UIButtonTypeCustom];
        SortModel* sortModel=self.sorts[i];
        [btn setTitle:sortModel.label forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        
        [btn setBackgroundImage:[UIImage imageNamed:@"btn_filter_normal"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"btn_filter_selected"] forState:UIControlStateSelected];
        
        btn.frame=CGRectMake(LRMargin, topMargin+(topMargin+btnH)*i, btnW, btnH);
        
        [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:btn];
        
    }
    
    //设置控制器在popover中显示的尺寸
    self.preferredContentSize=CGSizeMake(LRMargin*2+btnW, topMargin+(topMargin+btnH)*count);
    
}

-(void)btnClicked:(UIButton*)btn{
    self.selectedBtn.selected=NO;
    self.selectedBtn=btn;
    self.selectedBtn.selected=YES;
    
    NSString* title=btn.currentTitle;
    
    NSDictionary* userInfo=@{JSSortDidChangeNotificationKey:title};
    [[NSNotificationCenter defaultCenter]postNotificationName:JSSortDidChangeNotification object:nil userInfo:userInfo];
    
}
@end
