//
//  LiveViewController.m
//  yingke
//
//  Created by zhengwenming on 2016/11/14.
//  Copyright © 2016年 zhengwenming. All rights reserved.
//

#import "LiveViewController.h"
#import "LFLivePreview.h"
#import "GPUImage.h"

@interface LiveViewController ()
@property (nonatomic, weak) GPUImageBilateralFilter *bilateralFilter;
@property (nonatomic, weak) GPUImageBrightnessFilter *brightnessFilter;
@property (nonatomic, strong) GPUImageVideoCamera *videoCamera;
@end

@implementation LiveViewController
//
//- (void)meibaiAction:(UISlider *)sender {
//    _brightnessFilter.brightness = sender.value;
//}
//
//- (void)mopiAction:(UISlider *)sender {
//    // 值越小，磨皮效果越好
//    CGFloat maxValue = 10;
//    [_bilateralFilter setDistanceNormalizationFactor:(maxValue - sender.value)];
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    LFLivePreview *preView = [[LFLivePreview alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [preView.closeButton addTarget:self action:@selector(exitLiveVC) forControlEvents:UIControlEventTouchUpInside];
//    [preView.mopiSlider addTarget:self action:@selector(mopiAction:)  forControlEvents:UIControlEventValueChanged];
//    [preView.meibaiSlider addTarget:self action:@selector(meibaiAction:)  forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:preView];
    
    /*
    GPUImageVideoCamera *videoCamera = [[GPUImageVideoCamera alloc] initWithSessionPreset:AVCaptureSessionPresetHigh cameraPosition:AVCaptureDevicePositionFront];
    videoCamera.outputImageOrientation = UIInterfaceOrientationPortrait;
    _videoCamera = videoCamera;
    
    // 创建最终预览View
    GPUImageView *captureVideoPreview = [[GPUImageView alloc] initWithFrame:self.view.bounds];
//    [self.view insertSubview:captureVideoPreview atIndex:0];
    [self.view addSubview:captureVideoPreview];
    [self.view bringSubviewToFront:captureVideoPreview];
    // 创建滤镜：磨皮，美白，组合滤镜
    GPUImageFilterGroup *groupFilter = [[GPUImageFilterGroup alloc] init];
    
    // 磨皮滤镜
    GPUImageBilateralFilter *bilateralFilter = [[GPUImageBilateralFilter alloc] init];
    [groupFilter addTarget:bilateralFilter];
    _bilateralFilter = bilateralFilter;
    
    // 美白滤镜
    GPUImageBrightnessFilter *brightnessFilter = [[GPUImageBrightnessFilter alloc] init];
    [groupFilter addTarget:brightnessFilter];
    _brightnessFilter = brightnessFilter;
    
    // 设置滤镜组链
    [bilateralFilter addTarget:brightnessFilter];
    [groupFilter setInitialFilters:@[bilateralFilter]];
    groupFilter.terminalFilter = brightnessFilter;
    
    // 设置GPUImage处理链，从数据源 => 滤镜 => 最终界面效果
    [videoCamera addTarget:groupFilter];
    [groupFilter addTarget:captureVideoPreview];
    
    // 必须调用startCameraCapture，底层才会把采集到的视频源，渲染到GPUImageView中，就能显示了。
    // 开始采集视频
    [videoCamera startCameraCapture];
        */
}
///退出直播
-(void)exitLiveVC{
    [self dismissViewControllerAnimated:YES completion:^{
    }];
}
- (void)dealloc
{
    NSLog(@"LiveViewController dealloc");
}
@end
