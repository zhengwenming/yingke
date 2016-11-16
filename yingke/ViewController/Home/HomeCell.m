//
//  HomeCell.m
//  yingke
//
//  Created by 郑文明 on 16/11/15.
//  Copyright © 2016年 zhengwenming. All rights reserved.
//

#import "HomeCell.h"
#import "LiveModel.h"
#import "UserModel.h"
#define Color(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

@interface HomeCell ()
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *liveLabel;
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UILabel     *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel     *chaoyangLabel;
@property (weak, nonatomic) IBOutlet UIImageView *bigPicView;
@end


@implementation HomeCell

- (void)setModel:(LiveModel *)model
{
    _model = model;
    
    NSURL *imageUrl = [NSURL URLWithString:[NSString stringWithFormat:@"http://img.meelive.cn/%@",model.creator.portrait]];
    
    [self.headImageView sd_setImageWithURL:imageUrl placeholderImage:nil options:SDWebImageRefreshCached completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
    }];
    if (model.city.length == 0) {
        _addressLabel.text = @"难道在火星?";
    }else{
        _addressLabel.text = model.city;
    }
    
    self.nameLabel.text = model.creator.nick;
    
    [self.bigPicView sd_setImageWithURL:imageUrl placeholderImage:nil];
    
    // 设置当前观众数量
    NSString *fullChaoyang = [NSString stringWithFormat:@"%zd人在看", model.online_users];
    NSRange range = [fullChaoyang rangeOfString:[NSString stringWithFormat:@"%zd", model.online_users]];
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:fullChaoyang];
    [attr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:17] range: range];
    [attr addAttribute:NSForegroundColorAttributeName value:Color(216, 41, 116) range:range];
    self.chaoyangLabel.attributedText = attr;
}

- (void)awakeFromNib {
    // Initialization code
    _headImageView.layer.cornerRadius = 5;
    _headImageView.layer.masksToBounds = YES;
    
    _liveLabel.layer.cornerRadius = 5;
    _liveLabel.layer.masksToBounds = YES;
    [super awakeFromNib];
}

@end
