//
//  GJBtnImageView.m
//  HappyWork
//
//  Created by 意志力文化有限公司 on 14-3-10.
//  Copyright (c) 2014年 高健大人辛苦了. All rights reserved.
//

#import "GJBtnImageView.h"
#import "YzlConst.h"

@implementation GJBtnImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        //[self makeCorner:3.0];
        
        //        headwhiteView = [[UIView alloc]init];
        //        footwhiteView = [[UIView alloc]init];
        //        bgView = [[UIView alloc]initWithFrame:CGRectMake(1.0, 1.0, self.width-2.0, self.height-2.0)];
        //        //[bgView makeCorner:2.0];
        //        bgView.backgroundColor = [UIColor whiteColor];
        //        bgView.hidden = NO;
        //        [self addSubview:bgView];
        
        self.backgroundColor = [YzlDevic ColorWithR:151 G:151 B:151 A:1.0];
        
        _arrowView = [[UIImageView alloc]initWithFrame:CGRectMake(self.width-20.0, 0.0, 12.0, 20.0)];
        _arrowView.center = CGPointMake(_arrowView.center.x, self.height/2);
        [self addSubview:_arrowView];
        
        _logoView = [[UIImageView alloc]initWithFrame:CGRectMake(10.0, _arrowView.y, 23.0, 22.0)];
        [self addSubview:_logoView];
        
        _nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(_logoView.x+_logoView.width+5.0, 0.0, _arrowView.x-_logoView.x-_logoView.width-5.0, self.height)];
        _nameLabel.backgroundColor = [UIColor clearColor];
        _nameLabel.textColor = [UIColor blackColor];
        _nameLabel.font = [UIFont fontWithName:MSYH size:18.0];
        _nameLabel.textAlignment = NSTextAlignmentLeft;
        [self addSubview:_nameLabel];
        
        headline=[[UIImageView alloc]initWithFrame:CGRectMake(0.0, 0.0, self.width, 2.0)];
        headline.backgroundColor=[YzlDevic ColorWithR:223 G:222 B:219 A:1.0];
        headline.hidden = YES;
        headline.image = [UIImage NameWithContentFile:@"xuline.png"];
        [self addSubview:headline];
        
    }
    return self;
}

-(void)click:(UITapGestureRecognizer *)tap
{
    tap.cancelsTouchesInView=NO;
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    [_target performSelector:_sel withObject:self withObject:_objec];
#pragma clang diagnostic pop
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.1];
    self.backgroundColor = _bgColor;
    bgView.backgroundColor=[UIColor whiteColor];
    footwhiteView.backgroundColor = bgView.backgroundColor;
    headwhiteView.backgroundColor = bgView.backgroundColor;
    [UIView commitAnimations];
    //NSLog(@"ended");
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //NSLog(@"began");
    self.backgroundColor = [UIColor lightGrayColor];
    bgView.backgroundColor=[UIColor lightGrayColor];
    footwhiteView.backgroundColor = bgView.backgroundColor;
    headwhiteView.backgroundColor = bgView.backgroundColor;
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    //NSLog(@"cancel");
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    self.backgroundColor = _bgColor;
    footwhiteView.backgroundColor = bgView.backgroundColor;
    headwhiteView.backgroundColor = bgView.backgroundColor;
    [UIView commitAnimations];
}

- (void)getBgColor:(UIColor *)color
{
    _bgColor = color;
    self.backgroundColor = color;
    
}

-(void)setNoHeadline:(BOOL)noHeadline
{
    _noHeadline=noHeadline;
    headline.hidden=_noHeadline;
}

-(void)isRim:(BOOL)isrim
{
    self.backgroundColor = [UIColor whiteColor];
}

-(void)changeFrame:(CGRect)frame
{
    self.frame = frame;
    bgView.frame = CGRectMake(1.0, 1.0, self.width-2.0, self.height-2.0);
}

- (void) header_angle
{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(self.x, self.y, self.width, 4.0)];
    view.backgroundColor = self.backgroundColor;
    
    headwhiteView.frame = CGRectMake(1.0,
                                     1.0, view.width-2.0, view.height-1.0);
    headwhiteView.backgroundColor = [UIColor whiteColor];
    [self.superview addSubview:view];
    [view addSubview:headwhiteView];
}

- (void) footer_angel
{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(self.x, self.y+self.height-4.0, self.width, 4.0)];
    [view makeCorner:0.0];
    view.backgroundColor = self.backgroundColor;
    
    footwhiteView.frame = CGRectMake(1.0, 0.0, view.width-2.0, view.height-1.0);
    footwhiteView.backgroundColor = [UIColor whiteColor];
    [self.superview addSubview:view];
    [view addSubview:footwhiteView];
    
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

@end
