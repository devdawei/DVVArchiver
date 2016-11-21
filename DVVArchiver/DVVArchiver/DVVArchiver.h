//
//  DVVArchiver.h
//  DVVArchiver <https://github.com/devdawei/DVVArchiver.git>
//
//  Created by 大威 on 2016/11/21.
//  Copyright © 2016年 devdawei. All rights reserved.
//

#import <Foundation/Foundation.h>

/** 统一添加的文件后缀名 */
extern NSString * const kDVVArchiverFileSuffix;

/**
 缓存目录的类型
 
 - DVVArchiverTypeCaches: Caches
 - DVVArchiverTypePreferences: Preferences
 - DVVArchiverTypeTmp: Tmp
 */
typedef NS_ENUM(NSUInteger, DVVArchiverType) {
    DVVArchiverTypeCaches,
    DVVArchiverTypePreferences,
    DVVArchiverTypeTmp
};

@interface DVVArchiver : NSObject

/**
 缓存对象
 
 @param type 缓存目录的类型
 @param object 要缓存的对象
 @param name 缓存对象的文件名
 @return 是否成功
 */
+ (BOOL)archiverWithType:(DVVArchiverType)type
                  object:(id)object
                    name:(NSString *)name;

/**
 取缓存对象
 
 @param type 缓存目录的类型
 @param name 缓存对象的文件名
 @return 缓存对象
 */
+ (id)unarchiveWithType:(DVVArchiverType)type
                   name:(NSString *)name;

/**
 检查是否有缓存文件
 
 @param type 缓存目录的类型
 @param name 缓存对象的文件名
 @return 是否有缓存
 */
+ (BOOL)fileExistsWithType:(DVVArchiverType)type
                      name:(NSString *)name;

/**
 删除缓存文件
 
 @param type 缓存目录的类型
 @param name 缓存对象的文件名
 @return 是否删除成功
 */
+ (BOOL)removeFileWithType:(DVVArchiverType)type
                      name:(NSString *)name;

/**
 获取缓存目录的路径
 
 @param type 缓存目录的类型
 @return 缓存目录的路径
 */
+ (NSString *)pathWithType:(DVVArchiverType)type;

@end
