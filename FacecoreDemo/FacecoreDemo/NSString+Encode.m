//
//  NSString+Encode.m
//  FacecoreDemo
//
//  Created by Shi Wang on 14/11/24.
//  Copyright (c) 2014年 Shi Wang. All rights reserved.
//

#import "NSString+Encode.h"
#import "GJHttpDownload.h"
#import "SBJson.h"

@implementation NSString (Encode)

+ (NSString *)EncodeGBWithStr:(NSString *)str
{
    NSStringEncoding eno = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    
    NSString *resultStr = [str stringByAddingPercentEscapesUsingEncoding:eno];
    return resultStr;
    
}

+ (NSString *)getUrl:(NSDictionary *)dic
{
    NSString *strJson = [dic JSONRepresentation];
    NSString *url = [NSString EncodeGBWithStr:[NSString stringWithFormat:@"%@%@",HTTP_URL,strJson]];
    //NSString *url = [NSString stringWithFormat:@"%@%@",HTTP_URL,strJson];
    return url;
}

+ (NSDictionary *)JsonDate:(GJHttpDownload *)download
{
    id dic = [NSJSONSerialization JSONObjectWithData:[download responseData] options:NSJSONReadingMutableContainers error:nil];
    if ([dic isKindOfClass:[NSDictionary class]]) {
        NSDictionary *dic1 = (NSDictionary *)dic;
        return dic1;
    }
    return nil;
}

//+ (CGSize)getSizeWithStr:(NSString *)str Font:(UIFont *)font Width:(CGFloat)width Height:(CGFloat)height
//{
//    CGSize size = [str sizeWithFont:font constrainedToSize:CGSizeMake(width, height) lineBreakMode:NSLineBreakByCharWrapping];
//    return size;
//}


@end
