//
//  NSMutableDictionary+PreventCrash.m
//  KNPreventCrashDemo
//
//  Created by Ken on 2020/3/24.
//  Copyright © 2020 ken. All rights reserved.
//

#import "NSMutableDictionary+PreventCrash.h"
#import <objc/runtime.h>
#import "KNSwizzling.h"
@implementation NSMutableDictionary (PreventCrash)
+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = NSClassFromString(@"__NSDictionaryM");
//        Class class1 = NSClassFromString(@"__NSDictionaryI");
        //交换设置数据方法
        [KNSwizzling swizzleInstanceSelector: @selector(setObject:forKey:) withSwizzledSelector:@selector(kn_setObject:forKey:) forClass:class];
        //交换移除索引方法
        [KNSwizzling swizzleInstanceSelector: @selector(removeObjectForKey:) withSwizzledSelector:@selector(kn_removeObjectForKey:) forClass:class];
    });
}
- (void)kn_setObject:(id)anObject forKey:(id<NSCopying>)aKey{
    if (!anObject||!aKey) {
#ifdef DEBUG
        NSLog(@"Ken：插入对象或者key为空，已为你处理崩溃 %@",[self superclass]);
#endif
        return;
    }
    [self kn_setObject:anObject forKey:aKey];
}
- (void)kn_removeObjectForKey:(id)aKey{
    if (!aKey) {
#ifdef DEBUG
        NSLog(@"Ken：移除key值为空，已为你处理崩溃 %@",[self superclass]);
#endif
        return;
    }
    [self kn_removeObjectForKey:aKey];
}
@end
