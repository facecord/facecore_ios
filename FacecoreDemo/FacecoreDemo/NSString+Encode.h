//
//  NSString+Encode.h
//  FacecoreDemo
//
//  Created by Shi Wang on 14/11/24.
//  Copyright (c) 2014年 Shi Wang. All rights reserved.
//

#import <Foundation/Foundation.h>
@class GJHttpDownload;

@interface NSString (Encode)
+ (NSString *)EncodeGBWithStr:(NSString *)str;

+ (NSString *)getUrl:(NSDictionary *)dic;

+ (NSDictionary *)JsonDate:(GJHttpDownload *)download;

//+ (CGSize)getSizeWithStr:(NSString *)str Font:(UIFont *)font Width:(CGFloat)width Height:(CGFloat)height;

@end
