//
//  BlueView.m
//  ResponseChain
//
//  Created by Macx on 2018/8/15.
//  Copyright © 2018年 Chan. All rights reserved.
//

#import "BlueView.h"

@implementation BlueView


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [super touchesBegan:touches withEvent:event];
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    // 1.判断下自己能否接收事件
    NSLog(@"查找到了%@",NSStringFromClass([self class]));
    if (self.userInteractionEnabled == NO || self.hidden == YES || self.alpha <= 0.01) return nil;
    // 2.判断下点在不在当前控件上
    if ([self pointInside:point withEvent:event] == NO) return  nil; // 点不在当前控件
    int count = (int)self.subviews.count;
    //自后往前查找最合适的view
    for (int i = count - 1; i >= 0; i--) {
        UIView *childView = self.subviews[i];
        // 把当前坐标系上的点转换成子控件上的点
        CGPoint childP =  [self convertPoint:point toView:childView];
        UIView *actionView = [childView hitTest:childP withEvent:event];
        if (actionView) {
            return actionView;
        }
    }
    // 4.如果没有比自己合适的子控件,最合适的view就是自己
    return self;
}
@end
