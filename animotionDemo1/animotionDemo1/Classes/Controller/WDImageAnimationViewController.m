//
//  WDImageAnimationViewController.m
//  animationDemo
//
//  Created by Wade on 15/8/22.
//  Copyright (c) 2015年 Wade. All rights reserved.
//

#import "WDImageAnimationViewController.h"

@interface WDImageAnimationViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation WDImageAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.title = @"图片动画";
    [self startLoad];
}

- (void)startLoad
{
    NSMutableArray *images = [NSMutableArray array];
    for (int i = 0; i < 3 ;i++)
    {
        NSString *name = [NSString stringWithFormat:@"loading_%02d",i+1];
        UIImage *image = [UIImage imageNamed:name];
        [images addObject:image];
    }
    
    self.imageView.animationImages = images;
    self.imageView.animationRepeatCount = 0;
    CGFloat delay = images.count * 0.1;
    self.imageView.animationDuration = delay;
    [self.imageView startAnimating];
}


@end
