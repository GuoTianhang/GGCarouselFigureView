//
//  GGCarouselFigureView.h
//  GGCarouselFigureView
//
//  Created by Xiaohang on 2017/3/21.
//  Copyright © 2017年 Xiaohang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GGCarouselFigureView : UIScrollView

@property(nonatomic, strong)UIPageControl *pageControl;

- (instancetype)initWithFrame:(CGRect)frame PictureArray:(NSArray *)pictureArray;

@end
