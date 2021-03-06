//
//  JSTwoTableView.h
//  iPad_MeiTuan
//
//  Created by  江苏 on 16/6/4.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JSTwoTableView;
@protocol JSTwoTableViewDataSource <NSObject>

@required
-(NSInteger)numberOfRowsInLeftTableView:(JSTwoTableView*)twoTableView;

-(NSString*)twoTableView:(JSTwoTableView*)twoTableView andLeftTitleInRow:(NSInteger)row;

-(NSArray*)twoTableView:(JSTwoTableView*)twoTableView andSubDataOfRow:(NSInteger)row;

@optional
-(UIImage*)twoTableView:(JSTwoTableView*)twoTableView andImageInRow:(NSInteger)row;
-(UIImage*)twoTableView:(JSTwoTableView*)twoTableView andHighLightedImageInRow:(NSInteger)row;

@end


@protocol JSTwoTableViewDelegate  <NSObject>

@optional

-(void)twoTableView:(JSTwoTableView*)twoTableView didSelectedLeftIndex:(NSInteger)leftIndex;
-(void)twoTableView:(JSTwoTableView *)twoTableView didSelectedRightIndex:(NSInteger)rightIndex andLeftIndex:(NSInteger)leftIndex;
@end

@interface JSTwoTableView : UIView

+(instancetype)twoTableView;

@property(nonatomic,strong)id<JSTwoTableViewDataSource> dataSource;

@property(nonatomic,strong)id<JSTwoTableViewDelegate> delegate;

@end
