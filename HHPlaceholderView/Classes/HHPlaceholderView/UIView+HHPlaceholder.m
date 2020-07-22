//
//  UIView+HHPlaceholder.m
//  HHEmptyView
//
//  Created by 崔辉辉 on 2020/7/17.
//  Copyright © 2020 huihui. All rights reserved.
//

#import "UIView+HHPlaceholder.h"
#import "HHPlaceholderView.h"
#import <objc/runtime.h>

@implementation UIView (HHPlaceholder)
#pragma mark - Empty setter getter
static char kPlaceholderViewKey;
- (void)setPlaceholderView:(HHPlaceholderView *)placeholderView
{
    if (placeholderView != self.placeholderView) {
        objc_setAssociatedObject(self, &kPlaceholderViewKey, placeholderView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
        for (UIView *view in self.subviews) {
            if ([view isKindOfClass:[HHPlaceholderView class]]) {
                [view removeFromSuperview];
            }
        }
        [self addSubview:self.placeholderView];
        
        self.placeholderView.hidden = YES;
    }
}

- (HHPlaceholderView *)placeholderView
{
    return objc_getAssociatedObject(self, &kPlaceholderViewKey);
}

- (void)showPlaceholderView
{
    NSAssert(![self isKindOfClass:[HHPlaceholderView class]], @"HHPlaceholderView及其子类不能调用showPlaceholderView方法");
    self.placeholderView.hidden = NO;
    [self bringSubviewToFront:self.placeholderView];
}
- (void)hidePlaceholderView
{
    NSAssert(![self isKindOfClass:[HHPlaceholderView class]], @"HHPlaceholderView及其子类不能调用hidePlaceholderView方法");
    self.placeholderView.hidden = YES;
}
@end
