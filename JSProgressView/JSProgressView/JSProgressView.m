//
//  JSProgressView.m
//  JSProgressView
//
//  Created by  江苏 on 16/5/28.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "JSProgressView.h"

@interface JSProgressView()

/*定时器*/
@property(strong,nonatomic)NSTimer* timer;
@end

@implementation JSProgressView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}

-(void)awakeFromNib{
    [super awakeFromNib];
    [self setUp];
}

-(void)setUp{
    
    self.timer=[NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(progressValueChanged) userInfo:nil repeats:YES];
    
    //加入到runloop中，防止滑动干扰
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    
}

-(void)progressValueChanged{
    
    self.progress+=0.025;
    
    //当载入完成时，关闭定时器
    if (self.progress==1.0) {
        [self.timer invalidate];
        return;
    }
    
    //最大只能加载到0.8，剩余0.2要等载入完成再显示上去
    if (self.progress==0.8) {
        [self.timer invalidate];
        
    }
    
}

@end
