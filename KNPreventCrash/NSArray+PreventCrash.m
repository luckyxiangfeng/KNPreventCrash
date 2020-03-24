//
//  NSArray+PreventCrash.m
//  KNPreventCrashDemo
//
//  Created by Ken on 2020/3/24.
//  Copyright © 2020 ken. All rights reserved.
//

#import "NSArray+PreventCrash.h"
#import <objc/runtime.h>
#import "KNSwizzling.h"
@implementation NSArray (PreventCrash)
+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = NSClassFromString(@"__NSArray0");
        //交换数据索引方法
        [KNSwizzling swizzleInstanceSelector: @selector(objectAtIndex:) withSwizzledSelector:@selector(kn_objectAtIndex:) forClass:class];
    });
}
-(id)kn_objectAtIndex:(NSUInteger)index{

    if (index > self.count) {
#ifdef DEBUG
        NSLog(@"Ken：数组越界，已帮你处理崩溃 %@",[self superclass]);
#endif
        return nil;
    }
    return [self kn_objectAtIndex:index];
    
}
@end
