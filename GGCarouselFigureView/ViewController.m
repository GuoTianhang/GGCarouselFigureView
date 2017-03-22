//
//  ViewController.m
//  GGCarouselFigureView
//
//  Created by Xiaohang on 2017/3/20.
//  Copyright © 2017年 Xiaohang. All rights reserved.
//

#import "ViewController.h"
#import "GGCarouselFigureView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    NSArray *pictureArray = @[[UIImage imageNamed:@"kaka1"]];
//    NSArray *pictureArray = @[[UIImage imageNamed:@"kaka1"], [UIImage imageNamed:@"kaka2"]];
    NSArray *pictureArray = @[[UIImage imageNamed:@"kaka1"], [UIImage imageNamed:@"kaka2"], [UIImage imageNamed:@"kaka3"]];
//    NSArray *pictureArray = @[[UIImage imageNamed:@"kaka1"], [UIImage imageNamed:@"kaka2"], [UIImage imageNamed:@"kaka3"],[UIImage imageNamed:@"kaka1"], [UIImage imageNamed:@"kaka2"], [UIImage imageNamed:@"kaka3"],[UIImage imageNamed:@"kaka1"], [UIImage imageNamed:@"kaka2"], [UIImage imageNamed:@"kaka3"],[UIImage imageNamed:@"kaka1"], [UIImage imageNamed:@"kaka2"], [UIImage imageNamed:@"kaka3"],[UIImage imageNamed:@"kaka1"], [UIImage imageNamed:@"kaka2"], [UIImage imageNamed:@"kaka3"],[UIImage imageNamed:@"kaka1"], [UIImage imageNamed:@"kaka2"], [UIImage imageNamed:@"kaka3"],[UIImage imageNamed:@"kaka1"], [UIImage imageNamed:@"kaka2"], [UIImage imageNamed:@"kaka3"],[UIImage imageNamed:@"kaka1"], [UIImage imageNamed:@"kaka2"], [UIImage imageNamed:@"kaka3"],[UIImage imageNamed:@"kaka1"], [UIImage imageNamed:@"kaka2"], [UIImage imageNamed:@"kaka3"],[UIImage imageNamed:@"kaka1"], [UIImage imageNamed:@"kaka2"], [UIImage imageNamed:@"kaka3"],[UIImage imageNamed:@"kaka1"], [UIImage imageNamed:@"kaka2"], [UIImage imageNamed:@"kaka3"],[UIImage imageNamed:@"kaka1"], [UIImage imageNamed:@"kaka2"], [UIImage imageNamed:@"kaka3"]];

    GGCarouselFigureView *carouselFigureView = [[GGCarouselFigureView alloc] initWithFrame:CGRectZero PictureArray:pictureArray];
    [self.view addSubview:carouselFigureView];
    [self.view addSubview:carouselFigureView.pageControl];
    [carouselFigureView.pageControl setCurrentPageIndicatorTintColor:[UIColor redColor]];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
