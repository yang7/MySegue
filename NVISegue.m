//
//  NVISegue.m
//  testNoNavi
//
//  Created by admin-1 on 14-6-5.
//  Copyright (c) 2014年 luoziyang. All rights reserved.
//

#import "NVISegue.h"

@implementation NVISegue

//自定义present动画
- (void)perform
{
    UIViewController* source = (UIViewController *)self.sourceViewController;
    UIViewController* destination = (UIViewController *)self.destinationViewController;
    
    CGRect sourceFrame = source.view.frame;
    sourceFrame.origin.x = -sourceFrame.size.width;
    
    CGRect destFrame = destination.view.frame;
    destFrame.origin.x = destination.view.frame.size.width;
    destination.view.frame = destFrame;
    
    destFrame.origin.x = 0;
    [source.view.superview addSubview:destination.view];
    [UIView animateWithDuration:.25
                     animations:^{
                         source.view.frame = sourceFrame;
                         destination.view.frame = destFrame;
                     }
                     completion:^(BOOL finished) {
                         [source presentViewController:destination animated:NO completion:nil];
                     }];
}

@end
