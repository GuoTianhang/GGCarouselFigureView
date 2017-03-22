//
//  GGCarouselFigureView.m
//  GGCarouselFigureView
//
//  Created by Xiaohang on 2017/3/21.
//  Copyright © 2017年 Xiaohang. All rights reserved.
//

#import "GGCarouselFigureView.h"

#define imageWidth [UIScreen mainScreen].bounds.size.width
#define imageHeight ([UIScreen mainScreen].bounds.size.width) * 0.618

@interface GGCarouselFigureView()<UIScrollViewDelegate>

@property(nonatomic, assign)NSInteger pictureNum;

@end

@implementation GGCarouselFigureView

- (instancetype)initWithFrame:(CGRect)frame PictureArray:(nonnull NSArray *)pictureArray{
    _pictureNum = [pictureArray count];
    CGRect viewFrame;
    if (CGRectEqualToRect(frame, CGRectZero)) {
        viewFrame = CGRectMake(0.0, 20.0, imageWidth, imageHeight);
    }else{
        viewFrame = frame;
    }
    self = [super initWithFrame:viewFrame];
    if (self) {
        
        self.contentSize = CGSizeMake(imageWidth * (_pictureNum + 2), imageHeight);
        
        //循环滚动效果预留图片
        if (pictureArray.count > 1) {
            UIImageView *frontImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, imageWidth, imageHeight)];
            frontImageView.image = [pictureArray lastObject];
            [self addSubview:frontImageView];
            [self setContentOffset:CGPointMake(imageWidth, 0.0f) animated:NO];
            
            UIImageView *rearImageView = [[UIImageView alloc] initWithFrame:CGRectMake(imageWidth * ([pictureArray count] + 1), 0.0, imageWidth, imageHeight)];
            rearImageView.image = [pictureArray firstObject];
            [self addSubview:rearImageView];
            
            [pictureArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(imageWidth * (idx + 1), 0.0, imageWidth, imageHeight)];
                imageView.image = obj;
                [self addSubview:imageView];
            }];
        }else if (pictureArray.count == 1){
            UIImageView *frontImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, imageWidth, imageHeight)];
            frontImageView.image = [pictureArray lastObject];
            [self addSubview:frontImageView];
        }

        //边界弹性
        self.bounces = NO;
        //隐藏水平的滑块
        self.showsHorizontalScrollIndicator = NO;
        //设置代理
        self.delegate = self;
        //设置pageControl
        [self setupPageControlWithFrame:viewFrame];
    }
    return self;
}

#pragma mark - 设置pageControl
- (void)setupPageControlWithFrame:(CGRect) frame{
    self.pageControl = [[UIPageControl alloc] init];
    [self.pageControl setNumberOfPages:_pictureNum];
    CGSize pageControlSize = [self.pageControl sizeForNumberOfPages:_pictureNum];
    self.pageControl.frame = CGRectMake(imageWidth/2 - pageControlSize.width/2, frame.origin.y + frame.size.height - pageControlSize.height + 10, pageControlSize.width, pageControlSize.height);
    [self.pageControl setHidesForSinglePage:YES];
    [self.pageControl setPageIndicatorTintColor:[UIColor whiteColor]];
    [self.pageControl setCurrentPageIndicatorTintColor:[UIColor grayColor]];
}

#pragma mark - scrollView代理方法
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    //如果是滑动的情况则直接返回
    if (decelerate) {
        return;
    }
    int contentOffsetY = (int)scrollView.contentOffset.x % (int)imageWidth;
    if (contentOffsetY < imageWidth / 2) {
        [self setContentOffset:CGPointMake((int)scrollView.contentOffset.x / (int)imageWidth * imageWidth, 0.0) animated:YES];
        [self.pageControl setCurrentPage:(int)scrollView.contentOffset.x / (int)imageWidth - 1];
    }else{
        [self setContentOffset:CGPointMake(((int)scrollView.contentOffset.x / (int)imageWidth + 1) * imageWidth, 0.0) animated:YES];
        [self.pageControl setCurrentPage:(int)scrollView.contentOffset.x / (int)imageWidth];
    }
}

//滑动的情况
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    int contentOffsetY = (int)scrollView.contentOffset.x % (int)imageWidth;
    if (contentOffsetY < imageWidth / 2) {
        [self setContentOffset:CGPointMake((int)scrollView.contentOffset.x / (int)imageWidth * imageWidth, 0.0) animated:YES];
        [self.pageControl setCurrentPage:(int)scrollView.contentOffset.x / (int)imageWidth - 1];
    }else{
        [self setContentOffset:CGPointMake(((int)scrollView.contentOffset.x / (int)imageWidth + 1) * imageWidth, 0.0) animated:YES];
        [self.pageControl setCurrentPage:(int)scrollView.contentOffset.x / (int)imageWidth];
    }
}

//设置循环滚动的效果
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    if ((int)scrollView.contentOffset.x / (int)imageWidth == _pictureNum + 1) {
        [self setContentOffset:CGPointMake(imageWidth, 0.0f) animated:NO];
        [self.pageControl setCurrentPage:0];
        return;
    }
    if ((int)scrollView.contentOffset.x / (int)imageWidth == 0) {
        [self setContentOffset:CGPointMake(_pictureNum * imageWidth, 0.0f) animated:NO];
        [self.pageControl setCurrentPage:_pictureNum - 1];
    }
}

@end
