//
//  SlidTableView.m
//  Choumeimeifa
//
//  Created by xiaokang on 15/11/30.
//  Copyright © 2015年 ChouMei. All rights reserved.
//

#import "SlidTableView.h"

@implementation SlidTableView

-(instancetype)initWithFrame:(CGRect)frame withArray:(NSArray *)contentArray
{
    self = [super init];
    if (self) {
        self.dataArray = [[NSMutableArray alloc] init];
        [self.dataArray addObjectsFromArray:contentArray];
        
        self.frame = frame;
        
        self.tableView = [[UITableView alloc] init];
        self.tableView.transform = CGAffineTransformMakeRotation(-M_PI/2);
        self.tableView.frame = self.bounds;
        self.tableView.bounces = NO;
        self.tableView.scrollsToTop = YES;
        self.tableView.pagingEnabled = YES;
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.tableView.showsVerticalScrollIndicator = NO;
        
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        
        [self addSubview:self.tableView];
    }
    return self;
}
#pragma mark --- tableView datasouce and delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdtifier = @"cell";
    UITableViewCell *cell;
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdtifier];
        cell.transform = CGAffineTransformMakeRotation(M_PI/2);
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.contentView.backgroundColor = [UIColor clearColor];
        
        UIViewController *vc = [_dataArray objectAtIndex:indexPath.row];
        vc.view.frame = cell.bounds;
        [cell.contentView addSubview:vc.view];
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.frame.size.width;
}

#pragma mark --- scrollView delegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if ([self.delegate respondsToSelector:@selector(scrollChangeToIndex:)]) {
        int index = scrollView.contentOffset.y / self.frame.size.width;
        
        [self.delegate scrollChangeToIndex:index + 1];
    }
    
}

#pragma mark --- select onesIndex
-(void)selectIndex:(NSInteger)index
{
    [UIView animateWithDuration:0.3 animations:^{
        [_tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0] atScrollPosition:UITableViewScrollPositionNone animated:NO];
    }];
}

@end
