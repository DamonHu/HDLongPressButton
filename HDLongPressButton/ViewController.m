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
    HDLongPressButton *longPressBtn = [[HDLongPressButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [longPressBtn setTopColor:[UIColor greenColor]];
    [longPressBtn setProgressColor:[UIColor redColor]];
    [self.view addSubview:longPressBtn];
    
    longPressBtn.tapCompleteHandler = ^{
        NSLog(@"点击");
    };
    longPressBtn.startLongPressCompleteHandler = ^{
        NSLog(@"开始长按");
    };
    longPressBtn.endLongPressCompleteHandler = ^(float longPressTime) {
        NSLog(@"结束长按");
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
