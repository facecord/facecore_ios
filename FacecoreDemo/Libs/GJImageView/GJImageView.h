//
//  GJImageView.h
//  LimitFree
//
//  Created by 高健大人辛苦了 on 13-12-18.
//  Copyright (c) 2013年 北京千锋互联科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+GTC.h"

@class GJRatingView;


@interface GJImageView : UIImageView
{
    id _target;
    SEL _sel;
    id _objec;
}



-(void) addtarget:(id)target sel:(SEL)sel withobject:(id)objec;

@end
