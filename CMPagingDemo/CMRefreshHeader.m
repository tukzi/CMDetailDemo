//
//  CMRefreshHeader.m
//  CMPagingDemo
//
//  Created by song.he on 15/11/25.
//  Copyright © 2015年 hesong. All rights reserved.
//

#import "CMRefreshHeader.h"
#import "MyConfig.h"

@interface CMRefreshHeader ()

@property (nonatomic, weak) UIImageView *arrowView;
@property (nonatomic, weak)  UILabel *label;


@end


@implementation CMRefreshHeader

#pragma mark - 重写方法
#pragma mark 在这里做一些初始化配置（比如添加子控件）
- (void)prepare
{
    [super prepare];
    
    // 设置控件的高度
    self.mj_h = 65;
    
    // 添加下拉图片
    UIImageView *imageView = [[UIImageView alloc] init];
    
    [self addSubview:imageView];
    self.arrowView = imageView;
    
    // 添加label
    UILabel *label = [[UILabel alloc] init];
    label.textColor = [UIColor colorWithRed:1.0 green:0.5 blue:0.0 alpha:1.0];
    label.font = [UIFont boldSystemFontOfSize:16];
    label.textAlignment = NSTextAlignmentCenter;
    [self addSubview:label];
    self.label = label;
    

    
}

#pragma mark 在这里设置子控件的位置和尺寸
- (void)placeSubviews
{
    [super placeSubviews];

    self.arrowView.frame = CGRectMake(SCREEN_WIDTH/2 -35/2,15, 35, 13);
    self.label.frame = CGRectMake(0, CGRectGetMaxY(self.arrowView.frame) +15, SCREEN_WIDTH, 12);
    
}

#pragma mark 监听scrollView的contentOffset改变
- (void)scrollViewContentOffsetDidChange:(NSDictionary *)change
{
    [super scrollViewContentOffsetDidChange:change];
    
}

#pragma mark 监听scrollView的contentSize改变
- (void)scrollViewContentSizeDidChange:(NSDictionary *)change
{
    [super scrollViewContentSizeDidChange:change];
    
}

#pragma mark 监听scrollView的拖拽状态改变
- (void)scrollViewPanStateDidChange:(NSDictionary *)change
{
    [super scrollViewPanStateDidChange:change];
    
}

#pragma mark 监听控件的刷新状态
- (void)setState:(MJRefreshState)state
{
    MJRefreshCheckState;
    
    switch (state) {
        case MJRefreshStateIdle:
            self.label.text = @"下拉,查看上文内容";
            self.arrowView.image = [UIImage imageNamed:@"xuanshangshouye_anniu_jiantou2"];
            break;
        case MJRefreshStatePulling:
            self.label.text = @"松手,查看上文内容";
            self.arrowView.image = [UIImage imageNamed:@"xuanshangshouye_anniu_jiantou2"];
        default:
            break;
    }
}





@end
