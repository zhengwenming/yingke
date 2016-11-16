//
//  LiveModel.h
//  yingke
//
//  Created by 郑文明 on 16/11/15.
//  Copyright © 2016年 zhengwenming. All rights reserved.
//

#import <Foundation/Foundation.h>
@class UserModel;

@interface LiveModel : NSObject
/** 直播流地址 */
@property (nonatomic, copy) NSString *stream_addr;
/** 关注人 */
@property (nonatomic, assign) NSUInteger online_users;
/** 城市 */
@property (nonatomic, copy) NSString *city;
/** 主播 */
@property (nonatomic, strong) UserModel *creator;

@end
