//
//  CMServiceDetailViewController.m
//  CMPagingDemo
//
//  Created by song.he on 15/11/24.
//  Copyright © 2015年 hesong. All rights reserved.
//

#import "CMServiceDetailViewController.h"
#import "CMSerivceInfoViewController.h"
#import "UIScrollView+CMPage.h"

#import "CMProductIntroViewCtrl.h"
#import "CMScheduledViewCtrl.h"
#import "CMBeautyViewCtrl.h"

@interface CMServiceDetailViewController () <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *contentScrollView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;

@property (nonatomic, strong) NSMutableArray *titleArray;

@property (nonatomic, strong) UIView *bottomView;
@property (nonatomic, strong) UIButton *buyButton;

@property (nonatomic, strong) UIButton *upBtn;

@property (nonatomic, strong) CMSerivceInfoViewController *detailVC;

@end

@implementation CMServiceDetailViewController



 - (UITableView *)tableView
{
    if (!_tableView) {
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64 - kBottomViewHeight) style:UITableViewStylePlain];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.contentSize = CGSizeMake(SCREEN_WIDTH, 44*self.dataArray.count);
        self.tableView.backgroundColor = CMBackColor;
        self.tableView.rowHeight = 44;
    }
    return _tableView;
}

- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        NSMutableArray *tepm = [NSMutableArray array];
        self.dataArray = [[NSMutableArray alloc] initWithArray:[UIFont familyNames]];
        for (int i = 0; i < self.dataArray.count; i++) {
            if (i % 3 == 0) {
                [tepm addObject:self.dataArray[i]];
            }
        }
        self.dataArray = tepm;
    }
    return _dataArray;
}

- (UIView *)bottomView
{
    if (!_bottomView) {
        self.bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.tableView.frame), SCREEN_WIDTH, kBottomViewHeight) ];
        self.bottomView.backgroundColor = UIColorFromRGB(0xffffff);
        [self.view addSubview:self.bottomView];
    }
    return _bottomView;
}

- (UIButton *)upBtn
{
    if (!_upBtn) {
        self.upBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.upBtn.frame = CGRectMake(SCREEN_WIDTH - 44 -15, SCREEN_HEIGHT - 64 - 44 - 44-64, 44, 44);
        [self.upBtn setTitle:@"返回" forState:UIControlStateNormal];
        [self.upBtn setTitle:@"返回" forState:UIControlStateSelected];
        self.upBtn.backgroundColor = [UIColor orangeColor];
        self.upBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [self.upBtn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:self.upBtn];
        self.upBtn.alpha = 0;
    }
    return _upBtn;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.edgesForExtendedLayout = UIRectEdgeNone;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"服务详情";
    
    [self.view addSubview:self.tableView];
    
    /* 底部详情控制器 */
    [self setupTitleArr];
    _detailVC = [[CMSerivceInfoViewController alloc] initWithViewControllers:self.titleArray];
    [self addChildViewController:_detailVC];
    if (_detailVC.view != nil) {
        self.tableView.secondScrollView = _detailVC.scrollView;
        self.tableView.upBtn = self.upBtn;
    }
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(endHeaderFresh) name:@"kCm" object:nil];

    /* 底部立即预约 */
    [self steupBottomView];
    
    [self.view bringSubviewToFront:self.upBtn];
}

- (void)steupBottomView{
    
    _buyButton = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 140, 0, 140, kBottomViewHeight)];
    [_buyButton setTitle:@"立即预约" forState:UIControlStateNormal];
    _buyButton.enabled = NO;
    [_buyButton setBackgroundImage:[[UIImage imageNamed:@"xiangmuxiangqing_lijigoumai_normal"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10)] forState:UIControlStateNormal];
    [_buyButton setBackgroundImage:[[UIImage imageNamed:@"xiangmuxiangqing_lijigoumai_pressed"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10)] forState:UIControlStateHighlighted];
    [_buyButton setBackgroundImage:[[UIImage imageNamed:@"xiangmuxiangqing_lijigoumai_deselected"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10)] forState:UIControlStateDisabled];
    _buyButton.titleLabel.font = CMBIGFONT;
    [_buyButton addTarget:self action:@selector(buyButtonTouch) forControlEvents:UIControlEventTouchUpInside];
    [self.bottomView addSubview:_buyButton];
}

- (void)buyButtonTouch{
    NSLog(@"立即购买");
}

- (void)btnClicked:(id)sender{
    [self.tableView endHeaderRefresh];
}

- (void)setupTitleArr{
    
    NSMutableArray* vcs=[NSMutableArray new];
    
    CMProductIntroViewCtrl *vc1 = [[CMProductIntroViewCtrl alloc]init];
    vc1.title = @"产品介绍";
    
    CMScheduledViewCtrl *vc2 = [[CMScheduledViewCtrl alloc]init];
    vc2.title = @"预约流程";
    
    CMBeautyViewCtrl *vc3 = [[CMBeautyViewCtrl alloc]init];
    vc3.title = @"定妆流程";
    
    [vcs addObject:vc1];
    [vcs addObject:vc2];
    [vcs addObject:vc3];

    self.titleArray = vcs;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


#pragma mark ======UITableView Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIndentfile = @"tableViewIndentfile";
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIndentfile];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentfile];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = self.dataArray[indexPath.row];
    cell.textLabel.font = [UIFont fontWithName:self.dataArray[indexPath.row] size:12];
    
    return cell;
}


- (void)endHeaderFresh{
    self.upBtn.alpha = 0;
    [self.tableView endHeaderRefresh];
}

@end
