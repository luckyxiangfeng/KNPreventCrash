//
//  AppDelegate.m
//  KNPreventCrashDemo
//
//  Created by Ken on 2020/3/16.
//  Copyright © 2020 ken. All rights reserved.
//

#import "AppDelegate.h"
#import "TestViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    TestViewController *vc = [[TestViewController alloc] init];
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = vc;
    [self.window makeKeyWindow];
    return YES;
}

@end
