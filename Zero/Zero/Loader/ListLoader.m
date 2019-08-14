//
//  ListLoader.m
//  Zero
//
//  Created by apple on 2019/8/6.
//  Copyright © 2019 apple. All rights reserved.
//

#import "ListLoader.h"
#import "ListItem.h"
@implementation ListLoader
- (void)loadListDataWithFinishBlock:(ListLoaderFinishBlock)finishBlock{
    
    NSArray<ListItem *> *listData = [self _readDtaFromLocal];
    if (listData) {
        finishBlock(YES,listData);
    }
    
    NSString *urlString = @"http://v.juhe.cn/toutiao/index?type=top&key=97ad001bfcc2082e2eeaf798bad3d54e";
    NSURL *listUrl = [NSURL URLWithString:urlString];
    
    NSURLSession *session = [NSURLSession sharedSession];
    __weak typeof(self)weakSelf = self;
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:listUrl completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSError *jsonError;
        __strong typeof(weakSelf)strongSelf = weakSelf;
        id jsonObj = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        
        NSArray *dataArray = [(NSDictionary *)[(NSDictionary *)jsonObj objectForKey:@"result"] objectForKey:@"data"];
        NSMutableArray *listItemArray = @[].mutableCopy;
        for (NSDictionary *info in dataArray) {
            ListItem *listItem = [[ListItem alloc]init];
            [listItem configWithDictionary:info];
            [listItemArray addObject:listItem];
        }
        
        [strongSelf _archiveListDataWithArray:listItemArray.copy];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (finishBlock) {
                finishBlock(error == nil, listItemArray.copy);
            }
        });
        
    }];
    
    [dataTask resume];
    
}
#pragma mark - private method
- (NSArray<ListItem *> *)_readDtaFromLocal{
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [pathArray firstObject];
    NSString *listDataPaht = [cachePath stringByAppendingPathComponent:@"GTData/list"];
    
    NSData *readListData = [[NSFileManager defaultManager] contentsAtPath:listDataPaht];
    
    id unarchiveObj = [NSKeyedUnarchiver unarchivedObjectOfClasses:[NSSet setWithObjects:[NSArray class],[ListItem class], nil] fromData:readListData error:nil];
    
    if ([unarchiveObj isKindOfClass:[NSArray class]] && [unarchiveObj count] > 0) {
        return (NSArray<ListItem *> *)unarchiveObj;
    }
    return nil;
}

- (void)_archiveListDataWithArray:(NSArray<ListItem *> *)array{
   NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [pathArray firstObject];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    //创建文件夹
    NSString *dataPath = [cachePath stringByAppendingPathComponent:@"GTData"];
    NSError *error;
    [fileManager createDirectoryAtPath:dataPath withIntermediateDirectories:YES attributes:nil error:&error];
    //创建文件
    NSString *listDataPaht = [dataPath stringByAppendingPathComponent:@"list"];
    
    NSData *listData = [NSKeyedArchiver archivedDataWithRootObject:array requiringSecureCoding:YES error:nil];
    
    [fileManager createFileAtPath:listDataPaht contents:listData attributes:nil];
    
    
    //查询文件
    //BOOL fileExist = [fileManager fileExistsAtPath:listDataPaht];
    
}
@end
