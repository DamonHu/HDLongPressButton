//
//  HDLongPressButtonTopView.m
//  HDLongPressButton
//
//  Created by Damon on 2018/4/17.
//  Copyright © 2018年 damon. All rights reserved.
//

#import "HDLongPressButtonTopView.h"

@implementation HDLongPressButtonTopView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self != nil) {
        self.userInteractionEnabled = NO;
        self.layer.cornerRadius = frame.size.height/2.0;
        self.backgroundColor = [UIColor redColor];
    }
    return self;
    
}

@end
