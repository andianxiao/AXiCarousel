//
//  ViewController.m
//  AXiCarousel
//
//  Created by 安潇 on 2017/2/3.
//  Copyright © 2017年 andianxiao. All rights reserved.
//

#import "ViewController.h"
#import "AXView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    AXView *view = [[AXView alloc]initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 180)];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];

}


@end
