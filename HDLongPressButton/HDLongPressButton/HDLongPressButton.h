//
//  HDLongPressButton.h
//  HDLongPressButton
//
//  Created by Damon on 2018/4/17.
//  Copyright © 2018年 damon. All rights reserved.
//

#import <UIKit/UIKit.h>

///点击回调
typedef void(^TapCompleteHandler)(void);
///开始长按回调
typedef void(^StartLongPressCompleteHandler)(void);
///结束长按回调
typedef void(^EndLongPressCompleteHandler)(float longPressTime);
///取消长按回调
typedef void(^CancelLongPressCompleteHandler)(void);



@interface HDLongPressButton : UIControl
///按钮中心颜色，默认红色
@property (strong, nonatomic) UIColor *topColor;
///进度条颜色
@property (strong, nonatomic) UIColor *progressColor;
///最长的长按时间，默认为4s
@property (assign, nonatomic) float maxPressTime;
///点击
@property (copy, nonatomic) TapCompleteHandler tapCompleteHandler;
/// 开始长按
@property (copy, nonatomic) StartLongPressCompleteHandler startLongPressCompleteHandler;
/// 结束长按
@property (copy, nonatomic) EndLongPressCompleteHandler endLongPressCompleteHandler;
/// 取消长按
@property (copy, nonatomic) CancelLongPressCompleteHandler cancelLongPressCompleteHandler;

@end
