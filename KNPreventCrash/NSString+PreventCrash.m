//
//  NSString+PreventCrash.m
//  KNPreventCrashDemo
//
//  Created by Ken on 2020/3/24.
//  Copyright © 2020 ken. All rights reserved.
//

#import "NSString+PreventCrash.h"
#import <objc/runtime.h>
#import "KNSwizzling.h"
@implementation NSString (PreventCrash)
+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = NSClassFromString(@"__NSCFConstantString");
        //交换字符截取索引方法
        [KNSwizzling swizzleInstanceSelector: @selector(substringToIndex:) withSwizzledSelector:@selector(kn_substringToIndex:) forClass:class];
        [KNSwizzling swizzleInstanceSelector: @selector(substringFromIndex:) withSwizzledSelector:@selector(kn_substringFromIndex:) forClass:class];
    });
    
}
-(NSString *)kn_substringToIndex:(NSUInteger)to{
    
    if (self.length<to) {
#ifdef DEBUG
        NSLog(@"Ken：索引超过字符长度，已帮你处理崩溃 %@",[[[self superclass] superclass] superclass]);
#endif
        return nil;
    }
    return [self kn_substringToIndex:to];
}
-(NSString *)kn_substringFromIndex:(NSUInteger)from{
    
    if (self.length<from) {
#ifdef DEBUG
        NSLog(@"Ken：索引超过字符长度，已帮你处理崩溃 %@",[[[self superclass] superclass] superclass]);
#endif
        return nil;
    }
    return [self kn_substringFromIndex:from];
}
@end
