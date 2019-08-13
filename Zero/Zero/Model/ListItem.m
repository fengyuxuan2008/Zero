//
//  ListItem.m
//  Zero
//
//  Created by apple on 2019/8/9.
//  Copyright © 2019 apple. All rights reserved.
//

#import "ListItem.h"

@implementation ListItem

#pragma mark - NSSecureCoding
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self) {
        self.title = [aDecoder decodeObjectForKey:@"title"];
        self.date = [aDecoder decodeObjectForKey:@"date"];
        self.uniquekey = [aDecoder decodeObjectForKey:@"uniquekey"];
        self.category = [aDecoder decodeObjectForKey:@"category"];
        self.picUrl = [aDecoder decodeObjectForKey:@"picUrl"];
        self.authorName = [aDecoder decodeObjectForKey:@"authorName"];
        self.articleUrl = [aDecoder decodeObjectForKey:@"articleUrl"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.title forKey:@"title"];
    [aCoder encodeObject:self.date forKey:@"date"];
    [aCoder encodeObject:self.uniquekey forKey:@"uniquekey"];
    [aCoder encodeObject:self.category forKey:@"category"];
    [aCoder encodeObject:self.picUrl forKey:@"picUrl"];
    [aCoder encodeObject:self.authorName forKey:@"authorName"];
    [aCoder encodeObject:self.articleUrl forKey:@"articleUrl"];
}

+ (BOOL)supportsSecureCoding{
    return YES;
}
#pragma mark - public method
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
