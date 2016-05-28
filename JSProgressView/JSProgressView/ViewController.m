//
//  ViewController.m
//  JSProgressView
//
//  Created by  江苏 on 16/5/28.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIWebViewDelegate>
@property (strong, nonatomic) IBOutlet UIProgressView *progressView;
@property (strong, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://github.com"]]];
    
    
}

-(void)webViewDidStartLoad:(UIWebView *)webView{
    
    //当再次开始载入时，清0
    self.progressView.progress=0.0;
    
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    //当载入完成的时候，设置progressView值为1
    
    [UIView animateWithDuration:0.25 animations:^{
        self.progressView.progress=1.0;
    }];
}

@end
