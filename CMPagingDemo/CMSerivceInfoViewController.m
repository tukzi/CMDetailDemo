//
//  CMSerivceInfoViewController.m
//  CMPagingDemo
//
//  Created by song.he on 15/11/24.
//  Copyright © 2015年 hesong. All rights reserved.
//

#import "CMSerivceInfoViewController.h"
#import "MyConfig.h"
#import "CMProductIntroViewCtrl.h"
#import "CMScheduledViewCtrl.h"
#import "CMBeautyViewCtrl.h"
#import "CMProductIntroViewCtrl.h"
#import "CMScheduledViewCtrl.h"
#import "SegmentTapView.h"
#import "SlidTableView.h"

@interface CMSerivceInfoViewController ()<UIScrollViewDelegate,SegmentTapViewDelegate,SlidTableViewDelegate>

@property (nonatomic, strong) UIButton *upBtn;
@property (nonatomic, strong) SegmentTapView *segment;
@property (nonatomic, strong) SlidTableView *flipView;
@property (nonatomic, strong) NSMutableArray *controllsArray;

@end

@implementation CMSerivceInfoViewController

- (NSMutableArray *)controllsArray
{
    if (!_controllsArray) {
        self.controllsArray = [[NSMutableArray alloc] init];
    }
    return _controllsArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    /* self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0,SCREEN_WIDTH , SCREEN_HEIGHT - StartY)];
    self.scrollView.contentSize = CGSizeMake(0, SCREEN_HEIGHT - 44 -64-44);
    self.scrollView.backgroundColor = UIColorFromRGB(0xfafafa);
    [self.view addSubview:self.scrollView];
    self.scrollView.delegate = self; */
    

    
    /* [self initSegment];
    [self initSlidTableView]; */

}

- (void)btnClicked:(id)sender{
    [[NSNotificationCenter defaultCenter]postNotificationName:@"kCm" object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

- (void)initSegment{
    self.segment = [[SegmentTapView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40) withDataArray:[NSArray arrayWithObjects:@"产品介绍",@"预约流程",@"定妆流程", nil] withFont:14];
    self.segment.delegate = self;
    [self.scrollView addSubview:self.segment];
}

- (void)initSlidTableView{
    CMProductIntroViewCtrl *pro = [[CMProductIntroViewCtrl alloc]init];
    CMScheduledViewCtrl *sch = [[CMScheduledViewCtrl alloc]init];
    CMBeautyViewCtrl *bea = [[CMBeautyViewCtrl alloc]init];
    [self.controllsArray addObject:pro];
    [self.controllsArray addObject:sch];
    [self.controllsArray addObject:bea];
    self.flipView = [[SlidTableView alloc]initWithFrame:CGRectMake(0, 40, SCREEN_WIDTH, SCREEN_HEIGHT - 40 -64) withArray:self.controllsArray] ;
    self.flipView.delegate = self;
    [self.scrollView addSubview:self.flipView];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
     [super scrollViewDidScroll:scrollView]; 
     if (scrollView == self.scrollView) {
   
    }else{
        /* NSLog(@"%f",scrollView.contentOffset.y);
         if (scrollView.tag == 999 && scrollView.contentOffset.y <= 1) {
             [scrollView resignFirstResponder];
         } */
    }
}

-(void)selectedIndex:(NSInteger)index{
    [self.flipView selectIndex:index];
}
-(void)scrollChangeToIndex:(NSInteger)index{
    [self.segment selectIndex:index];
}
@end
