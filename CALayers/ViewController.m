//
//  ViewController.m
//  CALayers
//
//  Created by Vinay Jain on 18/01/17.
//  Copyright © 2017 Vinay Jain. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    switch (self.selectedLayer) {
        case ShapeLayer:
            self.title = @"CAShapeLayer";
            self.view.backgroundColor = [UIColor blackColor];
            [self addShapeLayer];
            break;
        case ReplicatorLayer:
            self.title = @"CAReplicatorLayer";
            break;
        case TextLayer:
            self.title = @"CATextLayer";
            break;
    }
}

- (void)addShapeLayer {
    
    CAShapeLayer *roundedRect = [CAShapeLayer layer];
    
    roundedRect.path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 120, 120) cornerRadius:8.0].CGPath;
    roundedRect.fillColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5].CGColor;
    
    CAShapeLayer *fullCircle = [CAShapeLayer layer];
    
    fullCircle.path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(0, 0) radius:50 startAngle:0.0*(M_PI/180.0)  endAngle:360.0*(M_PI/180.0) clockwise:YES].CGPath;
    fullCircle.lineWidth = 5.0;
    
    fullCircle.fillColor = [UIColor clearColor].CGColor;
    fullCircle.strokeColor = [UIColor lightGrayColor].CGColor;
    fullCircle.backgroundColor = [UIColor clearColor].CGColor;
    fullCircle.position = CGPointMake(60, 60);
    
    [roundedRect addSublayer:fullCircle];
    
    CAShapeLayer *arc = [CAShapeLayer layer];
    arc.path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(0, 0) radius:50 startAngle:180.0*(M_PI/180.0)  endAngle:225.0*(M_PI/180.0) clockwise:YES].CGPath;
    arc.lineWidth = 5.0;
    arc.lineCap = kCALineCapRound;
    arc.fillColor = [UIColor clearColor].CGColor;
    arc.strokeColor = [UIColor darkGrayColor].CGColor;
    arc.backgroundColor = [UIColor clearColor].CGColor;
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.additive = YES;
    animation.duration = 10.0;
    animation.repeatCount = HUGE_VALF;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.values = @[
                        [NSNumber numberWithFloat:0.0 * M_PI],
                        [NSNumber numberWithFloat:1.75 * M_PI],
                        [NSNumber numberWithFloat:-0.75 * M_PI],
                        [NSNumber numberWithFloat:2.75 * M_PI],
                        [NSNumber numberWithFloat:0.0 * M_PI]
                        ];
    animation.keyTimes = @[ @0, @(2 / 6.0), @(3 / 6.0), @(5 / 6.0), @1 ];
    animation.timingFunctions = @[
                                 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],
                                 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]
                                 ];
    [arc addAnimation:animation forKey:@"rotate"];
    
    [fullCircle addSublayer:arc];
    
    roundedRect.position = CGPointMake((CGRectGetMaxX(self.view.frame) - 120)/2.0, (CGRectGetMaxY(self.view.frame) - 120)/2.0);
    [self.view.layer addSublayer:roundedRect];
}


@end
