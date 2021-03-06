


#import "GJHttpDownload.h"
#import "ASIHTTPRequest.h"
#import "NSString+Hashing.h"

static NSMutableArray *_arr;

@implementation GJHttpDownload
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
// 每一个QFHttpDownload就是一个网络连接....
// ASI
- (id) initWithUrl:(NSString *)urlstring withTarget:(id)t withSelector:(SEL)s anotherSelector:(SEL)as withType:(NSString *)type{
    self = [super init];
    if (self) {
        _url = [NSURL URLWithString:urlstring];
        _target = t;
        _selector = s;
        _aselector=as;
        isobj = NO;
        NSData *data=[self readDataFromFileByUrl:urlstring];
        if ([type isEqualToString:TYPE_DOWNLOAD]) {
            if (data) {
                self.resData=data;
                [_target performSelector:_selector withObject:self];
                return self;
            }else{
                
            }
        }else if([type isEqualToString:TYPE_REFRESH])
        {
            
        }
        if ([type isEqualToString:@"yincang"]) {
            [ASIHTTPRequest setShouldUpdateNetworkActivityIndicator:NO];
        }
        ASIHTTPRequest *r = [ASIHTTPRequest requestWithURL:_url];
        r.delegate = self;
        [r startAsynchronous];
        // 这里是管理这个连接...
        if (_arr == nil) {
            _arr = [[NSMutableArray alloc] init];
        }
        [_arr addObject:self];
        [_arr addObject:_target];
    }
    return self;
}

-(void)requestFailed:(ASIHTTPRequest *)request
{
    if (_aselector) {
        UIAlertView *warn = [[UIAlertView alloc]initWithTitle:@"网络连接失败,请检查你的网络是否已连接" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [warn show];
        [_target performSelector:_aselector];
    }else
        return;
}

- (void) requestFinished:(ASIHTTPRequest *)request {
    _resData = [request responseData];
    // 这里asi执行完成 然后调用...
    /*
     [QFHttpDownload downloadWithUrl:s withTarget:self withSelector:@selector(downloadFinish:)];
     _selector =@selector(downloadFinish:)
     */
    if (isobj) {
        [_target performSelector:_selector withObject:self withObject:_object];
    }else
    {
        [_target performSelector:_selector withObject:self];
    }
    [self saveUrl:request.url.absoluteString withData:self.resData];
}

- (id) initWithUrl:(NSString *)urlstring withTarget:(id)t withSelector:(SEL)s anotherSelector:(SEL)as withType:(NSString *)type andObject:(id)object
{
    self = [super init];
    if (self) {
        _url = [NSURL URLWithString:urlstring];
        _target = t;
        _selector = s;
        _aselector = as;
        _object = object;
        isobj = YES;
        NSData *data=[self readDataFromFileByUrl:urlstring];
        if ([type isEqualToString:TYPE_DOWNLOAD]) {
            if (data) {
                self.resData=data;
                [_target performSelector:_selector withObject:self];
                return self;
            }else{
                
            }
        }else if([type isEqualToString:TYPE_REFRESH])
        {
            
        }
        if ([type isEqualToString:@"yincang"]) {
            [ASIHTTPRequest setShouldUpdateNetworkActivityIndicator:NO];
        }
        ASIHTTPRequest *r = [ASIHTTPRequest requestWithURL:_url];
        r.delegate = self;
        [r startAsynchronous];
        // 这里是管理这个连接...
        if (_arr == nil) {
            _arr = [[NSMutableArray alloc] init];
        }
        [_arr addObject:self];
        [_arr addObject:_target];
    }
    return self;
}

+(NSUInteger)cacheSize
{
    NSString *dir=[NSHomeDirectory() stringByAppendingFormat:@"%@",@"/Library/Caches/GJCache"];
    NSArray *allFiles=[[NSFileManager defaultManager]contentsOfDirectoryAtPath:dir error:nil];
    NSUInteger allSize=0;
    for (NSString *file in allFiles) {
        if ([file hasPrefix:@"."]) {
            continue;
        }
        NSString *absFile=[NSString stringWithFormat:@"%@/%@",dir,file];
        NSUInteger size=[self getfileSize:absFile];
        allSize+=size;
    }
    return allSize;
}

+(NSUInteger)getfileSize:(NSString *)path{
    NSDictionary *dic=[[NSFileManager defaultManager]attributesOfItemAtPath:path error:nil];
    NSUInteger size=[[dic objectForKey:NSFileSize] integerValue];
    return size;
}

static NSTimeInterval maxTimeout=1*60*60;
+(void)setCacheTime:(NSTimeInterval)time
{
    if(time<0)return;
    maxTimeout=time;
}

-(NSTimeInterval)getFileLastModifyTime:(NSString *)path
{
    NSDictionary *dic=[[NSFileManager defaultManager]attributesOfItemAtPath:path error:nil];
    NSDate *date=[dic objectForKey:NSFileModificationDate];
    return [date timeIntervalSince1970];
}

-(void)saveUrl:(NSString *)urlstring withData:(NSData *)data
{
    NSString *md5=[urlstring MD5Hash];
    NSString *dir=[NSHomeDirectory() stringByAppendingFormat:@"%@",@"/Library/Caches/GJCache"];
    //NSLog(@"path=====%@",dir);
    //在dir路径上创建一个GJCache文件夹
    [[NSFileManager defaultManager]createDirectoryAtPath:dir withIntermediateDirectories:YES attributes:nil error:nil];
    
    NSString *path=[NSString stringWithFormat:@"%@/%@",dir,md5];
    //把NSData写入到文件path中
    [data writeToFile:path atomically:YES];
}

- (NSData *) readDataFromFileByUrl:(NSString *)url {
    NSString *md5=[url MD5Hash];
    NSString *dir=[NSHomeDirectory() stringByAppendingFormat:@"%@",@"/Library/Caches/GJCache"];
    
    NSString *path=[NSString stringWithFormat:@"%@/%@",dir,md5];
    
    NSTimeInterval now=[[NSDate date] timeIntervalSince1970];
    NSTimeInterval fileTime=[self getFileLastModifyTime:path];
    if (now-fileTime>maxTimeout) {
        return nil;
    }
    return [NSData dataWithContentsOfFile:path];
}


// 今天是不带缓存...
+ (id) downloadWithUrl:(NSString *)urlstring withTarget:(id)t withSelector:(SEL)s anotherSelector:(SEL)as withType:(NSString *)type{
    
    return [[[self class] alloc] initWithUrl:urlstring withTarget:t withSelector:s anotherSelector:as withType:(NSString *)type];
}
- (NSData *) responseData {
    return _resData;
}

+ (id)downloadWithUrl:(NSString *)urlstring withTarget:(id)t withSelector:(SEL)s anotherSelector:(SEL)as withType:(NSString *)type andObject:(id)object
{
    return [[[self class] alloc] initWithUrl:urlstring withTarget:t withSelector:s anotherSelector:as withType:type andObject:object];
}

#pragma clang diagnostic pop

@end
