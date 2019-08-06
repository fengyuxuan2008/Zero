//
//  DeleteCellView.h
//  Zero
//
//  Created by apple on 2019/8/5.
//  Copyright © 2019 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 点击出现删除cell确认浮层
 */
@interface DeleteCellView : UIView

/**
 点击出现删除cell确认浮层

 @param point 点击的位置
 @param clickBlock 点击后的操作
 */
- (void)showDeleteCellViewFromPoint:(CGPoint)point clickBlock:(dispatch_block_t)clickBlock;

/**
 删除DeleteCellView
 */
- (void)dismissDeleteCellView;
@end

NS_ASSUME_NONNULL_END
