//
//  ViewController.m
//  Zero
//
//  Created by apple on 2019/7/24.
//  Copyright © 2019 apple. All rights reserved.
//

#import "NewsViewController.h"
#import "NormalTableViewCell.h"
#import "DetailViewController.h"
#import "DeleteCellView.h"
#import "ListLoader.h"
#import "ListItem.h"
@interface NewsViewController ()<UITableViewDelegate,UITableViewDataSource,NormalTableViewCellDelegate>
@property(nonatomic, strong, readwrite)UITableView *tableView;
@property(nonatomic, strong, readwrite)NSArray *dataArray;
@property(nonatomic, strong, readwrite)ListLoader *listLoader;
@end

@implementation NewsViewController
#pragma mark - life cycle
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
    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    self.listLoader = [[ListLoader alloc]init];
    __weak typeof(self)weakSelf = self;
    
    [self.listLoader loadListDataWithFinishBlock:^(BOOL success, NSArray<ListItem *> * _Nonnull dataArray) {
         __strong typeof(self)strongSelf = weakSelf;
        strongSelf.dataArray = dataArray;
        [strongSelf.tableView reloadData];
    }];
}
#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NormalTableViewCell *cell = [[NormalTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
    [cell layoutTableViewCellWithItem:[self.dataArray objectAtIndex:indexPath.row]];
    cell.delegate = self;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ListItem *item = [self.dataArray objectAtIndex:indexPath.row];
    DetailViewController *vc = [[DetailViewController alloc]initWithUrlString:item.articleUrl];
    vc.view.backgroundColor = [UIColor whiteColor];
    vc.title = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
    
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:item.uniquekey];
}
- (void)tableViewCell: (UITableViewCell*)tableViewCell clickDeleteButton: (UIButton *)deleteButton{
    DeleteCellView *deleteView = [[DeleteCellView alloc]initWithFrame:self.view.bounds];
    
    //转换坐标系，deleteButton相对于tableViewCell的位置转换为相对于window的位置
    CGRect rect = [tableViewCell convertRect:deleteButton.frame toView:nil];
    
    __weak typeof(self)weakSelf = self;
    
    [deleteView showDeleteCellViewFromPoint:rect.origin clickBlock:^{
        
        __strong typeof(self)strongSelf = weakSelf;
        //删除cell
       [strongSelf.tableView deleteRowsAtIndexPaths:@[[strongSelf.tableView indexPathForCell:tableViewCell]] withRowAnimation:UITableViewRowAnimationAutomatic];
        
        
        [deleteView dismissDeleteCellView];
    }];
}

@end
