//
//  GJSigleSelectIView.m
//  iChat
//
//  Created by 高健大人辛苦了 on 13-12-27.
//  Copyright (c) 2013年 高健大人辛苦了. All rights reserved.
//

#import "GJSigleSelectIView.h"

@implementation GJSigleSelectIView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _noFootline=NO;
        _noHeadline=NO;
        
        self.backgroundColor=[UIColor clearColor];
        
        _IconView=[[UIImageView alloc]initWithFrame:CGRectMake(5.0, 10.0,14.0, 14.0)];
        _IconView.center=CGPointMake(self.width-20.0, self.height/2);
        _IconView.backgroundColor=[UIColor clearColor];
        _IconView.userInteractionEnabled=YES;
        [self addSubview:_IconView];
        
        _statusLabel=[[UILabel alloc]initWithFrame:CGRectMake(_IconView.x-80.0, 0.0, 60.0, self.height)];
        _statusLabel.center=CGPointMake(_statusLabel.center.x, self.height/2);
        _statusLabel.backgroundColor=[UIColor clearColor];
        _statusLabel.userInteractionEnabled = YES;
        _statusLabel.font=[UIFont fontWithName:MSYH size:14.0];
        _statusLabel.textColor = [YzlDevic ColorWithR:100 G:100 B:100 A:1.0];
        _statusLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_statusLabel];
        
        _infoLabel=[[UILabel alloc]initWithFrame:CGRectMake(0.0, 0.0,_statusLabel.x-10.0, self.height)];
        _infoLabel.center=CGPointMake(_infoLabel.center.x, self.height/2);
        _infoLabel.backgroundColor=[UIColor clearColor];
        _infoLabel.userInteractionEnabled = YES;
        _infoLabel.font=[UIFont fontWithName:MSYH size:14.0];
        _infoLabel.textColor = [YzlDevic ColorWithR:100 G:100 B:100 A:1.0];
        _infoLabel.textAlignment = NSTextAlignmentLeft;
        [self addSubview:_infoLabel];
        
        headline=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.width, 1)];
        headline.backgroundColor=[YzlDevic ColorWithR:223 G:222 B:219 A:1.0];
        [self addSubview:headline];
        footline=[[UIView alloc]initWithFrame:CGRectMake(0, self.height-1, self.width, 1)];
        footline.backgroundColor=[YzlDevic ColorWithR:223 G:222 B:219 A:1.0];
        [self addSubview:footline];
    }
    return self;
}

-(void)click:(UITapGestureRecognizer *)tap123
{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    tap123.cancelsTouchesInView = NO;
    [_target performSelector:_sel withObject:self withObject:_objec];
#pragma clang diagnostic pop
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.backgroundColor=[UIColor lightGrayColor];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [UIView animateWithDuration:0.3 animations:^{self.backgroundColor=[UIColor clearColor];
    } completion:nil];
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [UIView animateWithDuration:0.3 animations:^{    self.backgroundColor=[UIColor clearColor];
    } completion:nil];
}

-(void)setNoFootline:(BOOL)noFootline
{
    _noFootline=noFootline;
    headline.frame = CGRectMake(0, 0, self.width, 1);
    footline.hidden=_noFootline;
}

-(void)setNoHeadline:(BOOL)noHeadline
{
    _noHeadline=noHeadline;
    footline.frame = CGRectMake(0, self.height-1, self.width, 1);
    headline.hidden=_noHeadline;
}


@end
