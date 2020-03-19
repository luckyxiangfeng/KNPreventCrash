//
//  NSMutableArray+PreventCrash.m
//  KNPreventCrashDemo
//
//  Created by Ken on 2020/3/16.
//  Copyright © 2020 ken. All rights reserved.
//

#import "NSMutableArray+PreventCrash.h"
#import <objc/runtime.h>
#import "KNSwizzling.h"
@implementation NSMutableArray (PreventCrash)

+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = NSClassFromString(@"__NSArrayM");
        //交换添加数据方法
        [KNSwizzling swizzleInstanceSelector: @selector(insertObject:atIndex:) withSwizzledSelector:@selector(kn_insertObject:atIndex:) forClass:class];
        //交换数据索引方法
        [KNSwizzling swizzleInstanceSelector: @selector(objectAtIndex:) withSwizzledSelector:@selector(kn_objectAtIndex:) forClass:class];
    });
}

- (void)kn_insertObject:(id)anObject atIndex:(NSUInteger)index{
    
    if (anObject==nil){
        NSLog(@"数组插入数据为空，已帮你处理崩溃");
        return;
    }
    
    [self kn_insertObject:anObject atIndex:index];
    
}
-(id)kn_objectAtIndex:(NSUInteger)index{

    if (index > self.count) {
        NSLog(@"数组越界，已帮你处理崩溃");
        return nil;
    }
    return [self kn_objectAtIndex:index];
    
}

@end
