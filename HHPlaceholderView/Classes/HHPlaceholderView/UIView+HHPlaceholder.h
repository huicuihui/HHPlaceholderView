//
//  UIView+HHPlaceholder.h
//  HHEmptyView
//
//  Created by 崔辉辉 on 2020/7/17.
//  Copyright © 2020 huihui. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class HHPlaceholderView;

@interface UIView (HHPlaceholder)
@property (nonatomic, strong)HHPlaceholderView *placeholderView;

- (void)showPlaceholderView;

- (void)hidePlaceholderView;

@end

NS_ASSUME_NONNULL_END
