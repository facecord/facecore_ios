//
//  GetFeatureViewController.h
//  FacecoreDemo
//
//  Created by Shi Wang on 14/11/25.
//  Copyright (c) 2014年 Shi Wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+GTC.h"
#import "GTMBase64.h"
#import "Comment_Utils.h"
#import "imageModel.h"
#import "coordinateModel.h"

//根据图片base64编码获取图片特征值接口
#define HTTPURL @"facedetect?appkey=8c1be718fa976083a6940009f36c056e"


@interface GetFeatureViewController : UIViewController<UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,Comment_UtilsDelegate>
{
    UIImageView *imageView ;
    UIButton *chooseBtn;
    UIButton *featureBtn;
    Comment_Utils *util;
    UIImage *image;
    BOOL isChoosePic;
    UITextView *textView;
    NSArray *arr;
    NSDictionary *modelDic;
    NSString *base64feature;
    NSString *facerectangleheight;
    NSString *facerectanglewidth;
    NSString *facerectanglex;
    NSString *facerectangley;
    NSDictionary *lefteyeDic;
    NSDictionary *mouthDic;
    NSDictionary *righteyeDic;
    NSString *leftx;
    NSString *lefty;
    NSString *mouthx;
    NSString *mouthy;
    NSString *rightx;
    NSString *righty;
    NSString *longStr;
    NSData *data;
}

@end
