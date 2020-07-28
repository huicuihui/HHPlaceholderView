//
//  UITableView+HHPlaceholder.m
//  HHPlaceholderView
//
//  Created by 崔辉辉 on 2020/7/28.
//

#import "UITableView+HHPlaceholder.h"
#import <objc/runtime.h>
#import "UIView+HHPlaceholder.h"
@implementation UITableView (HHPlaceholder)
+ (void)load
{
    Method originMethod = class_getInstanceMethod(self, @selector(reloadData));
    Method currentMethod = class_getInstanceMethod(self, @selector(hh_reloadData));
    method_exchangeImplementations(originMethod, currentMethod);
}

- (void)hh_reloadData
{
    [self hh_reloadData];
    [self setUpPlaceholderView];
}

- (void)setUpPlaceholderView
{
    id<UITableViewDataSource> dataSource = self.dataSource;
    NSInteger section = ([dataSource respondsToSelector:@selector(numberOfSectionsInTableView:)] ? [dataSource numberOfSectionsInTableView:self] : 1);
    NSInteger rows = 0;
    for (NSInteger i = 0; i < section; i++) {
        rows += [dataSource tableView:self numberOfRowsInSection:section];
    }
    if (!rows) {
        //添加placeholderView
        [self showPlaceholderView];
    } else {
        [self hidePlaceholderView];
    }
}
@end
