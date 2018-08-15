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
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [super touchesBegan:touches withEvent:event];
}

@end
