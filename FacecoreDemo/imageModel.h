//
//  imageModel.h
//  FacecoreDemo
//
//  Created by Shi Wang on 14/11/25.
//  Copyright (c) 2014年 Shi Wang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YzlDevic.h"
@interface imageModel : NSObject

PropertyString(base64feature);

PropertyInteger(facerectangleheight);

PropertyInteger(facerectanglewidth);

PropertyInteger(facerectanglex);

PropertyInteger(facerectangley);

@property (nonatomic,retain)NSString* similar;

@property (nonatomic,retain)NSDictionary *leftEyeDic;

@property (nonatomic,retain)NSDictionary *mouthDic;

@property (nonatomic,retain)NSDictionary *rightDic;



@end
