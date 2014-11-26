//
//  imageModel.h
//  FacecoreDemo
//
//  Created by Shi Wang on 14/11/25.
//  Copyright (c) 2014年 Shi Wang. All rights reserved.
//

#import "URLUtils.h"
//#import "macro.h"
@implementation URLUtils

+(NSURLRequest*) requestWithDictionary:(NSDictionary*) dictionary{
    
    NSError * error = nil;
    
    NSData* data =[NSJSONSerialization dataWithJSONObject:dictionary options:0 error:&error];
    
    NSString * json =[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    //拼接url
    NSString *url = [NSString stringWithFormat:@"%@req=%@",kHOST,json];
    
    //url转码
    NSString * escapedURL = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSLog(@"---原有转码:%@",escapedURL);
    
    NSURL * reqUrl = [[NSURL alloc]initWithString:escapedURL];
    
    
    //NSURLRequest *req = [[NSURLRequest alloc]initWithURL:reqUrl];
    
    //10s超时,缓存策略是忽略本地缓存.
    NSURLRequest * req = [NSURLRequest requestWithURL:reqUrl cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10];
    
    return req;
}

+ (NSString *) reqStringWithDictionary:(NSDictionary*) dictionary{
   
    NSError * error = nil;
    
    NSData* data =[NSJSONSerialization dataWithJSONObject:dictionary options:0 error:&error];
    
    NSString * json =[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    return json;
}

+ (NSData*) dataWithDictionary:(NSDictionary*) dictionary{
    
    NSError * error = nil;
    
    NSData* data =[NSJSONSerialization dataWithJSONObject:dictionary options:0 error:&error];
    
    NSString * json =[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    //拼接url
    NSString *url = [NSString stringWithFormat:@"req=%@",json];
    
    NSString *newurl = [url copy];
    
    //url转码
    NSString * escapedURL = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSData * data1 = [escapedURL dataUsingEncoding:NSUTF8StringEncoding];
    
    return data1;
}

@end
