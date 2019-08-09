//
//  ListItem.m
//  Zero
//
//  Created by apple on 2019/8/9.
//  Copyright © 2019 apple. All rights reserved.
//

#import "ListItem.h"

@implementation ListItem
- (void)configWithDictionary:(NSDictionary *)dictionary{
    
#warning 类型是否匹配
    self.title = [dictionary objectForKey:@"title"];
    self.date = [dictionary objectForKey:@"date"];
    self.uniquekey = [dictionary objectForKey:@"uniquekey"];
    self.category = [dictionary objectForKey:@"category"];
    self.picUrl = [dictionary objectForKey:@"thumbnail_pic_s"];
    self.authorName = [dictionary objectForKey:@"author_name"];
    self.articleUrl = [dictionary objectForKey:@"url"];
}
@end
