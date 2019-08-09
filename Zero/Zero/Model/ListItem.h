//
//  ListItem.h
//  Zero
//
//  Created by apple on 2019/8/9.
//  Copyright © 2019 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 列表结构化数据
 */
@interface ListItem : NSObject
@property(nonatomic, copy, readwrite)NSString *title;
@property(nonatomic, copy, readwrite)NSString *date;
@property(nonatomic, copy, readwrite)NSString *uniquekey;
@property(nonatomic, copy, readwrite)NSString *category;
@property(nonatomic, copy, readwrite)NSString *picUrl;
@property(nonatomic, copy, readwrite)NSString *authorName;
@property(nonatomic, copy, readwrite)NSString *articleUrl;

- (void)configWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
