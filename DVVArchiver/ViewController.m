//
//  ViewController.m
//  DVVArchiver
//
//  Created by 大威 on 2016/11/21.
//  Copyright © 2016年 devdawei. All rights reserved.
//

#import "ViewController.h"
#import "Test.h"
#import "DVVArchiver.h"
#import <DVVCoding/DVVCoding.h>

NSString * const kTestArchiverFileName = @"kTestArchiverFileName";

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSLog(@"%@\n\n", [DVVArchiver pathWithType:DVVArchiverTypeCaches]);
    NSLog(@"%@\n\n", [DVVArchiver pathWithType:DVVArchiverTypePreferences]);
    NSLog(@"%@\n\n", [DVVArchiver pathWithType:DVVArchiverTypeTmp]);
//    /* 删除缓存 */
//    BOOL s = [DVVArchiver removeFileWithType:DVVArchiverTypePreferences name:kTestArchiverFileName];
//    NSLog(@"删除缓存: %zi", s);
    
    if ([DVVArchiver fileExistsWithType:DVVArchiverTypePreferences name:kTestArchiverFileName])
    {
        NSLog(@"有缓存文件！");
        
        Test *t = (Test *)[DVVArchiver unarchiveWithType:DVVArchiverTypePreferences name:kTestArchiverFileName];
        NSLog(@"token: %@", t.token);
        NSLog(@"userID: %zi", t.userID);
        NSLog(@"name: %@", t.name);
    }
    else
    {
        NSLog(@"没有缓存文件！");
        
        Test *t = [Test new];
        t.token = @"kdljflhvbhoewirowepuroiwe";
        t.userID = 123456;
        t.name = @"大威";
        BOOL s = [DVVArchiver archiverWithType:DVVArchiverTypePreferences object:t name:kTestArchiverFileName];
        if (s) NSLog(@"缓存成功");
        else NSLog(@"缓存失败");
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
