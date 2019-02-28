//
//  TestCview.m
//  testCi
//
//  Created by xzming on 2019/2/20.
//  Copyright © 2019年 HZMC. All rights reserved.
//

#import "TestCview.h"

@interface TestCview ()

@property(nonatomic, strong)CAShapeLayer *rlayer;

@end

@implementation TestCview

-(void)drawRect:(CGRect)rect{
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
  
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointZero];
    [path addLineToPoint:CGPointMake(0, 10)];
    [UIColor.redColor setStroke];
    CGContextSetLineWidth(contextRef, 5);
    CGContextAddPath(contextRef, path.CGPath);
    CGContextStrokePath(contextRef);
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    if (!self.clipsToBounds && !self.hidden && self.alpha > 0) {
        for (UIView *subview in self.subviews.reverseObjectEnumerator) {
            CGPoint subPoint = [subview convertPoint:point fromView:self];
            UIView *result = [subview hitTest:subPoint withEvent:event];
            if (result != nil) {
                return result;
            }
        }
        
    }
    if (self.userInteractionEnabled && !self.hidden && self.alpha > 0) {
        if ([self pointInside:point withEvent:event]) {
            return self;
        }
    }
    return nil;
}

@end
