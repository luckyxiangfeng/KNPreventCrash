//
//  NSMutableString+PreventCrash.m
//  KNPreventCrashDemo
//
//  Created by Ken on 2020/3/24.
//  Copyright © 2020 ken. All rights reserved.
//

#import "NSMutableString+PreventCrash.h"
#import <objc/runtime.h>
#import "KNSwizzling.h"
@implementation NSMutableString (PreventCrash)
+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = NSClassFromString(@"__NSCFString");
        [KNSwizzling swizzleInstanceSelector: @selector(appendString:) withSwizzledSelector:@selector(kn_appendString:) forClass:class];
        [KNSwizzling swizzleInstanceSelector: @selector(setString:) withSwizzledSelector:@selector(kn_setString:) forClass:class];
        [KNSwizzling swizzleInstanceSelector: @selector(insertString:atIndex:) withSwizzledSelector:@selector(kn_insertString:atIndex:) forClass:class];
    });
    
}
-(void)kn_appendString:(NSString *)aString{
    
    if (!aString) {
#ifdef DEBUG
        NSLog(@"Ken：拼接字符不能为空，已帮你处理崩溃 %@",[self superclass]);
#endif
        return;
    }
    [self kn_appendString:aString];
}
- (void)kn_setString:(NSString *)aString{
    if (!aString) {
#ifdef DEBUG
        NSLog(@"Ken：设定的字符不能为空，已帮你处理崩溃 %@",[self superclass]);
#endif
        return;
    }
    [self kn_setString:aString];
}
- (void)kn_insertString:(NSString *)aString atIndex:(NSUInteger)loc{
    if (!aString) {
#ifdef DEBUG
        NSLog(@"Ken：插入的字符不能为空，已帮你处理崩溃 %@",[self superclass]);
#endif
        return;
    }
    [self kn_insertString:aString atIndex:loc];

}
@end
