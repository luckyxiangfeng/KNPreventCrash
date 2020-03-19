//
//  ViewController.m
//  KNPreventCrashDemo
//
//  Created by Ken on 2020/3/16.
//  Copyright © 2020 ken. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong,nonatomic)  dispatch_source_t timer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    NSMutableArray *array = [NSMutableArray new];
//    [array addObject:nil];
//    NSLog(@"%@",array);
//    NSLog(@"%@",[array objectAtIndex:1]);
//    NSTimeInterval start = 2.0;
//    NSTimeInterval interval = 1.0;
//    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
//    dispatch_source_set_timer(_timer, dispatch_time(DISPATCH_WALLTIME_NOW, start), interval * NSEC_PER_SEC, 0);
//    dispatch_source_set_event_handler(_timer, ^{
//        [self test];
//
//    });
////    dispatch_source_set_event_handler_f(_timer, dispatch_function_t  _Nullable handler)
//    dispatch_resume(_timer);



}
- (void)test{
    
//   static int i = 0;
//    NSLog(@"%d",i++);
//    if (i>10) {
//        dispatch_source_cancel(_timer);
//    }
}


@end
