//
//  BaseNavgationController.m
//  yingke
//
//  Created by zhengwenming on 2016/11/14.
//  Copyright © 2016年 zhengwenming. All rights reserved.
//

#import "BaseNavgationController.h"

@interface BaseNavgationController ()<UINavigationControllerDelegate>

@end

@implementation BaseNavgationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBar.barTintColor = [UIColor colorWithRed:27/255.0 green:209/255.0 blue:188/255.0 alpha:1.0];
    self.navigationBar.barStyle = UIBarStyleBlack;
    [self setNeedsStatusBarAppearanceUpdate];

}



-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.navigationController.viewControllers.count>0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
