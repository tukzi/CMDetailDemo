//
//  CMScheduledViewCtrl.m
//  CMPagingDemo
//
//  Created by song.he on 15/11/25.
//  Copyright © 2015年 hesong. All rights reserved.
//

#import "CMScheduledViewCtrl.h"
#import "MyConfig.h"
#import "UIScrollView+CMPage.h"
#import "CMBeautyViewCtrl.h"

@interface CMScheduledViewCtrl()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation CMScheduledViewCtrl

- (UITableView *)tableView
{
    if (!_tableView) {
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64 - 44-44) style:UITableViewStylePlain];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.backgroundColor = CMBackColor;
        self.tableView.rowHeight = 44;
        
        __weak __typeof(self) weakSelf = self;
        CMRefreshHeader *header = [CMRefreshHeader headerWithRefreshingBlock:^{
            [weakSelf endRefresh];
        }];
        self.tableView.mj_header = header;
    }
    return _tableView;
}

- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        self.dataArray = [[NSMutableArray alloc] initWithArray:[UIFont familyNames]];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    
}

- (void)endRefresh{
    [self.tableView.mj_header endRefreshing];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"kCm" object:nil];
}

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
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 1) {
        CMBeautyViewCtrl *vc= [[CMBeautyViewCtrl alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end