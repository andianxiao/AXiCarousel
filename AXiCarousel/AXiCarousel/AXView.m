//
//  AXView.m
//  iCarouselJS
//
//  Created by 安潇 on 2016/12/9.
//  Copyright © 2016年 anxiao. All rights reserved.
//

#import "AXView.h"
#import "AXViewItem.h"
#import "iCarousel.h"
#import "AXTestViewController.h"

@interface AXView () <iCarouselDelegate, iCarouselDataSource>

@property (nonatomic, strong) iCarousel *crousel;
@property (nonatomic, strong) AXViewItem *item;

@end

@implementation AXView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _crousel = [[iCarousel alloc] initWithFrame:self.bounds];
        // 设置滚动的模式
        _crousel.type = iCarouselTypeRotary;
        // _carousel.scrollOffset = -100;
        // 设置手势滑动的力度 deault 0.95
        _crousel.decelerationRate = 0.5;
        _crousel.delegate = self;
        _crousel.dataSource = self;
        
        [self addSubview:_crousel];

    }
    return self;
}


#pragma mark iCarouselDataSource
//有多少项
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return 3;
}
//最大有多少个可以显示
- (NSUInteger)numberOfVisibleItemsInCarousel:(iCarousel *)carousel{
    return 5;
}


//每一个的内容
- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view{
    
    AXViewItem *item = nil;
    if (!view) {
        view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100,130)];
        item = [[AXViewItem alloc]initWithFrame:view.bounds];
        [view addSubview:item];
        item.tag = 100;
    }
    item = (AXViewItem *)[view viewWithTag:100];
    self.item = item;
    
    // 模型赋值
    
    return item;
}


#pragma mark - iCarouselDelegate
-(CGFloat)carouselItemWidth:(iCarousel *)carousel{
    return 79;
}

- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value{
    
    switch (option)
    {
        case iCarouselOptionWrap:
        {
            //设置是否实现旋转木马效果
            return YES;
        }
        case iCarouselOptionSpacing:
        {
            //旋转半径默认为0.25
            return value * 4.0f;
        }
        default:
        {
            return value;
        }
    }
}


- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index{
//    
//    if (self.recartists.count > 0) {
//        ArtistModel *artist = self.recartists[index];
//        self.recArtistTitleView.artistModel = artist;
//    }
    
    
    if ( index == _crousel.currentItemIndex) {
        NSLog(@"点击了第%ld",index);
//        UINavigationController *nav = (UINavigationController *)[UIApplication sharedApplication].keyWindow.rootViewController;
//        
//        AXTestViewController *vc = [[AXTestViewController alloc]init];
//        
//        [nav pushViewController:vc animated:YES];
        
    }
    
    
    switch (index) {
        case 0:
        {
            NSLog(@"0======currentItemIndex:%ld",(long)carousel.currentItemIndex);
            
            //            self.recArtistiCarouselItem.recArtistTitleView.hidden = NO;
            
        }
            break;
        case 1:
        {
            NSLog(@"1======currentItemIndex:%ld",(long)carousel.currentItemIndex);
            //            self.recArtistiCarouselItem.recArtistTitleView.hidden = NO;
        }
            break;
        case 2:
        {
            NSLog(@"2======currentItemIndex:%ld",(long)carousel.currentItemIndex);
        }
            break;
        default:
            break;
    }
    
    
}

- (void)carouselDidEndDecelerating:(iCarousel *)carousel{
    // 获取当前index
    
//    ArtistModel *artist = self.recartists[_carousel.currentItemIndex];
//    self.recArtistTitleView.artistModel = artist;
}

- (void)dealloc
{
    //it's a good idea to set these to nil here to avoid
    //sending messages to a deallocated viewcontroller
    _crousel.delegate = nil;
    _crousel.dataSource = nil;
}



@end
