//
//  compareViewController.m
//  FacecoreDemo
//
//  Created by Shi Wang on 14/11/25.
//  Copyright (c) 2014年 Shi Wang. All rights reserved.
//

#import "compareViewController.h"

@interface CompareViewController ()

@end

@implementation CompareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    util = [[Comment_Utils alloc]init];
    util.delegate = self;
    
    
    picker1 = [[UIImagePickerController alloc]init];
    picker2 = [[UIImagePickerController alloc]init];
    [self UICofig];
    // Do any additional setup after loading the view.
}


- (void)UICofig
{
    self.view.backgroundColor = [UIColor whiteColor];
    image = [[UIImage alloc]init];
    
    imageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(0.0, 64.0, self.view.width/2-5.0, 300.0)];
    imageView1.image = [UIImage imageNamed:@"camara.png"];
    [self.view addSubview:imageView1];
    
    
    imageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(self.view.width/2+5.0, 64.0, self.view.width/2-5.0, 300.0)];
    imageView2.image = [UIImage imageNamed:@"camara.png"];
    [self.view addSubview:imageView2];
    
    
    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(0.0, imageView1.y+imageView1.height+20.0, self.view.width, 40.0)];
    label1.text = @"请保持人像垂直！";
    label1.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label1];
    
    btn1 = [[UIButton alloc]initWithFrame:CGRectMake(10.0, label1.y+label1.height+10.0, (self.view.width-30.0)/2, 40.0)];
    [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn1.backgroundColor = [UIColor lightGrayColor];
    [btn1 setTitle:@"选择照片1" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(choosePic1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    btn2 = [[UIButton alloc]initWithFrame:CGRectMake(self.view.width/2+5.0, label1.y+label1.height+10.0, (self.view.width-30.0)/2, 40.0)];
    [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn2.backgroundColor = [UIColor lightGrayColor];
    [btn2 setTitle:@"选择照片2" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(choosePic2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
    compareBtn = [[UIButton alloc]initWithFrame:CGRectMake(10.0, btn1.y+btn1.height+10.0, self.view.width-20.0, 40.0)];
    [compareBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    compareBtn.backgroundColor = [UIColor lightGrayColor];
    [compareBtn setTitle:@"获取相似度" forState:UIControlStateNormal];
    [compareBtn addTarget:self action:@selector(getFeature) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:compareBtn];


    similarLabel = [[UILabel alloc]initWithFrame:CGRectMake(0.0, compareBtn.y+compareBtn.height+20.0, self.view.width, 40.0)];
    similarLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:similarLabel];
    
   
}
#pragma mark - 选择照片1
- (void)choosePic1
{
    picker1.delegate = self;
    [self presentViewController:picker1 animated:YES completion:nil];
}

#pragma mark - 选择照片2
- (void)choosePic2
{
    picker2.delegate = self;
    [self presentViewController:picker2 animated:YES completion:nil];
}

#pragma mark - 根据两张照片的base64编码进行相似度对比
- (void)getFeature
{
    data1 = UIImageJPEGRepresentation(imageView1.image, 1.0);
    data1 = [GTMBase64 encodeData:data1];
    NSString *onebBase64 = [[NSString alloc]initWithData:data1 encoding:NSUTF8StringEncoding];
    
    
    data2 = UIImageJPEGRepresentation(imageView2.image, 1.0);
    data2 = [GTMBase64 encodeData:data2];
    NSString *twobBase64 = [[NSString alloc]initWithData:data2 encoding:NSUTF8StringEncoding];
//post请求数据
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
    
    dispatch_async(queue, ^{
        
        NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
        
        
        [dic setValue:onebBase64 forKey:@"faceimage1"];
        [dic setValue:twobBase64 forKey:@"faceimage2"];
        
        [util postWithAPIPath:HTTPURL1 params:dic andIndex:1];
    });
}

#pragma mark - post请求数据走的代理方法
- (void)asyncDownSuccess:(NSMutableDictionary *)responseDic response:(NSString *)responseStr andIndex:(NSInteger)index
{
    if (index==1) {
        NSLog(@"responseDic=======%@",responseDic);
        NSString *similarStr = [responseDic objectForKey:@"similar"];
        similarLabel.text = [NSString stringWithFormat:@"相似度位:%@",similarStr];
        
    }else
    {
        
        NSLog(@"出错");
    }
    
}

- (void)asyncDownFail:(NSMutableDictionary *)responseDic andIndex:(NSInteger)index
{
    NSLog(@"网络异常");
}

#pragma mark - 照片选择器，获取图片
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    if (picker ==picker1) {
        image = [info objectForKey:UIImagePickerControllerOriginalImage];
        imageView1.image = image;
    }else
    {
        image = [info objectForKey:UIImagePickerControllerOriginalImage];
        imageView2.image = image;
    
    }
    [picker dismissViewControllerAnimated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
