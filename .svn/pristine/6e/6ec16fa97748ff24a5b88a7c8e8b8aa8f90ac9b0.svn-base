//
//  Single.m
//  StudyiOS
//
//  Created by  on 11-10-28.
//  Copyright (c) 2011年 ZhangYiCheng. All rights reserved.
//

#import "Single.h"
#define kDuration 0.5   // 动画持续时间(秒)
@implementation Single
+ (Single *)sharedManager {
    static Single *sharedSingle = nil;
    
    static dispatch_once_t predicate; dispatch_once(&predicate, ^{
        sharedSingle = [[self alloc] init];
    });
    
    return sharedSingle;
    
}

- (NSString *)getPlistPath
{
    // 获取应用程序沙盒的Documents目录
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString * plistPath2 = [paths objectAtIndex:0];
    
    // 得到完整的文件名
    NSString * fileName = [plistPath2 stringByAppendingPathComponent:@"NearData.plist"];
    return fileName;
}

- (void)writeNearDataToPlistWith:(NSDictionary *)fileData
{
    [fileData writeToFile:[self getPlistPath] atomically:YES];
}

- (NSDictionary *)readNearDataFormPlist
{
    NSDictionary * data = [[NSDictionary alloc] initWithContentsOfFile:[self getPlistPath]];
    return data;
}


- (void)userDefault:(id)s Key:(NSString *)str {
    [[NSUserDefaults standardUserDefaults] setObject:s forKey:str];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)getUserDefault:(id)s {
    [[NSUserDefaults standardUserDefaults] objectForKey:s];
    [[NSUserDefaults standardUserDefaults] synchronize];
}




@end
