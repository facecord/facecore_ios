


#import <Foundation/Foundation.h>
#import "ASIHTTPRequest.h"

@interface GJHttpDownload : NSObject <ASIHTTPRequestDelegate> {
    NSURL *_url;
    id _target;
    SEL _selector;
    NSData *_resData;
    SEL _aselector;
    id _object;
    BOOL isobj;
}
@property (retain,nonatomic) NSData *resData;

// 攘外一次调用进行网络下载 
+ (id) downloadWithUrl:(NSString *)urlstring withTarget:(id)t withSelector:(SEL)s anotherSelector:(SEL)as withType:(NSString *)type;
+ (id) downloadWithUrl:(NSString *)urlstring withTarget:(id)t withSelector:(SEL)s anotherSelector:(SEL)as withType:(NSString *)type andObject:(id)object;

- (NSData *) responseData;

+(NSUInteger)cacheSize;

+(void)setCacheTime:(NSTimeInterval)time;

#define TYPE_REFRESH @"refresh"

#define TYPE_DOWNLOAD @"download"

#define HTTP_URL @"http://api.facecore.cn/api/hello?appkey=8c1be718fa976083a6940009f36c056e"

#define PIC_HTTP @"http://192.168.31.115"

#define REALHTTP_URL @"http://115.29.32.120:8088/?msg="



@end
