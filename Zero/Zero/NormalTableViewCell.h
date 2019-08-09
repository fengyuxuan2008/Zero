//
//  NormalTableViewCell.h
//  Zero
//
//  Created by apple on 2019/7/29.
//  Copyright © 2019 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ListItem;
NS_ASSUME_NONNULL_BEGIN

/**
 点击删除按钮
 */
@protocol NormalTableViewCellDelegate <NSObject>
- (void)tableViewCell: (UITableViewCell*)tableViewCell clickDeleteButton: (UIButton *)deleteButton;
@end

/**
 新闻列表cell
 */
@interface NormalTableViewCell : UITableViewCell

@property(nonatomic, weak, readwrite)id<NormalTableViewCellDelegate> delegate;

- (void)layoutTableViewCellWithItem:(ListItem *)item;

@end

NS_ASSUME_NONNULL_END
