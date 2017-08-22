//
//  ViewController.m
//  gifPlay_demo
//
//  Created by 维奕 on 2017/8/22.
//  Copyright © 2017年 维奕. All rights reserved.
//

#import "ViewController.h"

#import "UIImageView+gifPlay.h"



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIImageView *imageV=[UIImageView new];
    [self.view addSubview:imageV];
    imageV.frame=CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 300);
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"plane" ofType:@".gif"];
    
    [imageV showGifImageWithGifPath:path duration:5 repeat:YES];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
