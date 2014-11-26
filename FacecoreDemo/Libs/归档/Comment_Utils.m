//
//  Comment_Utils.m
//  mxl_iphone
//
//  Created by Tiger on 13-10-21.
//  Copyright (c) 2013年 duhujun. All rights reserved.
//

#import "Comment_Utils.h"
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"
#import "ASIHTTPRequest.h"
//#import "OpenUDID.h"
#import "SBJSON.h"
//#import "macro.h"

@implementation Comment_Utils
@synthesize delegate;


- (void)httpRequstStart:(NSString *)str andIndex:(NSInteger)index{
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:str]];
    [request setNumberOfTimesToRetryOnTimeout:10];
    [request setDelegate:self];
    request.tag = index;
    [request setDidFinishSelector:@selector(asyncDownSuccess:)];
    [request setDidFailSelector:@selector(asyncDownFail:)];
    [request startAsynchronous];
}

- (void)asyncDownSuccess:(ASIHTTPRequest *)request
{
    SBJsonParser *parser = [[SBJsonParser alloc]init];
    NSMutableDictionary *parserDic = [parser objectWithString:request.responseString];
    
    //    NSData * data = [parser objectWithString:request.responseString];
    //    NSLog(@"=== data: %@",data);
    
    [delegate asyncDownSuccess:parserDic response:request.responseString andIndex:request.tag];
}
- (void)asyncDownFail:(ASIHTTPRequest *)request{
    NSLog(@"request_failed = %@",request);
    SBJsonParser *parser = [[SBJsonParser alloc]init];
    NSMutableDictionary *parserDic = [parser objectWithString:request.responseString];
    [delegate asyncDownFail:parserDic andIndex:request.tag];
}
#pragma mark-上传图片和post
- (void)postWithAPIPath:(NSString *)apiPath
                 params:(NSMutableDictionary *) params andIndex:(NSInteger)index{
    [self postToPath:apiPath params:params andIndex:index];
}

- (void)postToPath:(NSString *)apiPath params:(NSMutableDictionary *)params andIndex:(NSInteger)index{
    
    NSString * fullURL = [kHOST stringByAppendingString:apiPath];
    [self postToUrl:fullURL params:params andIndex:index];
}

- (void)postToUrl:(NSString *)url params:(NSMutableDictionary *)params  andIndex:(NSInteger)index{
    
    [self processParams:params];
    //NSLog(@"%@",url);
    //NSLog(@"hello = %@",params);
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:url]];
    [request setPersistentConnectionTimeoutSeconds:20];
    [request setDelegate:self];
    request.tag = index;
    [request setDidFinishSelector:@selector(asyncDownSuccess:)];
    [request setDidFailSelector:@selector(asyncDownFail:)];

    for (NSString* key in [params keyEnumerator]) {
        id val = [params objectForKey:key];
        
        if ([val isKindOfClass:[NSData class]])
        {
           
            NSString *contentType = [self contentTypeForImageData:val];
            if([key isEqualToString:@"file"])
            {
                [request addData:val withFileName:[NSString stringWithFormat:@"three%@.amr",key] andContentType:@"amr" forKey:key];
            }else
            {
                [request addData:val forKey:key];
            }
            
        }
        else if ([val isKindOfClass:[UIImage class]])
        {
            NSData* imageData = UIImageJPEGRepresentation((UIImage*)val, 1);

            
            [request addData:imageData withFileName:[NSString stringWithFormat:@"three%@.jpg",key] andContentType:@"img/jpg" forKey:key];
            imageData = nil;
        }
        else
        {
            [request addPostValue:val forKey:key];
        }
    }
    
    [request startAsynchronous];
}

- (void)processParams:(NSMutableDictionary *)params {
    if (!params) {
        params = [NSMutableDictionary dictionary];
    }
}

- (NSString *)contentTypeForImageData:(NSData *)data {
    uint8_t c;
    [data getBytes:&c length:1];
    
    switch (c) {
        case 0xFF:
            return @"image/jpeg";
        case 0x89:
            return @"image/png";
        case 0x47:
            return @"image/gif";
        case 0x49:
        case 0x4D:
            return @"image/tiff";
    }
    return nil;
}

@end
