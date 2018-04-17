//
//  ViewController.m
//  HDLongPressButton
//
//  Created by Damon on 2018/4/17.
//  Copyright © 2018年 damon. All rights reserved.
//

#import "ViewController.h"
#import "HDLongPressButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 250, 300, 100)];
    [titleLabel setFont:[UIFont systemFontOfSize:22]];
    titleLabel.numberOfLines = 0;
    [titleLabel setText:@"操作"];
    [titleLabel setTextColor:[UIColor blackColor]];
    [self.view addSubview:titleLabel];
    
    
    HDLongPressButton *longPressBtn = [[HDLongPressButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [longPressBtn setTopColor:[UIColor greenColor]];
    [longPressBtn setProgressColor:[UIColor redColor]];
    [self.view addSubview:longPressBtn];
    
    longPressBtn.tapCompleteHandler = ^{
        NSLog(@"点击");
        [titleLabel setText:@"点击"];
    };
    longPressBtn.startLongPressCompleteHandler = ^{
        NSLog(@"开始长按");
        [titleLabel setText:@"开始长按"];
    };
    longPressBtn.endLongPressCompleteHandler = ^(float longPressTime) {
        NSLog(@"结束长按");
        [titleLabel setText:[NSString stringWithFormat:@"结束长按，长按时间:%f",longPressTime]];
    };
    longPressBtn.cancelLongPressCompleteHandler = ^{
        NSLog(@"取消长按");
        
    };
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
