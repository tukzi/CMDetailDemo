//
//  CMProductIntroViewCtrl.m
//  CMPagingDemo
//
//  Created by song.he on 15/11/25.
//  Copyright © 2015年 hesong. All rights reserved.
//

#import "CMProductIntroViewCtrl.h"
#import "MyConfig.h"
#import "UIScrollView+CMPage.h"


@interface CMProductIntroViewCtrl()<UIWebViewDelegate,UIScrollViewDelegate>



@end

@implementation CMProductIntroViewCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    _webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0,SCREEN_WIDTH , SCREEN_HEIGHT - 44 - 44 -64)];
    _webView.delegate = self;
    _webView.backgroundColor = [UIColor whiteColor];
    _webView.scrollView.contentSize = CGSizeMake(44, 600);
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_webView];
    [self loadWebPageWithString:@"https://www.baidu.com"];
    
    
    __weak __typeof(self) weakSelf = self;
    CMRefreshHeader *header = [CMRefreshHeader headerWithRefreshingBlock:^{
        [weakSelf endRefresh];
    }];
    _webView.scrollView.mj_header = header;
    
}

- (void)endRefresh{
    [self.webView.scrollView.mj_header endRefreshing];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"kCm" object:nil];
}

- (void)loadWebPageWithString:(NSString*)urlString
{
    NSURL *url =[NSURL URLWithString:urlString];
    NSURLRequest *request =[NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
    
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
    
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    
    if ([error code] != NSURLErrorCancelled) {
       
    }
}


@end
