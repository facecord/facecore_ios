//
//  compareViewController.h
//  FacecoreDemo
//
//  Created by Shi Wang on 14/11/25.
//  Copyright (c) 2014年 Shi Wang. All rights reserved.
//

#import "ViewController.h"
#import "Comment_Utils.h"
#import "GTMBase64.h"


//根据两张图片base64编码对比，获取相似度接口
#define HTTPURL1 @"facedetectandcompare?appkey=8c1be718fa976083a6940009f36c056e"

@interface CompareViewController : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate,Comment_UtilsDelegate>
{

    UIImageView *imageView1;
    UIImageView *imageView2;
    UIButton *btn1;
    UIButton *btn2;
    UIButton *compareBtn;
    UIImagePickerController *picker1;
    UIImagePickerController *picker2;
    UIImage *image;
    Comment_Utils *util;
    UILabel *similarLabel;
    NSData *data1;
    NSData *data2;
}

@end
