//
//  AXViewItem.m
//  iCarouselJS
//
//  Created by 安潇 on 2016/12/9.
//  Copyright © 2016年 anxiao. All rights reserved.
//

#import "AXViewItem.h"
#import <Masonry/Masonry.h>

@interface AXViewItem ()

@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UILabel *titleLbl;

@end

@implementation AXViewItem

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor purpleColor];
        [self setupAutolyout];
    }
    return self;
}

- (void)setupAutolyout{
    __weak typeof(self)weakSelf = self;
    [weakSelf.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.topMargin.equalTo(@(17));
        make.centerX.equalTo(weakSelf);
        make.height.equalTo(weakSelf.iconView.mas_width);
        make.height.equalTo(@(70));
//        make.bottom.equalTo(weakSelf.titleLbl.mas_top).offset(ScaleHeight(-15));
    }];
    
    [weakSelf.titleLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf);
        make.bottomMargin.equalTo(@(-17));
    }];
}

- (UIImageView *)iconView{
    if (nil == _iconView) {
        _iconView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"pic_people_defaule_90"]];
        _iconView.backgroundColor = [UIColor grayColor];
        _iconView.layer.cornerRadius = 35;
        _iconView.layer.masksToBounds = YES;
        [self addSubview:_iconView];
    }
    return _iconView;
}

- (UILabel *)titleLbl{
    if (nil == _titleLbl) {
        _titleLbl = [[UILabel alloc]init];
        _titleLbl.font = [UIFont systemFontOfSize:15];
        _titleLbl.textColor = [UIColor blueColor];
        _titleLbl.textAlignment = NSTextAlignmentCenter;
        _titleLbl.text = @"你的名字";
        [self addSubview:_titleLbl];
    }
    return _titleLbl;
}

@end
