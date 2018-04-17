//
//  HDLongPressButton.m
//  HDLongPressButton
//
//  Created by Damon on 2018/4/17.
//  Copyright © 2018年 damon. All rights reserved.
//

#import "HDLongPressButton.h"
#import "HDLongPressButtonTopView.h"
#import "HDLongPressButtonBottomView.h"

@interface HDLongPressButton()
@property (assign, nonatomic) float hasTouchTime;   // 已经触摸时间
@property (strong, nonatomic) NSTimer *timer;
@property (strong, nonatomic) HDLongPressButtonTopView *topView;
@property (strong, nonatomic) HDLongPressButtonBottomView *bottomView;
@end

@implementation HDLongPressButton

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:207/255.0 green:206/255.0 blue:200/255.0 alpha:.8];
        self.layer.cornerRadius = self.frame.size.height/2.0;
        self.bottomView = [[HDLongPressButtonBottomView alloc] initWithFrame:self.bounds];
        [self addSubview:self.bottomView];
        self.topView = [[HDLongPressButtonTopView alloc] initWithFrame:self.bounds];
        self.topView.transform = CGAffineTransformMakeScale(0.75, 0.75);
        [self addSubview:self.topView];
        _maxPressTime = 5.0f;
    }
    return self;
}

- (void)setTopColor:(UIColor *)topColor {
    self.topView.backgroundColor = topColor;
}

- (void)setProgressColor:(UIColor *)progressColor {
    self.bottomView.progressColor = progressColor;
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    self.hasTouchTime = 0;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.02 target:self selector:@selector(drawBottomRect) userInfo:nil repeats:YES];
}


- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    if (self.hasTouchTime < 0.5) {
        /// 触发点击
        if (self.tapCompleteHandler) {
            self.tapCompleteHandler();
        }
        ///取消长按
        if (self.cancelLongPressCompleteHandler) {
            self.cancelLongPressCompleteHandler();
        }
    } else {
        // 结束长按
        __block float time = self.hasTouchTime;
        if (self.endLongPressCompleteHandler) {
            self.endLongPressCompleteHandler(time);
        }
    }
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
    self.bottomView.endAngle = 0;
    
    [UIView animateWithDuration:.35
                     animations:^{
                         self.transform = CGAffineTransformIdentity;
                         self.topView.transform = CGAffineTransformMakeScale(0.8, 0.8);
                     }];
}

- (void)drawBottomRect {
    self.hasTouchTime += 0.02;
    // 开始长按
    if (self.hasTouchTime > 0.5) {
        if (self.startLongPressCompleteHandler) {
            self.startLongPressCompleteHandler();
        }
        [UIView animateWithDuration:.35
                         animations:^{
                             self.transform = CGAffineTransformMakeScale(1.3, 1.3);
                             self.topView.transform = CGAffineTransformMakeScale(0.3, 0.3);
                         }];
        self.bottomView.endAngle = M_PI * 2 * ((self.hasTouchTime - 0.5)/(self.maxPressTime - 0.5));
    }
    
    if (self.hasTouchTime > self.maxPressTime) {
        // 结束
        if (self.timer) {
            [self.timer invalidate];
            self.timer = nil;
        }
        __block float time = self.hasTouchTime;
        if (self.endLongPressCompleteHandler) {
            self.endLongPressCompleteHandler(time);
        }
    }
}
@end
