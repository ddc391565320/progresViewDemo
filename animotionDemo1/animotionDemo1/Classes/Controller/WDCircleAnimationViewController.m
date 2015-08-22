//
//  WDCircleAnimationViewController.m
//  animationDemo
//
//  Created by Wade on 15/8/22.
//  Copyright (c) 2015年 Wade. All rights reserved.
//

#import "WDCircleAnimationViewController.h"
#import "ACPDownloadView.h"
#import "ACPIndeterminateGoogleLayer.h"
#import "ACPStaticImagesAlternative.h"

@interface WDCircleAnimationViewController ()
{
    NSTimer *_timer;
}
@property (weak, nonatomic) IBOutlet ACPDownloadView *downloadView;
@property (nonatomic, assign) float progress;
@end

@implementation WDCircleAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"转圈动画";
    [self start];
}

- (void)start
{
// If you want to change the animation in the indeterminate state
ACPIndeterminateGoogleLayer * layer = [ACPIndeterminateGoogleLayer new];
[layer updateColor:[UIColor blueColor]];
[self.downloadView setIndeterminateLayer:layer];

// You can define a behaviour if the view is tapped. (Optional)
[self.downloadView setActionForTap:^(ACPDownloadView *downloadView, ACPDownloadStatus status){
    switch (status) {
        case ACPDownloadStatusNone:
            [downloadView setIndicatorStatus:ACPDownloadStatusIndeterminate];
            break;
        case ACPDownloadStatusRunning:
            [downloadView setIndicatorStatus:ACPDownloadStatusCompleted];
            break;
        case ACPDownloadStatusIndeterminate:
            [downloadView setIndicatorStatus:ACPDownloadStatusRunning];
            break;
        case ACPDownloadStatusCompleted:
            [downloadView setIndicatorStatus:ACPDownloadStatusNone];
            break;
            
        default:
            break;
    }
}];
// This timer has been written just for testing purposes. It's running and changing the value of the progress variable constantly.
_timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(increment:) userInfo:nil repeats:YES];
}

- (void)increment:(NSTimer *)timer {
    
    self.progress = (self.progress <= 0.8f ? self.progress + 0.2f : 0.0f);
    NSLog(@"Progress %f", self.progress);
    [self.downloadView setProgress:self.progress animated:YES];
}


@end
