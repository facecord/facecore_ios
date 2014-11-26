//
//  GetFeatureViewController.m
//  FacecoreDemo
//
//  Created by Shi Wang on 14/11/25.
//  Copyright (c) 2014年 Shi Wang. All rights reserved.
//

#import "GetFeatureViewController.h"

@interface GetFeatureViewController ()

@end

@implementation GetFeatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    util = [[Comment_Utils alloc]init];
    util.delegate = self;
    
    arr = [NSArray array];
    modelDic = [NSDictionary dictionary];
    lefteyeDic = [NSDictionary dictionary];
    modelDic = [NSDictionary dictionary];
    righteyeDic = [NSDictionary dictionary];
    isChoosePic = NO;
    [self UIConfig];
    
    // Do any additional setup after loading the view.
}

- (void)UIConfig
{

    self.view.backgroundColor = [UIColor whiteColor];
    
    image = [[UIImage alloc]init];
    
    imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0.0, 64.0, self.view.width, 300.0)];
    imageView.image = [UIImage imageNamed:@"camara.png"];
    [self.view addSubview:imageView];
    
    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(0.0, imageView.y+imageView.height+20.0, self.view.width, 40.0)];
    label1.text = @"请保持人像垂直！";
    label1.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label1];
    
    chooseBtn = [[UIButton alloc]initWithFrame:CGRectMake(10.0, label1.y+label1.height+10.0, self.view.width-20.0, 40.0)];
    [chooseBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    chooseBtn.backgroundColor = [UIColor lightGrayColor];
    [chooseBtn setTitle:@"选择照片" forState:UIControlStateNormal];
    [chooseBtn addTarget:self action:@selector(choosePic) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:chooseBtn];
    
    featureBtn = [[UIButton alloc]initWithFrame:CGRectMake(10.0, chooseBtn.y+chooseBtn.height+20.0, self.view.width-20.0, 40.0)];
    [featureBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    featureBtn.backgroundColor = [UIColor lightGrayColor];
    [featureBtn setTitle:@"获取特征值" forState:UIControlStateNormal];
    [featureBtn addTarget:self action:@selector(getFeature) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:featureBtn];



    textView = [[UITextView alloc]initWithFrame:CGRectMake(featureBtn.x, featureBtn.y+featureBtn.height+10.0, featureBtn.width, self.view.height - featureBtn.y -featureBtn.height - 20.0)];
    [self.view addSubview:textView];

}
#pragma mark - 选择照片
- (void)choosePic
{
    UIActionSheet *sheet = [[UIActionSheet alloc]initWithTitle:@"请选择获取图片方式" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"相机" otherButtonTitles:@"相册", nil];
    [sheet showInView:[UIApplication sharedApplication].keyWindow];

}

#pragma mark - 获取特征值
- (void)getFeature
{
    if (isChoosePic)
    {
        data = UIImageJPEGRepresentation(imageView.image, 1.0);
        data = [GTMBase64 encodeData:data];
        NSString *base64 = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    
//post网络请求
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
    
    dispatch_async(queue, ^{
        
        NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
        
        
        [dic setValue:base64 forKey:@"faceimage"];
        
        
        [util postWithAPIPath:HTTPURL params:dic andIndex:1];
    });
    }else
    {
        UIAlertView *av = [[UIAlertView alloc]initWithTitle:@"请选择照片" message:nil delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil, nil];
        
        [av show];
    }
}


-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    if (buttonIndex == 0)
    {
        //通过拍照获取图片点击事件
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc]init];
        imagePicker.delegate = self;
        [imagePicker setSourceType:UIImagePickerControllerSourceTypeCamera];
        [self presentViewController:imagePicker animated:YES completion:nil];
    }else if (buttonIndex == 1)
    {
        //通过相册获取图片点击事件
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc]init];
        imagePicker.delegate = self;
        [imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
        [self presentViewController:imagePicker animated:YES completion:nil];
    
    }


}
#pragma mark - 照片选择器代理获得图片
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    isChoosePic = YES;
    image = [info objectForKey:UIImagePickerControllerOriginalImage];
    imageView.image = image;

    [picker dismissViewControllerAnimated:YES completion:nil];

}
#pragma mark - post网络请求代理
- (void)asyncDownSuccess:(NSMutableDictionary *)responseDic response:(NSString *)responseStr andIndex:(NSInteger)index
{
    if (index==1) {
        NSLog(@"responseDic=======%@",responseDic);
        arr = [responseDic objectForKey:@"facemodels"];
        modelDic = [arr objectAtIndex:0];
        base64feature = [modelDic objectForKey:@"base64feature"];
        facerectangleheight = [modelDic objectForKey:@"facerectangleheight"];
        facerectanglewidth = [modelDic objectForKey:@"facerectanglewidth"];
        facerectanglex = [modelDic objectForKey:@"facerectanglex"];
        facerectangley = [modelDic objectForKey:@"facerectangley"];
        lefteyeDic = [modelDic objectForKey:@"lefteye"];
        mouthDic = [modelDic objectForKey:@"mouth"];
        righteyeDic = [modelDic objectForKey:@"righteye"];
        leftx = [lefteyeDic objectForKey:@"x"];
        lefty = [lefteyeDic objectForKey:@"y"];
        mouthx = [mouthDic objectForKey:@"x"];
        mouthy = [mouthDic objectForKey:@"y"];
        rightx = [righteyeDic objectForKey:@"x"];
        righty = [righteyeDic objectForKey:@"y"];
        longStr = [NSString stringWithFormat:@"base64feature = %@,\nfacerectangleheight = %@,\nfacerectanglewidth = %@,\nfacerectanglex = %@,\nfacerectangley = %@,\nlefteye.x = %@,\nlefteye.y = %@,\nmouth.x = %@,\nmouth.y = %@,\nrighteye.x = %@,\nrighteye.y = %@,\n",base64feature,facerectangleheight,facerectanglewidth,facerectanglex,facerectangley,leftx,lefty,mouthx,mouthy,rightx,righty];
        textView.text = longStr;
        
        
    }else
    {
        
        NSLog(@"出错");
    }
    
}

- (void)asyncDownFail:(NSMutableDictionary *)responseDic andIndex:(NSInteger)index
{
    NSLog(@"网络异常");
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
