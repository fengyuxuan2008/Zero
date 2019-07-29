//
//  ViewController.m
//  Zero
//
//  Created by apple on 2019/7/24.
//  Copyright © 2019 apple. All rights reserved.
//

#import "ViewController.h"
#import "NormalTableViewCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ViewController

- (instancetype)init{
    if (self) {
        self = [super init];
        self.tabBarItem.title = @"新闻";
        self.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/page@2x.png"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/page_selected@2x.png"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NormalTableViewCell *cell = [[NormalTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
    [cell layoutTableViewCell];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController *vc = [[UIViewController alloc]init];
    vc.view.backgroundColor = [UIColor whiteColor];
    vc.title = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
