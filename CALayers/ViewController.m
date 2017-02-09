//
//  ViewController.m
//  CALayers
//
//  Created by Vinay Jain on 18/01/17.
//  Copyright © 2017 Vinay Jain. All rights reserved.
//

#import "ViewController.h"

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
            self.view.backgroundColor = [UIColor whiteColor];
            [self addReplicatorLayer];
            break;
        case TextLayer:
            self.title = @"CATextLayer";
            self.view.backgroundColor = [UIColor whiteColor];
            [self addTextLayer];
            break;
    }
}

- (void)addShapeLayer {
    
    CAShapeLayer *roundedRect = [CAShapeLayer layer];
    
    roundedRect.path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 120, 120) cornerRadius:8.0].CGPath;
    roundedRect.fillColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5].CGColor;
    
    CAShapeLayer *circle = [CAShapeLayer layer];
    
    circle.path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(0, 0) radius:50 startAngle:0.0*(M_PI/180.0)  endAngle:360.0*(M_PI/180.0) clockwise:YES].CGPath;
    circle.lineWidth = 5.0;
    
    circle.fillColor = [UIColor clearColor].CGColor;
    circle.strokeColor = [UIColor lightGrayColor].CGColor;
    circle.backgroundColor = [UIColor clearColor].CGColor;
    circle.position = CGPointMake(60, 60);
    
    [roundedRect addSublayer:circle];
    
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
    
    [circle addSublayer:arc];
    
    roundedRect.position = CGPointMake((CGRectGetMaxX(self.view.frame) - 120)/2.0, (CGRectGetMaxY(self.view.frame) - 120)/2.0);
    [self.view.layer addSublayer:roundedRect];
}

- (void)addReplicatorLayer {
    
    CAReplicatorLayer *replicatorLayer = [CAReplicatorLayer layer];
    
    UIImage *image = [UIImage imageNamed:@"haptik_logo"];
    CALayer *imageLayer = [CALayer layer];
    imageLayer.contents = (__bridge id)[image CGImage];
    imageLayer.bounds = CGRectMake(0.0, 0.0, [image size].width, [image size].height);
    imageLayer.anchorPoint = CGPointMake(0.0, 0.0);
    
    replicatorLayer.bounds = CGRectMake(0.0, 0.0, [image size].width, [image size].height * 2);
    replicatorLayer.masksToBounds = YES;
    replicatorLayer.anchorPoint = CGPointMake(0.5, 0.0);
    replicatorLayer.position = CGPointMake(self.view.frame.size.width / 2.0, 80.0);
    
    [replicatorLayer addSublayer:imageLayer];
    
    CATransform3D transform = CATransform3DIdentity;
    transform = CATransform3DScale(transform, 1.0, -1.0, 1.0);
    transform = CATransform3DTranslate(transform, 0.0, -[image size].height * 2.0, 1.0);
    
    replicatorLayer.instanceTransform = transform;
    replicatorLayer.instanceCount = 2;
    
    [self.view.layer addSublayer:replicatorLayer];
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = @[
                               (__bridge id)[[[UIColor whiteColor] colorWithAlphaComponent:0.25] CGColor],
                               (__bridge id)[[UIColor whiteColor] CGColor]
                               ];
    
    gradientLayer.bounds = CGRectMake(0.0, 0.0, replicatorLayer.frame.size.width, [image size].height + 1.0);
    
    gradientLayer.position = CGPointMake(replicatorLayer.position.x, replicatorLayer.position.y + [image size].height * 1.5);
    
    [self.view.layer addSublayer:gradientLayer];
    
}

- (void)addTextLayer {
    
    UIImage *haptikLogo = [UIImage imageNamed:@"Artboard"];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
    imageView.image = haptikLogo;
    CATextLayer *textLayer = [CATextLayer layer];

    textLayer.frame = imageView.bounds;
    textLayer.rasterizationScale = [UIScreen mainScreen].scale;
    textLayer.contentsScale = [UIScreen mainScreen].scale;

    textLayer.alignmentMode = kCAAlignmentCenter;
    textLayer.fontSize = 100.0;
    textLayer.font = (__bridge CFTypeRef _Nullable)([UIFont systemFontOfSize:100]);
    textLayer.wrapped = true;
    textLayer.truncationMode = kCATruncationEnd;
    textLayer.string = @"haptik";
    imageView.layer.mask = textLayer;

    [self.view addSubview:imageView];
    imageView.center = self.view.center;

}

@end
