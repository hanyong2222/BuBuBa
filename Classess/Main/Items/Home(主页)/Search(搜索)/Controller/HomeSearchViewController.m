//
//  HomeSearchViewController.m
//  BuBuBa
//
//  Created by goulela on 16/5/19.
//  Copyright © 2016年 bububa. All rights reserved.
//

#import "HomeSearchViewController.h"

@interface HomeSearchViewController ()

// 搜索框
@property (nonatomic, strong) UITextField * textField;

// 热门搜索Label
@property (nonatomic, strong) UILabel     * hotSearchLabel;

@end

@implementation HomeSearchViewController

#pragma mark - 生命周期
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    self.tabBarController.tabBar.hidden = YES;
}
#pragma mark viewDidLoad
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self basicSetting];
    
    [self addTextField];
    
    [self addHotSearchItems];
}


#pragma mark - 系统代理

#pragma mark - 点击事件
- (void)rightItemClicked
{
    [self.view endEditing:YES];
    
    [self.textField resignFirstResponder];
    
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 实现方法
#pragma mark 基本设置
- (void)basicSetting
{
    self.view.backgroundColor = [UIColor whiteColor];

    self.navigationItem.hidesBackButton = YES;
    
    [MCTool MCAddRightBarButtonItemWithFrame:CGRectMake(0, 0, 40, 20) textColor:MCUIColorGray font:MCFont(14.0f) target:self selected:@selector(rightItemClicked) image:nil who:self.navigationItem text:@"取消" andIsHighLight:YES];
}

- (void)addTextField
{
    self.navigationItem.titleView = self.textField;
    
}

- (void)addHotSearchItems
{
    [self.view addSubview:self.hotSearchLabel];
    [self.hotSearchLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(self.view).with.offset(10);
        make.top.mas_equalTo(self.view).with.offset(10);
        make.height.mas_equalTo(14);
    }];
}

#pragma mark - setter & getter
- (UITextField *)textField
{
    if (!_textField)
    {
        self.textField = [[UITextField alloc] init];
        self.textField.frame = CGRectMake(0, 0, 500, 25);
//        self.textField.layer.masksToBounds = YES;
//        self.textField.layer.cornerRadius = 5.0f;
        self.textField.backgroundColor = MCUIColorLightGray;
        self.textField.borderStyle = UITextBorderStyleRoundedRect;
        self.textField.placeholder = @"请输入汤类,膏类,体质";
        self.textField.font = MCFont(12.0f);
        self.textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        
        UIImageView * imageView = [[UIImageView alloc] init];
        imageView.frame = CGRectMake(0, 0, 20, 20);
        imageView.image = [UIImage imageNamed:@"Reuse_sousuo"];
        self.textField.leftViewMode = UITextFieldViewModeAlways;
        self.textField.leftView = imageView;
    }
    return _textField;
}

#pragma mark 热门搜索
- (UILabel *)hotSearchLabel
{
    if (!_hotSearchLabel)
    {
        self.hotSearchLabel = [[UILabel alloc] init];
        self.hotSearchLabel.text = @"热门搜索";
        self.hotSearchLabel.font = MCFont(14.0f);
        self.hotSearchLabel.textColor = MCUIColorGray;
    }
    return _hotSearchLabel;
}

@end
