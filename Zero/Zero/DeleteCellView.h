//
//  DeleteCellView.h
//  Zero
//
//  Created by apple on 2019/8/5.
//  Copyright © 2019 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DeleteCellView : UIView
- (void)showDeleteCellViewFromPoint:(CGPoint)point clickBlock:(dispatch_block_t)clickBlock;
- (void)dismissDeleteCellView;
@end

NS_ASSUME_NONNULL_END
