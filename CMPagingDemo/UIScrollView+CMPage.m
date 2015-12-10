//
//  UIScrollView+CMPage.m
//  CMPagingDemo
//
//  Created by song.he on 15/11/24.
//  Copyright © 2015年 hesong. All rights reserved.
//

#import "UIScrollView+CMPage.h"

#import "MyConfig.h"

static const float kAnimationDuration = 0.25f;

static const char cm_originContentHeight;
static const char cm_originContentOffset;
static const char cm_secondScrollView;
static const char cm_upBtn;

@interface UIScrollView()

@property (nonatomic, assign) float originContentHeight;
@property (nonatomic, assign) float originContentOffset;

@end

@implementation UIScrollView (CMPage)

- (void)setOriginContentHeight:(float)originContentHeight {
    objc_setAssociatedObject(self, &cm_originContentHeight, @(originContentHeight), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (float)originContentHeight {
    return [objc_getAssociatedObject(self, &cm_originContentHeight) floatValue];
}

/* 记录上一个scrollView的最底下的offset方便返回 */
- (void)setOriginContentOffset:(float)originContentOffset {
    objc_setAssociatedObject(self, &cm_originContentOffset, @(originContentOffset), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (float)originContentOffset {
    return [objc_getAssociatedObject(self, &cm_originContentOffset) floatValue];
}


- (void)setFirstScrollView:(UIScrollView *)firstScrollView {
    [self addFirstScrollViewFooter];
}

- (UIScrollView *)secondScrollView {
    return objc_getAssociatedObject(self, &cm_secondScrollView);
}

/* upBtn */
- (void)setUpBtn:(UIButton *)upBtn{
     objc_setAssociatedObject(self, &cm_upBtn, upBtn, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIButton *)upBtn{
    return objc_getAssociatedObject(self, &cm_upBtn);
}

- (void)setSecondScrollView:(UIScrollView *)secondScrollView {
    objc_setAssociatedObject(self, &cm_secondScrollView, secondScrollView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [self addFirstScrollViewFooter];
    
    CGRect frame = self.bounds;
    frame.origin.y = self.contentSize.height + self.mj_footer.frame.size.height ;
    secondScrollView.frame = frame;
    
    [self addSubview:secondScrollView];
    secondScrollView.hidden = YES;
    
    [self addSecondScrollViewHeader];
}

- (void)addFirstScrollViewFooter {
    __weak __typeof(self) weakSelf = self;
    CMLoadMoreFooter *footer = [CMLoadMoreFooter footerWithRefreshingBlock:^{
        [UIView animateWithDuration:kAnimationDuration animations:^{
          self.upBtn.alpha = 1;
        }];
        [weakSelf endFooterRefreshing];
    }];
  
    footer.automaticallyRefresh = NO;
    self.mj_footer = footer;

}

- (void)addSecondScrollViewHeader {
    __weak __typeof(self) weakSelf = self;
    CMRefreshHeader *header = [CMRefreshHeader headerWithRefreshingBlock:^{
        [weakSelf endHeaderRefreshing];
    }];
    self.secondScrollView.mj_header = header;
}



- (void)endFooterRefreshing {
    [self.mj_footer endRefreshing];
    self.mj_footer.hidden = YES;
    self.scrollEnabled = NO;
    
    self.secondScrollView.mj_header.hidden = NO;
    self.secondScrollView.scrollEnabled = YES;
    self.secondScrollView.hidden = NO;
  
    
    [UIView animateWithDuration:kAnimationDuration animations:^{
        self.contentInset = UIEdgeInsetsMake(-self.contentSize.height - self.mj_footer.frame.size.height, 0, 0, 0);
    }];
    
    self.originContentHeight = self.contentSize.height;
    self.originContentOffset = self.contentOffset.y - SCREEN_HEIGHT + self.mj_footer.frame.size.height +kBottomViewHeight;
    self.contentSize = self.secondScrollView.contentSize;
    
}

- (void)endHeaderRefreshing {
    [self.secondScrollView.mj_header endRefreshing];
    self.secondScrollView.mj_header.hidden = YES;
    self.secondScrollView.scrollEnabled = NO;
    self.secondScrollView.hidden = YES;
    
    self.scrollEnabled = YES;
    
    [UIView animateWithDuration:kAnimationDuration animations:^{
        self.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    }];
     self.contentSize = CGSizeMake(0, self.originContentHeight+self.mj_footer.frame.size.height);
    [self setContentOffset:CGPointMake(0, self.originContentOffset - 1) animated:NO];
    [self addFirstScrollViewFooter];
}

- (void)endHeaderRefresh{
    [UIView animateWithDuration:kAnimationDuration animations:^{
        self.upBtn.alpha = 0;
    }];
    self.secondScrollView.scrollEnabled = NO;
    self.secondScrollView.hidden = YES;
    
    self.scrollEnabled = YES;
    [UIView animateWithDuration:kAnimationDuration animations:^{
        self.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    }];
    
    self.contentSize = CGSizeMake(0, self.originContentHeight+self.mj_footer.frame.size.height);
    [self setContentOffset:CGPointMake(0, self.originContentOffset-1) animated:NO];
    [self addFirstScrollViewFooter];
}

@end
