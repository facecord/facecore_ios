//
//  GJBtnImageView.h
//  HappyWork
//
//  Created by 意志力文化有限公司 on 14-3-10.
//  Copyright (c) 2014年 高健大人辛苦了. All rights reserved.
//

#import "GJImageView.h"

@interface GJBtnImageView : GJImageView
{
    UIImageView *headline;
    UIView *bgView;
    UIView *headwhiteView;
    UIView *footwhiteView;
    UIColor *_bgColor;
}

@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UIImageView *logoView;
@property (nonatomic,strong) UIImageView *arrowView;
@property (nonatomic,assign) BOOL noHeadline;

- (void) setNoHeadline:(BOOL)noHeadline;

- (void) isRim:(BOOL)isrim;

- (void) changeFrame:(CGRect)frame;

- (void) header_angle;

- (void) footer_angel;

- (void) getBgColor:(UIColor *)color;
@end
