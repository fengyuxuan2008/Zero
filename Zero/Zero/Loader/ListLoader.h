//
//  ListLoader.h
//  Zero
//
//  Created by apple on 2019/8/6.
//  Copyright © 2019 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ListItem;
NS_ASSUME_NONNULL_BEGIN
typedef void(^ListLoaderFinishBlock)(BOOL success, NSArray<ListItem *> *dataArray);
/**
 列表请求
 */
@interface ListLoader : NSObject
- (void)loadListDataWithFinishBlock:(ListLoaderFinishBlock)finishBlock;
@end

NS_ASSUME_NONNULL_END
