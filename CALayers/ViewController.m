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
            break;
        case ReplicatorLayer:
            self.title = @"CAReplicatorLayer";
            break;
        case TextLayer:
            self.title = @"CATextLayer";
            break;
    }
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
