//
//  OptionsViewController.m
//  FaceBlock
//
//  Created by K Y on 9/13/19.
//  Copyright © 2019 K Y. All rights reserved.
//

#import "OptionsViewController.h"
#import "UIView+Utility.h"

NSString *const CELL_ID = @"optionsCell";

@interface OptionsViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation OptionsViewController

- (void)loadView {
    [super loadView];
    UIView *view = self.view;
    [view setBackgroundColor:UIColor.whiteColor];
    _tableView = [[UITableView alloc] initWithFrame:view.frame style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CELL_ID];
    _tableView.estimatedRowHeight = 200.0;
    _tableView.rowHeight = UITableViewAutomaticDimension;
    [view addFillingSubview:_tableView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Navigation

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [UITableViewCell new];
}

@end
