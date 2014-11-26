//
//  imageModel.h
//  FacecoreDemo
//
//  Created by Shi Wang on 14/11/25.
//  Copyright (c) 2014年 Shi Wang. All rights reserved.
//

#import <Foundation/Foundation.h>
#define kHOST @" http://api.facecore.cn/api/hello?appkey=8c1be718fa976083a6940009f36c056e"
@interface URLUtils : NSObject

+ (NSURLRequest*) requestWithDictionary:(NSDictionary*) dictionary;
+ (NSString *) reqStringWithDictionary:(NSDictionary*) dictionary;

+ (NSData*) dataWithDictionary:(NSDictionary*) dictionary;
@end
