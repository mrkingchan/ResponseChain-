//
//  ViewController.m
//  ResponseChain
//
//  Created by Macx on 2018/8/15.
//  Copyright © 2018年 Chan. All rights reserved.
//

#import "ViewController.h"
#import "RedView.h"
#import "BlueView.h"
#import "YellowView.h"

@interface ViewController () {
    RedView *_redView;
    YellowView *_yellowView;
    BlueView *_blueView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    _redView = [[RedView alloc] initWithFrame:CGRectMake(30, 150, 300, 300)];
    _redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_redView];

    _yellowView = [[YellowView alloc] initWithFrame:CGRectMake(40, 40, 200, 200)];
    _yellowView.backgroundColor = [UIColor yellowColor];
    [_redView addSubview:_yellowView];
    
    _blueView = [[BlueView alloc] initWithFrame:CGRectMake(40, 40, 120, 120)];
    _blueView.backgroundColor = [UIColor blueColor];
    [_yellowView addSubview:_blueView];
    CFRunLoopRef ref = CFRunLoopGetCurrent();
    CFRunLoopObserverRef observer = CFRunLoopObserverCreateWithHandler(NULL, kCFRunLoopAllActivities, YES, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
        /*/
         typedef CF_OPTIONS(CFOptionFlags, CFRunLoopActivity) {
         kCFRunLoopEntry = (1UL << 0),
         kCFRunLoopBeforeTimers = (1UL << 1),
         kCFRunLoopBeforeSources = (1UL << 2),
         kCFRunLoopBeforeWaiting = (1UL << 5),
         kCFRunLoopAfterWaiting = (1UL << 6),
         kCFRunLoopExit = (1UL << 7),
         kCFRunLoopAllActivities = 0x0FFFFFFFU
         };*/
        switch (activity) {
            case kCFRunLoopEntry : {
             NSLog(@"进入!");
            }
                break;
            case kCFRunLoopBeforeTimers: {
                NSLog(@"即将处理timer!");
            }
                break;
            case kCFRunLoopBeforeSources: {
                NSLog(@"即将处理input source!");
            }
                break;
            case kCFRunLoopBeforeWaiting: {
                NSLog(@"即将休眠!");
            }
                break;
            case kCFRunLoopAfterWaiting: {
                NSLog(@"事件来了，该醒醒起来板砖了！");
            }
                break;
            case kCFRunLoopExit: {
                NSLog(@"退出！");
            }
                break;
            default:
                break;
        }
    });
    CFRunLoopAddObserver(ref, observer, kCFRunLoopCommonModes);
    CFRelease(observer);
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [super touchesBegan:touches withEvent:event];
}

@end
