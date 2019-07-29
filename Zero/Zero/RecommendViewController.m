//
//  RecommendViewController.m
//  Zero
//
//  Created by apple on 2019/7/27.
//  Copyright © 2019 apple. All rights reserved.
//

#import "RecommendViewController.h"

@interface RecommendViewController ()

@end

@implementation RecommendViewController

- (instancetype)init{
    if (self) {
        self = [super init];
        self.tabBarItem.title = @"推荐";
        self.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/like@2x.png"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/like_selected@2x.png"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    scrollView.contentSize = CGSizeMake(self.view.bounds.size.width * 5, self.view.bounds.size.height);
    scrollView.pagingEnabled = YES;
    
    NSArray *colorArray = @[[UIColor redColor],[UIColor yellowColor],[UIColor blueColor],[UIColor grayColor],[UIColor greenColor]];
    
    for (int i = 0; i < 5; i++) {
        [scrollView addSubview: ({
            UIView *view = [[UIView alloc]initWithFrame:CGRectMake(scrollView.bounds.size.width * i, 0, scrollView.bounds.size.width, scrollView.bounds.size.height)];
            view.backgroundColor = colorArray[i];
            view;
        })];
        
    }
    [self.view addSubview:scrollView];
}



@end
