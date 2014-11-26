//
//  Comment_Utils.h
//  mxl_iphone
//
//  Created by Tiger on 13-10-21.
//  Copyright (c) 2013年 duhujun. All rights reserved.
//

#import <Foundation/Foundation.h>
//#define kHOST @"http://api.facecore.cn/api/facedetect?appkey=8c1be718fa976083a6940009f36c056e&faceimage="

#define kHOST @"http://api.facecore.cn/api/"
//hello?appkey=8c1be718fa976083a6940009f36c056e   facedetect
@protocol Comment_UtilsDelegate <NSObject>

- (void)asyncDownSuccess:(NSMutableDictionary *)responseDic response:(NSString *)responseStr andIndex:(NSInteger)index;
- (void)asyncDownFail:(NSMutableDictionary *)responseDic andIndex:(NSInteger)index;;

@end

@interface Comment_Utils : NSObject

@property (nonatomic, retain) id<Comment_UtilsDelegate>delegate;

- (void)httpRequstStart:(NSString *)str andIndex:(NSInteger)index;
- (void)postWithAPIPath:(NSString *)apiPath
                 params:(NSMutableDictionary *) params andIndex:(NSInteger)index;

@end
