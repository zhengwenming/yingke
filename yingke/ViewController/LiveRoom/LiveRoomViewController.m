//
//  LiveRoomViewController.m
//  yingke
//
//  Created by 郑文明 on 16/11/15.
//  Copyright © 2016年 zhengwenming. All rights reserved.
//

#import "LiveRoomViewController.h"
#import <IJKMediaFramework/IJKMediaFramework.h>
#import "LiveModel.h"
#import "UserModel.h"
@interface LiveRoomViewController ()
@property (strong, nonatomic)  UIImageView *imageView;
@property (strong, nonatomic)  UIButton *exitBtn;

@property (nonatomic, strong) IJKFFMoviePlayerController *player;

@end

@implementation LiveRoomViewController

-(UIImageView *)imageView{
    if (_imageView==nil) {
        _imageView = [[UIImageView alloc]initWithFrame:self.view.bounds];
        [self.view addSubview:_imageView];
    }
    return _imageView;
}

-(UIButton *)exitBtn{
    if (_exitBtn==nil) {
        _exitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _exitBtn.frame = CGRectMake(self.view.bounds.size.width- 50, self.view.bounds.size.height-50, 50, 50);
        _exitBtn.layer.cornerRadius = _exitBtn.frame.size.height/2;
        [_exitBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_exitBtn setTitle:@"退出" forState:UIControlStateNormal];
        [_exitBtn setTitle:@"退出" forState:UIControlStateSelected];
        _exitBtn.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [_exitBtn addTarget:self action:@selector(exitPlay:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_exitBtn];
    }
    return _exitBtn;
}
//退出播放
-(void)exitPlay:(UIButton *)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置直播占位图片
    NSURL *imageUrl = [NSURL URLWithString:[NSString stringWithFormat:@"http://img.meelive.cn/%@",self.liveModel.creator.portrait]];
    [self.imageView sd_setImageWithURL:imageUrl placeholderImage:nil];
    
    // 拉流地址
    NSURL *url = [NSURL URLWithString:self.liveModel.stream_addr];
    
    // 创建IJKFFMoviePlayerController：专门用来直播，传入拉流地址就好了
    self.player = [[IJKFFMoviePlayerController alloc] initWithContentURL:url withOptions:nil];
    self.player.view.frame = [UIScreen mainScreen].bounds;
    // 准备播放
    [self.player prepareToPlay];
    [self.view insertSubview:self.player.view atIndex:1];
    [self.view bringSubviewToFront:self.exitBtn];
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    // 界面消失，一定要记得停止播放
    [_player pause];
    [_player stop];
    [_player shutdown];
}

- (void)dealloc
{
    NSLog(@"LiveRoomViewController");
}
@end
