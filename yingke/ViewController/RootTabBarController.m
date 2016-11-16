
//
//  RootTabBarController.m
//  yingke
//
//  Created by zhengwenming on 2016/11/14.
//  Copyright © 2016年 zhengwenming. All rights reserved.
//

#import "RootTabBarController.h"
#import "BaseNavgationController.h"
#import "HomeViewController.h"
#import "LiveViewController.h"
#import "MineViewController.h"

@interface RootTabBarController ()

@end

@implementation RootTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpVC];
    [self setUpAllTarBarButton];
    [self setUpTabBarBackgroundImage];
    [self addCameraButton];
}

//添加视频采集按钮
- (void)addCameraButton
{
    
    UIButton *cameraBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [cameraBtn setImage:[UIImage imageNamed:@"tab_launch"] forState:UIControlStateNormal];
    [cameraBtn setImage:[UIImage imageNamed:@"tab_launch"] forState:UIControlStateHighlighted];
    
    //自适应,自动根据按钮图片和文字计算按钮尺寸
    [cameraBtn sizeToFit];
    
    cameraBtn.center = CGPointMake(self.tabBar.frame.size.width * 0.5, self.tabBar.frame.size.height * 0.5 + 5);
    [cameraBtn addTarget:self action:@selector(clickCameraBtn) forControlEvents:UIControlEventTouchUpInside];
    
    [self.tabBar addSubview:cameraBtn];
    
}

- (void)clickCameraBtn
{

    [self presentViewController:[LiveViewController new] animated:YES completion:nil];
}

//设置tabBar背景图片
- (void)setUpTabBarBackgroundImage
{
    UIImage *image = [UIImage imageNamed:@"tab_bg"];
    CGFloat top = 40;
    CGFloat bottom = 40;
    CGFloat left = 100;
    CGFloat right = 100;
    UIEdgeInsets insets = UIEdgeInsetsMake(top, left, bottom, right);
    UIImage *tabBarImage = [image resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch];
    
    self.tabBar.backgroundImage = tabBarImage;
    
    [[UITabBar appearance] setShadowImage:[UIImage new]];
    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc] init]];
}

//自定义TabBar高度
- (void)viewWillLayoutSubviews
{
    CGRect tabFrame = self.tabBar.frame;
    tabFrame.size.height = 60;
    tabFrame.origin.y = self.view.frame.size.height - 60;
    self.tabBar.frame = tabFrame;
}

//设置tabBar上的按钮
- (void)setUpAllTarBarButton
{
    HomeViewController *homeVC = self.childViewControllers[0];
    homeVC.tabBarItem.image = [UIImage imageNamed:@"tab_live"];
    homeVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"tab_live_p"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    LiveViewController *liveVC = self.childViewControllers[1];
    liveVC.tabBarItem.enabled = NO;
    
    MineViewController *mineVC = self.childViewControllers[2];
    mineVC.tabBarItem.image = [UIImage imageNamed:@"tab_me"];
    mineVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"tab_me_p"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //调整TabBarItem位置
    UIEdgeInsets insets = UIEdgeInsetsMake(10, 0, -10, 0);
    UIEdgeInsets cameraInsets = UIEdgeInsetsMake(6, 0, -6, 0);
    
    homeVC.tabBarItem.imageInsets = insets;
    liveVC.tabBarItem.imageInsets = cameraInsets;
    mineVC.tabBarItem.imageInsets = insets;
    
    //隐藏阴影线
    [[UITabBar appearance] setShadowImage:[UIImage new]];
    [[UITabBar appearance] setBackgroundImage:[UIImage new]];
}

//添加子控制器
- (void)setUpVC
{
    //首页
    HomeViewController *homeVC = [[HomeViewController alloc] init];
    BaseNavgationController *homeNav = [[BaseNavgationController alloc] initWithRootViewController:homeVC];
    [self addChildViewController:homeNav];
    //直播
    LiveViewController *liveVC = [[LiveViewController alloc] init];
    BaseNavgationController *LiveNav = [[BaseNavgationController alloc] initWithRootViewController:liveVC];
    [self addChildViewController:LiveNav];
    //我的
    MineViewController *mineVC = [[MineViewController alloc] init];
    BaseNavgationController *mineNav = [[BaseNavgationController alloc] initWithRootViewController:mineVC];
    [self addChildViewController:mineNav];
}

@end
