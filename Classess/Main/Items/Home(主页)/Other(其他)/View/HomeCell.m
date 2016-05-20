//
//  HomeCell.m
//  BuBuBa
//
//  Created by goulela on 16/5/19.
//  Copyright © 2016年 bububa. All rights reserved.
//

#import "HomeCell.h"
#import "HomeModel.h"

@interface HomeCell ()

// 背景图
@property (nonatomic, strong) UIImageView * bgImageView;

@property (nonatomic, strong) UILabel     * titleLabel;

@property (nonatomic, strong) UILabel     * detailLabel;

@property (nonatomic, strong) UIImageView * lookImageView;
@property (nonatomic, strong) UILabel     * lookLabel;

@property (nonatomic, strong) UIImageView * praiseImageView;
@property (nonatomic, strong) UILabel     * praiseLabel;

@property (nonatomic, strong) UIImageView * reprintImageView;
@property (nonatomic, strong) UILabel     * reprintLabel;


@end

@implementation HomeCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self addSubviews];
    }
    return self;
}

#pragma mark - 点击事件
- (void)imageViewClicked
{
    MCLogDebug(@"点击了图片");
}

#pragma mark - 实现方法
- (void)addSubviews
{
    [self addSubview:self.bgImageView];
    [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(self.mas_left).with.offset(2.5);
        make.right.mas_equalTo(self.mas_right).with.offset(-2.5);
        make.top.mas_equalTo(self.mas_top).with.offset(5);
        make.bottom.mas_equalTo(self.mas_bottom).with.offset(-5);
    }];
}

#pragma mark - setter & getter 
- (UIImageView *)bgImageView
{
    if (!_bgImageView)
    {
        self.bgImageView = [[UIImageView alloc] init];
        self.bgImageView.layer.masksToBounds = YES;
        self.bgImageView.layer.cornerRadius = 5.0f;
        self.bgImageView.userInteractionEnabled = YES;
        
        [self.bgImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@""]] placeholderImage:[UIImage imageNamed:@"1"]];
        
        UITapGestureRecognizer * recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageViewClicked)];
        [self.bgImageView addGestureRecognizer:recognizer];
    }
    return _bgImageView;
}

@end
