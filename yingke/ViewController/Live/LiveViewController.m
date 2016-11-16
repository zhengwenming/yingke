//
//  LiveViewController.m
//  yingke
//
//  Created by zhengwenming on 2016/11/14.
//  Copyright © 2016年 zhengwenming. All rights reserved.
//

#import "LiveViewController.h"
#import "LFLivePreview.h"





@interface LiveViewController ()

@end

@implementation LiveViewController





- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}

- (void)setupBgImageView{
    
    UIImageView *bgImageView = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    bgImageView.contentMode = UIViewContentModeCenter;
    
    bgImageView.image = [UIImage imageNamed:@"bg_zbfx"];
    
    [self.view insertSubview:bgImageView atIndex:0];
}


- (void)loadView{
    
    LFLivePreview *preView = [[LFLivePreview alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    self.view = preView;
    
    
    preView.block = ^{
        
        [self dismissViewControllerAnimated:YES completion:^{
            
        }];
        
    };
    
    
}
- (void)dealloc
{
    NSLog(@"LiveViewController");
}
@end
