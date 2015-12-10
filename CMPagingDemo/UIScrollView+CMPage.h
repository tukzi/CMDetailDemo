//
//  UIScrollView+CMPage.h
//  CMPagingDemo
//
//  Created by song.he on 15/11/24.
//  Copyright © 2015年 hesong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MJRefresh.h>
#import "CMLoadMoreFooter.h"
#import "CMRefreshHeader.h"

#define kBottomViewHeight 44

@interface UIScrollView (CMPage)

@property (nonatomic, strong) UIScrollView *secondScrollView;
@property (nonatomic, strong) UIButton *upBtn;

- (void)endHeaderRefresh;

@end
