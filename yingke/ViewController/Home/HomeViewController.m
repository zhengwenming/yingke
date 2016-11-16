
//
//  HomeViewController.m
//  yingke
//
//  Created by zhengwenming on 2016/11/14.
//  Copyright © 2016年 zhengwenming. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeCell.h"

#import "LiveModel.h"
#import "LiveRoomViewController.h"


static NSString * const ID = @"cell";
@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>
/** 直播 */
@property(nonatomic, strong) NSMutableArray *lives;
@property(nonatomic, strong) UITableView *tableView;


@end

@implementation HomeViewController
-(UITableView *)tableView{
    if (_tableView==nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height-64-49) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.view addSubview:_tableView];
    }
    return _tableView;
}
-(void)back:(UIButton *)sender{

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 加载数据
    [self loadData];
    [self.tableView registerNib:[UINib nibWithNibName:@"HomeCell" bundle:nil] forCellReuseIdentifier:ID];
}
- (void)loadData
{
    // 映客数据url
    NSString *urlStr = @"http://116.211.167.106/api/live/aggregation?uid=133825214&interest=1";
    
    // 请求数据
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    mgr.responseSerializer = [AFJSONResponseSerializer serializer];
    mgr.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", @"text/plain",nil];
    
    [mgr GET:urlStr parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nullable responseObject) {
        
        _lives = [LiveModel mj_objectArrayWithKeyValuesArray:responseObject[@"lives"]];
        
        [self.tableView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);
        
    }];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _lives.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HomeCell *cell = (HomeCell *)[tableView dequeueReusableCellWithIdentifier:ID];
    
    cell.model = _lives[indexPath.row];
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LiveRoomViewController *liveRoomVc = [[LiveRoomViewController alloc] init];
    liveRoomVc.liveModel = _lives[indexPath.row];
    
    [self presentViewController:liveRoomVc animated:YES completion:nil];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 430;
}


@end
