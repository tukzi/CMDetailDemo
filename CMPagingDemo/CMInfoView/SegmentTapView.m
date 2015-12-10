//
//  SegmentTapView.m
//  Choumeimeifa
//
//  Created by xiaokang on 15/11/30.
//  Copyright © 2015年 ChouMei. All rights reserved.
//

#import "SegmentTapView.h"

@interface SegmentTapView ()
@property (nonatomic, strong)NSMutableArray *buttonsArray;
@property (nonatomic, strong)UIImageView *lineImageView;
@end
@implementation SegmentTapView

-(instancetype)initWithFrame:(CGRect)frame withDataArray:(NSArray *)dataArray withFont:(CGFloat)font {
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = frame;
        self.backgroundColor = [UIColor whiteColor];
        _buttonsArray = [[NSMutableArray alloc] init];
        _dataArray = dataArray;
        _titleFont = font;
        
        //默认
        self.textNomalColor    = [UIColor blackColor];
        self.textSelectedColor = [UIColor redColor];
        self.lineColor = [UIColor redColor];
        
        [self addSubSegmentView];
    }
    return self;
}

-(void)addSubSegmentView
{
    float width = self.frame.size.width / _dataArray.count;
    
    for (int i = 0 ; i < _dataArray.count ; i++) {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(i * width, 0, width, self.frame.size.height)];
        button.tag = i+1;
        button.backgroundColor = [UIColor clearColor];
        [button setTitle:[_dataArray objectAtIndex:i] forState:UIControlStateNormal];
        [button setTitleColor:self.textNomalColor    forState:UIControlStateNormal];
        [button setTitleColor:self.textSelectedColor forState:UIControlStateSelected];
        button.titleLabel.font = [UIFont systemFontOfSize:_titleFont];
        
        [button addTarget:self action:@selector(tapAction:) forControlEvents:UIControlEventTouchUpInside];
        //默认第一个选中
        if (i == 0) {
            button.selected = YES;
        }
        else{
            button.selected = NO;
        }
        
        [self.buttonsArray addObject:button];
        [self addSubview:button];
        
        if (i != _dataArray.count || i != 0) {
            UILabel *line = [[UILabel alloc ] initWithFrame:CGRectMake(i * width , 0, 0.45, 40)];
            line.backgroundColor = [UIColor whiteColor];
            [self bringSubviewToFront:line];
            [self addSubview:line];
        }
    }
    self.lineImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.frame.size.height-1, width, 1)];
    self.lineImageView.backgroundColor = _lineColor;
    [self addSubview:self.lineImageView];
}

-(void)tapAction:(id)sender{
    UIButton *button = (UIButton *)sender;
    [UIView animateWithDuration:0.2 animations:^{
        self.lineImageView.frame = CGRectMake(button.frame.origin.x, self.frame.size.height-1, button.frame.size.width, 1);
    }];
    for (UIButton *subButton in self.buttonsArray) {
        if (button == subButton) {
            subButton.selected = YES;
        }
        else{
            subButton.selected = NO;
        }
    }
    if ([self.delegate respondsToSelector:@selector(selectedIndex:)]) {
        [self.delegate selectedIndex:button.tag -1];
    }
}
-(void)selectIndex:(NSInteger)index
{
    for (UIButton *subButton in self.buttonsArray) {
        if (index != subButton.tag) {
            subButton.selected = NO;
        }
        else{
            subButton.selected = YES;
            [UIView animateWithDuration:0.2 animations:^{
                self.lineImageView.frame = CGRectMake(subButton.frame.origin.x, self.frame.size.height-1, subButton.frame.size.width, 1);
            }];
        }
    }
}
#pragma mark -- set
-(void)setLineColor:(UIColor *)lineColor{
    if (_lineColor != lineColor) {
        self.lineImageView.backgroundColor = lineColor;
        _lineColor = lineColor;
    }
}
-(void)setTextNomalColor:(UIColor *)textNomalColor{
    if (_textNomalColor != textNomalColor) {
        for (UIButton *subButton in self.buttonsArray){
            [subButton setTitleColor:textNomalColor forState:UIControlStateNormal];
        }
        _textNomalColor = textNomalColor;
    }
}
-(void)setTextSelectedColor:(UIColor *)textSelectedColor{
    if (_textSelectedColor != textSelectedColor) {
        for (UIButton *subButton in self.buttonsArray){
            [subButton setTitleColor:textSelectedColor forState:UIControlStateSelected];
        }
        _textSelectedColor = textSelectedColor;
    }
}
-(void)setTitleFont:(CGFloat)titleFont{
    if (_titleFont != titleFont) {
        for (UIButton *subButton in self.buttonsArray){
            subButton.titleLabel.font = [UIFont systemFontOfSize:titleFont] ;
        }
        _titleFont = titleFont;
    }
}

@end
