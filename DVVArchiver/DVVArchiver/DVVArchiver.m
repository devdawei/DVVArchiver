//
//  DVVArchiver.m
//  DVVArchiver <https://github.com/devdawei/DVVArchiver.git>
//
//  Created by 大威 on 2016/11/21.
//  Copyright © 2016年 devdawei. All rights reserved.
//

#import "DVVArchiver.h"

NSString * const kDVVArchiverFileSuffix = @"dvvArchiver";

@implementation DVVArchiver

+ (BOOL)archiverWithType:(DVVArchiverType)type object:(id)object name:(NSString *)name
{
    if (!object ||
        !name || !name.length)
    {
        return NO;
    }
    
    NSString *addSuffixName = [DVVArchiver addSuffixForName:name];
    NSString *path = [DVVArchiver pathWithType:type];
    if (nil == path) return NO;
    [NSKeyedArchiver archiveRootObject:object toFile:[path stringByAppendingPathComponent:addSuffixName]];
    return YES;
}

+ (id)unarchiveWithType:(DVVArchiverType)type name:(NSString *)name
{
    if (!name || !name.length) return nil;
    NSString *path = [DVVArchiver pathWithType:type];
    if (nil == path) return nil;
    
    NSString *addSuffixName = [DVVArchiver addSuffixForName:name];
    return [NSKeyedUnarchiver unarchiveObjectWithFile:[path stringByAppendingPathComponent:addSuffixName]];
}

+ (NSString *)addSuffixForName:(NSString *)name
{
    return [NSString stringWithFormat:@"%@.%@", name, kDVVArchiverFileSuffix];
}

+ (BOOL)fileExistsWithType:(DVVArchiverType)type name:(NSString *)name
{
    if (!name || !name.length) return NO;
    
    NSString *path = [DVVArchiver pathWithType:type];
    NSString *addSuffixName = [DVVArchiver addSuffixForName:name];
    
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    return [fileMgr fileExistsAtPath:[path stringByAppendingPathComponent:addSuffixName]];
}

+ (BOOL)removeFileWithType:(DVVArchiverType)type
                      name:(NSString *)name
{
    if (!name || !name.length) return NO;
    NSString *path = [DVVArchiver pathWithType:type];
    if (nil == path) return NO;
    
    NSString *addSuffixName = [DVVArchiver addSuffixForName:name];
    
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    NSError *error = nil;
    BOOL success = [fileMgr removeItemAtPath:[path stringByAppendingPathComponent:addSuffixName] error:&error];
    if (!error && success) return YES;
    return NO;
}

+ (NSString *)pathWithType:(DVVArchiverType)type
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *tmp = nil;
    switch (type) {
        case DVVArchiverTypeCaches:
            tmp = @"Caches";
            break;
        case DVVArchiverTypePreferences:
            tmp = @"Preferences";
            break;
        case DVVArchiverTypeTmp:
            tmp = @"tmp";
            break;
            
        default:
            break;
    }
    if (nil == tmp) return nil;
    else return [[paths objectAtIndex:0] stringByAppendingPathComponent:tmp];
}

@end
