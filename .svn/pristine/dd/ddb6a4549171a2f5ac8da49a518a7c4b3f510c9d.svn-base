//
//  Single.h
//  StudyiOS
//
//  Created by  on 11-10-28.
//  Copyright (c) 2011年 ZhangYiCheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
@interface Single : NSObject

@property (nonatomic,strong) NSString *sexString;
@property BOOL passBool;
@property BOOL pageControlBool;

+ (Single *)sharedManager;

- (NSString *)getPlistPath;
- (void)writeNearDataToPlistWith:(NSDictionary *)fileData;
- (NSDictionary *)readNearDataFormPlist;


//设置userdefault
- (void)userDefault:(id)s Key:(NSString *)str;
- (void)getUserDefault:(id)s;
@end
