//
//  ViewController.h
//  CALayers
//
//  Created by Vinay Jain on 18/01/17.
//  Copyright © 2017 Vinay Jain. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, Layer){
    ShapeLayer = 1,
    ReplicatorLayer,
    TextLayer
};

@interface ViewController : UIViewController

@property (nonatomic) Layer selectedLayer;

@end

