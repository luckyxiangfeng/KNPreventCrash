//
//  KNSwizzling.m
//  KNPreventCrashDemo
//
//  Created by Ken on 2020/3/18.
//  Copyright © 2020 ken. All rights reserved.
//

#import "KNSwizzling.h"
#import <objc/runtime.h>
@implementation KNSwizzling

+ (void)swizzleInstanceSelector:(SEL)originalSel
           withSwizzledSelector:(SEL)swizzledSel
                       forClass:(Class)class{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method originMethod = class_getInstanceMethod(class, originalSel);
        Method swizzedMehtod = class_getInstanceMethod(class, swizzledSel);
        BOOL methodAdded = class_addMethod(class, originalSel, method_getImplementation(swizzedMehtod), method_getTypeEncoding(swizzedMehtod));
        
        if (methodAdded) {
            class_replaceMethod(class, swizzledSel, method_getImplementation(originMethod), method_getTypeEncoding(originMethod));
        }else{
            method_exchangeImplementations(originMethod, swizzedMehtod);
        }
    });

}
@end
