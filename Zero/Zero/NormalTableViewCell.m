//
//  NormalTableViewCell.m
//  Zero
//
//  Created by apple on 2019/7/29.
//  Copyright © 2019 apple. All rights reserved.
//

#import "NormalTableViewCell.h"
#import "ListItem.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <SDWebImage/UIView+WebCache.h>
@interface NormalTableViewCell()
@property(nonatomic, strong, readwrite)UILabel *titleLabel;
@property(nonatomic, strong, readwrite)UILabel *sourceLabel;
@property(nonatomic, strong, readwrite)UILabel *commentLabel;
@property(nonatomic, strong, readwrite)UILabel *timeLabel;

@property(nonatomic, strong, readwrite)UIImageView *rightImageView;
@property(nonatomic, strong, readwrite)UIButton *deleteButton;
@end

@implementation NormalTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self) {
        self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
        [self.contentView addSubview:({
            self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 15, 270, 50)];
            self.titleLabel.font = [UIFont systemFontOfSize:16];
            self.titleLabel.textColor = [UIColor blackColor];
            self.titleLabel.numberOfLines = 2;
            self.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
            self.titleLabel;
        })];
        
        [self.contentView addSubview:({
            self.sourceLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 70, 50, 20)];
            self.sourceLabel.font = [UIFont systemFontOfSize:12];
            self.sourceLabel.textColor = [UIColor grayColor];
            self.sourceLabel;
        })];
        
        [self.contentView addSubview:({
            self.commentLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 70, 50, 20)];
            self.commentLabel.font = [UIFont systemFontOfSize:12];
            self.commentLabel.textColor = [UIColor grayColor];
            self.commentLabel;
        })];
        
        [self.contentView addSubview:({
            self.timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(160, 70, 50, 20)];
            self.timeLabel.font = [UIFont systemFontOfSize:12];
            self.timeLabel.textColor = [UIColor grayColor];
            self.timeLabel;
        })];
        
        [self.contentView addSubview:({
            self.rightImageView = [[UIImageView alloc]initWithFrame:CGRectMake(300, 15, 100, 70)];
            self.rightImageView;
        })];
        
//        [self.contentView addSubview:({
//            self.deleteButton = [[UIButton alloc]initWithFrame:CGRectMake(260, 80, 30, 20)];
//            self.deleteButton.backgroundColor = [UIColor blueColor];
//            [self.deleteButton setTitle:@"X" forState:UIControlStateNormal];
//            [self.deleteButton setTitle:@"V" forState:UIControlStateHighlighted];
//            [self.deleteButton addTarget:self action:@selector(deleteButtonClick) forControlEvents:UIControlEventTouchUpInside];
//            self.deleteButton;
//        })];
    }
    return self;
}

- (void)layoutTableViewCellWithItem:(ListItem *)item{
    
    BOOL hasRead = [[NSUserDefaults standardUserDefaults] boolForKey:item.uniquekey];
    if (hasRead == YES) {
        self.titleLabel.textColor = [UIColor grayColor];
    }
    
    self.titleLabel.text = item.title;
    self.sourceLabel.text = item.authorName;
    [self.sourceLabel sizeToFit];
    
    self.commentLabel.text = item.category;
    [self.commentLabel sizeToFit];
    self.commentLabel.frame = CGRectMake(self.sourceLabel.frame.origin.x + self.sourceLabel.frame.size.width + 15, self.commentLabel.frame.origin.y, self.commentLabel.frame.size.width, self.commentLabel.frame.size.height);
    
    self.timeLabel.text = item.date;
    [self.timeLabel sizeToFit];
    self.timeLabel.frame = CGRectMake(self.commentLabel.frame.origin.x + self.commentLabel.frame.size.width + 15, self.timeLabel.frame.origin.y, self.timeLabel.frame.size.width, self.timeLabel.frame.size.height);
    
//    NSThread *downloadImageThread = [[NSThread alloc]initWithBlock:^{
//
//
//    }];
//    downloadImageThread.name = @"downloadImageThread";
//    [downloadImageThread start];
    
//    dispatch_queue_global_t downloadQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    dispatch_queue_main_t mainQueue = dispatch_get_main_queue();
//
//    dispatch_async(downloadQueue, ^{
//         UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:item.picUrl]]];
//        dispatch_async(mainQueue, ^{
//             self.rightImageView.image = image;
//        });
//    });
    //添加默认的 progress indicator
    [self.rightImageView sd_setShowActivityIndicatorView:YES];
    [self.rightImageView sd_setIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [self.rightImageView sd_setImageWithURL:[NSURL URLWithString:item.picUrl] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        
    }];
    
}

- (void)deleteButtonClick{
    if (self.delegate && [self.delegate respondsToSelector:@selector(tableViewCell: clickDeleteButton:)]) {
        [self.delegate tableViewCell:self clickDeleteButton:self.deleteButton];
    }
}

@end
