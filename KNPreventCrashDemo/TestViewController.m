//
//  TestViewController.m
//  KNPreventCrashDemo
//
//  Created by Ken on 2020/3/19.
//  Copyright © 2020 ken. All rights reserved.
//

#import "TestViewController.h"
@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    NSMutableArray *array = [NSMutableArray array];
    [array addObject:nil];
    
    [array removeObjectAtIndex:1];
    
    [array replaceObjectAtIndex:1 withObject:nil];
    
    NSArray *array1 = [NSArray array];
    [array1 objectAtIndex:1];
    
    NSMutableDictionary *mutableDic = [NSMutableDictionary dictionary];
    [mutableDic setObject:nil forKey:@"aaa"];
    
    [mutableDic removeObjectForKey:nil];
    
}

@end
