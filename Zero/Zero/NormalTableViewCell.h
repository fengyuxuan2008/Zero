//
//  NormalTableViewCell.h
//  Zero
//
//  Created by apple on 2019/7/29.
//  Copyright © 2019 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol NormalTableViewCellDelegate <NSObject>
- (void)tableViewCell: (UITableViewCell*)tableViewCell clickDeleteButton: (UIButton *)deleteButton;
@end

@interface NormalTableViewCell : UITableViewCell

@property(nonatomic, weak, readwrite)id<NormalTableViewCellDelegate> delegate;

- (void)layoutTableViewCell;

@end

NS_ASSUME_NONNULL_END
