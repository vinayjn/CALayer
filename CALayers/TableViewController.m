//
//  TableViewController.m
//  CALayers
//
//  Created by Vinay Jain on 19/01/17.
//  Copyright © 2017 Vinay Jain. All rights reserved.
//

#import "TableViewController.h"
#import "ViewController.h"

@implementation TableViewController

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    ViewController* viewController = [segue destinationViewController];
    viewController.selectedLayer = [[segue identifier] integerValue];

}


@end
