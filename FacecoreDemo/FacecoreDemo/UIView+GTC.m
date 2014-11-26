//
//  UIView+GTC.m
//  FacecoreDemo
//
//  Created by Shi Wang on 14/11/24.
//  Copyright (c) 2014年 Shi Wang. All rights reserved.
//

#import "UIView+GTC.h"

@implementation UIView (GTC)
- (float)x
{
    return self.frame.origin.x;
}

- (float)y
{
    return self.frame.origin.y;
}

- (float)width
{
    return self.bounds.size.width;
}

- (float)height
{
    return self.bounds.size.height;
}


@end
