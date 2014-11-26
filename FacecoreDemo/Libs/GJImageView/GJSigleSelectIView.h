//
//  GJSigleSelectIView.h
//  iChat
//
//  Created by 高健大人辛苦了 on 13-12-27.
//  Copyright (c) 2013年 高健大人辛苦了. All rights reserved.
//

#import "GJImageView.h"
//#import "YzlConst.h"

@interface GJSigleSelectIView : GJImageView
{
    UIView *headline;
    UIView *footline;
}

@property (nonatomic,strong) UIImageView *IconView;

@property (nonatomic,strong) UILabel *statusLabel;

@property (nonatomic,strong) UILabel *infoLabel;

@property (nonatomic,assign) BOOL noHeadline;

@property (nonatomic,assign) BOOL noFootline;

-(void)setNoHeadline:(BOOL)noHeadline;

-(void)setNoFootline:(BOOL)noFootline;

@end
