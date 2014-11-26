//
//  GJImageView.m
//  LimitFree
//
//  Created by 高健大人辛苦了 on 13-12-18.
//  Copyright (c) 2013年 北京千锋互联科技有限公司. All rights reserved.
//

#import "GJImageView.h"

@implementation GJImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)addtarget:(id)target sel:(SEL)sel withobject:(id)objec
{
    _target = target;
    _sel = sel;
    _objec = objec;
    
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(click:)];
    
    [self addGestureRecognizer:tap];
}

-(void)click:(UITapGestureRecognizer *)tap123
{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    [_target performSelector:_sel withObject:self withObject:_objec];
#pragma clang diagnostic pop
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
