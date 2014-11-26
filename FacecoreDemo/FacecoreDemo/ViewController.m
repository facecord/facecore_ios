//
//  ViewController.m
//  FacecoreDemo
//
//  Created by Shi Wang on 14/11/24.
//  Copyright (c) 2014年 Shi Wang. All rights reserved.
//

#import "ViewController.h"
#import "URLUtils.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self Config];
    
}
- (void)Config
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn1 = [[UIButton alloc]initWithFrame:CGRectMake(20.0, 100.0, self.view.width - 40.0, 100)];
    [btn1 setTitle:@"获取特征值" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn1.backgroundColor = [UIColor lightGrayColor];
    [btn1 addTarget:self action:@selector(getFeature) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    UIButton *btn2 = [[UIButton alloc]initWithFrame:CGRectMake(20.0, btn1.y+btn1.height+40.0, self.view.width - 40.0, 100)];
    [btn2 setTitle:@"对比相似度" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn2.backgroundColor = [UIColor lightGrayColor];
    [btn2 addTarget:self action:@selector(compareFeature) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0.0, btn2.y+btn2.height+80.0, self.view.width, 60.0)];
    label.text = @"FaceCore人脸识别开放平台：www.facecore.cn\nQQ群：343805354 技术支持：facecore@qq.com";
    label.textAlignment = NSTextAlignmentCenter;
    label.numberOfLines = 0;
    [self.view addSubview:label];
    
}
#pragma mark - 跳转获取特征值界面
- (void)getFeature
{
    
    GetFeatureViewController *fvc = [[GetFeatureViewController alloc]init];
    [self.navigationController pushViewController:fvc animated:YES];

    
}

#pragma mark - 跳转对比相似度界面
- (void)compareFeature
{
    CompareViewController *cvc = [[CompareViewController alloc]init];
    [self.navigationController pushViewController:cvc animated:YES];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
