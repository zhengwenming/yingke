//
//  UserModel.h
//  yingke
//
//  Created by 郑文明 on 16/11/15.
//  Copyright © 2016年 zhengwenming. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject
/** 主播名 */
@property (nonatomic, strong) NSString *nick;
/** 主播头像 */
@property (nonatomic, strong) NSString *portrait;
@end
