//
//  KNSwizzling.h
//  KNPreventCrashDemo
//
//  Created by Ken on 2020/3/18.
//  Copyright © 2020 ken. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KNSwizzling : NSObject
+ (void)swizzleInstanceSelector:(SEL)originalSel
           withSwizzledSelector:(SEL)swizzledSel
                       forClass:(Class)class;
@end

NS_ASSUME_NONNULL_END
