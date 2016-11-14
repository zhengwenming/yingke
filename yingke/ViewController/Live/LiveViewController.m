//
//  LiveViewController.m
//  yingke
//
//  Created by zhengwenming on 2016/11/14.
//  Copyright © 2016年 zhengwenming. All rights reserved.
//

#import "LiveViewController.h"

@interface LiveViewController ()

@end

@implementation LiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *centerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    centerBtn.frame = CGRectMake(0, 0, 100, 60);
    centerBtn.center = self.view.center;
    centerBtn.backgroundColor = [UIColor redColor];
    [centerBtn setTitle:@"返回" forState:UIControlStateNormal];
    [centerBtn addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:centerBtn];
    
}
-(void)back:(UIButton *)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
