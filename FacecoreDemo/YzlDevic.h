//
//  imageModel.h
//  FacecoreDemo
//
//  Created by Shi Wang on 14/11/25.
//  Copyright (c) 2014年 Shi Wang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YzlDevic : NSObject

#define kScreenVersion [YzlDevic getVersion]

#define kIosName [YzlDevic getIosName]

#define kIphoneName [YzlDevic getIphoneName]

#define kScreenWidth [YzlDevic getScreenWidth]

#define kScreenHeight [YzlDevic getScreenHeight]

#define kDateStr [YzlDevic getDate]

#define kDeviceUUID [YzlDevic getUUID]

#define PropertyString(p) @property (nonatomic,copy) NSString *p;

#define PropertyInteger(p) @property (nonatomic,assign) NSInteger p;

#define PropertyFloat(p) @property (nonatomic,assign) float p;

#define NavHeight 44.0f

#define TabBarHeight 40.0f


#define MSYH @"Microsoft YaHei"

@end
