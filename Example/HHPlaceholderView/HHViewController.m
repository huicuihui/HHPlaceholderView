//
//  HHViewController.m
//  HHPlaceholderView
//
//  Created by 805988356@qq.com on 07/22/2020.
//  Copyright (c) 2020 805988356@qq.com. All rights reserved.
//

#import "HHViewController.h"
#import "HHPlaceholderView.h"
#import "UIView+HHPlaceholder.h"
#import "UITableView+HHPlaceholder.h"
@interface HHViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSMutableArray *objects;

@end

@implementation HHViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    HHPlaceholderView *p = [[HHPlaceholderView alloc]initWithFrame:self.view.bounds];
    p.backgroundColor = [UIColor redColor];
    [self tableView];
    [self.objects addObject:@"好的方式就哭了"];
    self.tableView.placeholderView = p;
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.objects removeAllObjects];
        [self.tableView reloadData];
    });
}
#pragma mark lazy load
- (NSMutableArray *)objects {
    if (!_objects) {
        self.objects = [NSMutableArray arrayWithCapacity:0];
    }
    return _objects;
}
- (UITableView *)tableView {
    if (!_tableView) {
        self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.estimatedSectionFooterHeight = 0;
        self.tableView.estimatedRowHeight = 0;
        self.tableView.estimatedSectionHeaderHeight = 0;
        self.tableView.tableFooterView = [UIView new];
        [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        [self.view addSubview:self.tableView];
    }
    return _tableView;
}
#pragma mark tableView delegate & dataSource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objects.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = self.objects[indexPath.row];
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
