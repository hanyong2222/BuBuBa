//
//  HomeViewController.m
//  BuBuBa
//
//  Created by goulela on 16/5/19.
//  Copyright © 2016年 bububa. All rights reserved.
//

#import "HomeViewController.h"

// 搜索页面
#import "HomeSearchViewController.h"

// 表格视图
#import "HomeCell.h"
#import "HomeModel.h"


#define kImageCount 4


@interface HomeViewController () <UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView     * tableView;
@property (nonatomic, strong) UIView          * areaHeaderView;

@property (nonatomic, strong) UIButton        * titleViewButton;

// banner 区域
@property (nonatomic, strong) UIScrollView    * bannerScrollView;
@property (strong, nonatomic) NSMutableArray  * imagesArrayM;
@property (nonatomic, strong) UIPageControl   * pageControl;

// Functional Module 功能模块
@property (nonatomic, strong) UIView   * functionalView;
@property (nonatomic, strong) UIView   * HLineView;
@property (nonatomic, strong) UIView   * VLineOneView;
@property (nonatomic, strong) UIView   * VLineTwoView;
@property (nonatomic, strong) UIButton * everyDayButton;
@property (nonatomic, strong) UIButton * healthButton;
@property (nonatomic, strong) UIButton * physiqueButton;
@property (nonatomic, strong) UIButton * fashionButton;
@property (nonatomic, strong) UIButton * welfareButton;
@property (nonatomic, strong) UIButton * experienceButton;
@property (nonatomic, strong) UIImageView * freeImageView;



@end

@implementation HomeViewController

#pragma mark - 生命周期

#pragma mark viewDidLoad
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self basicSetting];
    
    [self addTableView];
    
    [self addImages];
    
    [self addBannerScrollView];
    
    [self functionalModule];
}


#pragma mark - 系统代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * identifier = @"cell";
    
    HomeCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell)
    {
        cell = [[HomeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

#pragma mark UITableView


#pragma mark UIScrollView Delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //获取偏移量
    CGFloat offset_x = scrollView.contentOffset.x;
    
    int currentPage = offset_x / MCScreenWidth;
    if (offset_x >= 0 && offset_x < MCScreenWidth)
    {
        self.pageControl.currentPage = self.imagesArrayM.count-3;
    }
    else
    {
        self.pageControl.currentPage = currentPage - 1;
    }
}

/**
 *  将要开始拖动
 */
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    CGFloat offset_x = self.bannerScrollView.contentOffset.x + MCScreenWidth;
    
    
    if (offset_x == (self.imagesArrayM.count - 1) * MCScreenWidth)
    {
        [self.bannerScrollView setContentOffset:CGPointMake(0, 0) animated:NO];
    }
}

#pragma mark - 点击事件

#pragma mark titleView的点击事件
- (void)titleViewButtonClicked
{
    HomeSearchViewController * seachViewController = [[HomeSearchViewController alloc] init];
    
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:seachViewController animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}

#pragma mark 每日推荐点击事件
- (void)everyDayButtonClicked
{
    MCLogDebug(@"每日推荐");
}
#pragma mark 养生咨询按钮点击事件
- (void)healthButtonClicked
{
    MCLogDebug(@"养生")
}

#pragma mark 体质测试按钮点击事件
- (void)physiqueButtonClicked
{
    MCLogDebug(@"体质测试");
}
#pragma mark 达人社区按钮的点击事件
- (void)fashionButtonClicked
{
    MCLogDebug(@"达人社区");
}

#pragma mark 福利社按钮的点击事件
- (void)welfareButtonClicked
{
    MCLogDebug(@"福利社");
}

#pragma mark 体验试用按钮点击事件
- (void)experienceButtonClicked
{
    MCLogDebug(@"体验试用");
}


#pragma mark 定时器的事件
- (void)imageMove
{
    CGFloat offset_x = self.bannerScrollView.contentOffset.x + MCScreenWidth;
    [self.bannerScrollView setContentOffset:CGPointMake(offset_x, 0) animated:YES];
}

#pragma mark - 实现方法
#pragma mark 基本设置
- (void)basicSetting
{
    self.view.backgroundColor = MCUIColorLightGray;
    
    self.imagesArrayM = [NSMutableArray arrayWithCapacity:0];
    
    // 添加左右元素项
    [MCTool MCAddLeftBarButtonItemWithFrame:CGRectMake(0, 0, 64, 18) textColor:nil font:nil target:nil selected:nil image:[UIImage imageNamed:@"Nav_bububa"] who:self.navigationItem text:nil andIsHighLight:NO];
    [MCTool MCAddRightBarButtonItemWithFrame:CGRectMake(0, 0, 62, 20) textColor:nil font:nil target:nil selected:nil image:[UIImage imageNamed:@"Nav_yangshengtang"] who:self.navigationItem text:nil andIsHighLight:NO];
    
    // 中间导航条视图
    self.navigationItem.titleView = self.titleViewButton;
}

#pragma mark 表格视图
- (void)addTableView
{
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(self.view.mas_left).with.offset(0);
        make.right.mas_equalTo(self.view.mas_right).with.offset(0);
        make.top.mas_equalTo(self.view.mas_top).with.offset(0);
        make.bottom.mas_equalTo(self.view.mas_bottom).with.offset(0);
    }];
}

#pragma mark 添加图片
- (void)addImages
{
    for (int i = 0; i < kImageCount; i ++)
    {
        UIImage * image = [UIImage imageNamed:[NSString stringWithFormat:@"%i.jpg",i + 1]];
        
        if (self.imagesArrayM)
        {
            [self.imagesArrayM addObject:image];
        }
    }
    
    [self.imagesArrayM insertObject:[UIImage imageNamed:@"4.jpg"] atIndex:0];
    [self.imagesArrayM addObject:[UIImage imageNamed:@"1.jpg"]];
}

- (void)addBannerScrollView
{
    [self.areaHeaderView addSubview:self.bannerScrollView];
    [self.bannerScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(self.areaHeaderView).with.offset(0);
        make.width.mas_equalTo(MCScreenWidth);
        make.top.mas_equalTo(self.areaHeaderView).with.offset(0);
        make.height.mas_equalTo(180);
    }];
    
    // 添加图片
    for (int i = 0; i < kImageCount + 2; i ++)
    {
        UIImageView * imageView = [[UIImageView alloc] init];
        imageView.frame = CGRectMake(i * MCScreenWidth, 0, MCScreenWidth, 180);
        
        imageView.image = self.imagesArrayM[i];
        [self.bannerScrollView addSubview:imageView];
    }
    
    // 添加分页控制器
    [self.view addSubview:self.pageControl];
    [self.pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self.view.mas_centerX);
        make.top.mas_equalTo(self.bannerScrollView.mas_bottom).with.offset(-30);
    }];
    
    // 添加定时器
    [NSTimer scheduledTimerWithTimeInterval:2.0f target:self selector:@selector(imageMove) userInfo:nil repeats:YES];
}

#pragma mark 六个功能模块
- (void)functionalModule
{
    CGFloat buttonWidth  = (MCScreenWidth - 2) / 3;
    CGFloat buttonHeight = buttonWidth * 2 / 3;
    CGFloat funcViewHeight   = buttonHeight * 2 + 1;
    
    [self.areaHeaderView addSubview:self.functionalView];
    [self.functionalView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(self.areaHeaderView).with.offset(0);
        make.right.mas_equalTo(self.areaHeaderView).with.offset(0);
        make.top.mas_equalTo(self.bannerScrollView.mas_bottom).with.offset(5);
        make.height.mas_equalTo(funcViewHeight);
    }];
    
    [self.functionalView addSubview:self.HLineView];
    [self.HLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(self.functionalView).with.offset(0);
        make.right.mas_equalTo(self.functionalView.mas_right).with.offset(0);
        make.top.mas_equalTo(self.functionalView.mas_top).with.offset(buttonHeight);
        make.height.mas_equalTo(1);
    }];
    
    [self.functionalView addSubview:self.VLineOneView];
    [self.VLineOneView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.functionalView.mas_top).with.offset(0);
        make.bottom.mas_equalTo(self.functionalView.mas_bottom).with.offset(0);
        make.width.mas_equalTo(1);
        make.left.mas_equalTo(self.functionalView.mas_left).with.offset(buttonWidth);
    }];
    
    [self.functionalView addSubview:self.VLineTwoView];
    [self.VLineTwoView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.functionalView.mas_top).with.offset(0);
        make.bottom.mas_equalTo(self.functionalView.mas_bottom).with.offset(0);
        make.width.mas_equalTo(1);
        make.right.mas_equalTo(self.functionalView.mas_right).with.offset(-buttonWidth);
    }];
    
    // 每日推荐
    [self.functionalView addSubview:self.everyDayButton];
    [self.everyDayButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(self.functionalView.mas_left).with.offset(MCScreenWidth / 6 - 30);
        make.top.mas_equalTo(self.functionalView.mas_top).with.offset(5);
        make.size.mas_equalTo(CGSizeMake(60, buttonHeight - 5));
    }];
    
    // 养生咨询
    [self.functionalView addSubview:self.self.healthButton];
    [self.healthButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(self.functionalView.mas_left).with.offset((MCScreenWidth * 3) / 6 - 30);
        make.top.mas_equalTo(self.functionalView.mas_top).with.offset(5);
        make.size.mas_equalTo(CGSizeMake(60, buttonHeight - 5));
    }];
    
    // 体质测试
    [self.functionalView addSubview:self.physiqueButton];
    [self.physiqueButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(self.functionalView.mas_left).with.offset((MCScreenWidth * 5) / 6 - 30);
        make.top.mas_equalTo(self.functionalView.mas_top).with.offset(5);
        make.size.mas_equalTo(CGSizeMake(60, buttonHeight - 5));
    }];
    
    // 达人社区
    [self.functionalView addSubview:self.fashionButton];
    [self.fashionButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(self.functionalView.mas_left).with.offset((MCScreenWidth * 1) / 6 - 30);
        make.bottom.mas_equalTo(self.functionalView.mas_bottom).with.offset(0);
        make.size.mas_equalTo(CGSizeMake(60, buttonHeight - 5));
    }];
    
    // 福利社
    [self.functionalView addSubview:self.welfareButton];
    [self.welfareButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(self.functionalView.mas_left).with.offset((MCScreenWidth * 3) / 6 - 30);
        make.bottom.mas_equalTo(self.functionalView.mas_bottom).with.offset(0);
        make.size.mas_equalTo(CGSizeMake(60, buttonHeight - 5));
    }];
    
    // 体验试用
    [self.functionalView addSubview:self.experienceButton];
    [self.experienceButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(self.functionalView.mas_left).with.offset((MCScreenWidth * 5) / 6 - 30);
        make.bottom.mas_equalTo(self.functionalView.mas_bottom).with.offset(0);
        make.size.mas_equalTo(CGSizeMake(60, buttonHeight - 5));
    }];
    
    [self.experienceButton addSubview:self.freeImageView];
    [self.freeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.mas_equalTo(self.HLineView.mas_right).with.offset(0);
        make.top.mas_equalTo(self.HLineView.mas_top).with.offset(0);
        make.size.mas_equalTo(CGSizeMake(37, 39));
    }];
}

#pragma mark - setter & getter
- (UITableView *)tableView
{
    if (!_tableView)
    {
        self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        
        self.tableView.separatorStyle
        = UITableViewCellSelectionStyleNone;
        
        CGFloat buttonWidth  = (MCScreenWidth - 2) / 3;
        CGFloat buttonHeight = buttonWidth * 2 / 3;
        CGFloat headerHeight   = (buttonHeight * 2 + 1) + 180 + 10;
        
        self.areaHeaderView = [[UIView alloc] init];
        self.areaHeaderView.frame = CGRectMake(0, 0, 0, headerHeight);
        self.areaHeaderView.backgroundColor = MCUIColorLightGray;
        self.tableView.tableHeaderView = self.areaHeaderView;
    }
    return _tableView;
}

- (UIButton *)titleViewButton
{
    if (!_titleViewButton)
    {
        self.titleViewButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.titleViewButton.frame = CGRectMake(0, 0, 239, 28);
        self.titleViewButton.backgroundColor = [UIColor clearColor];
        [self.titleViewButton setImage:[UIImage imageNamed:@"Nav_sousuo"] forState:UIControlStateNormal];
        [self.titleViewButton addTarget:self action:@selector(titleViewButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return _titleViewButton;
}

- (UIScrollView *)bannerScrollView
{
    if (!_bannerScrollView)
    {
        self.bannerScrollView = [[UIScrollView alloc] init];
        self.bannerScrollView.contentSize = CGSizeMake(MCScreenWidth * 4, 0);
        self.bannerScrollView.contentOffset = CGPointMake(MCScreenWidth, 0);
        self.bannerScrollView.pagingEnabled = YES;
        self.bannerScrollView.delegate = self;
        self.bannerScrollView.panGestureRecognizer.enabled = NO;
        self.bannerScrollView.showsHorizontalScrollIndicator = NO;
        self.bannerScrollView.showsVerticalScrollIndicator = NO;
    }
    return _bannerScrollView;
}

- (UIPageControl *)pageControl
{
    if (!_pageControl)
    {
        self.pageControl = [[UIPageControl alloc] init];
        self.pageControl.pageIndicatorTintColor = MCUIColorLightGray;
        self.pageControl.currentPageIndicatorTintColor = MCUIColorLightBlue;
        self.pageControl.numberOfPages = kImageCount;
        self.pageControl.currentPage = 0;
    }
    return _pageControl;
}

#pragma mark functional Module 
- (UIView *)functionalView
{
    if (!_functionalView)
    {
        self.functionalView = [[UIView alloc] init];
        self.functionalView.backgroundColor = [UIColor whiteColor];
    }
    return _functionalView;
}

- (UIView *)HLineView
{
    if (!_HLineView)
    {
        self.HLineView = [[UIView alloc] init];
        self.HLineView.backgroundColor = MCUIColorLightGray;
    }
    return _HLineView;
}

- (UIView *)VLineOneView
{
    if (!_VLineOneView)
    {
        self.VLineOneView = [[UIView alloc] init];
        self.VLineOneView.backgroundColor = MCUIColorLightGray;
    }
    return _VLineOneView;
}

- (UIView *)VLineTwoView
{
    if (!_VLineTwoView)
    {
        self.VLineTwoView = [[UIView alloc] init];
        self.VLineTwoView.backgroundColor = MCUIColorLightGray;
    }
    return _VLineTwoView;
}


- (UIButton *)everyDayButton
{
    if (!_everyDayButton)
    {
        self.everyDayButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.everyDayButton setImage:[UIImage imageNamed:@"Home_meirituijian"] forState:UIControlStateNormal];
        [self.everyDayButton addTarget:self action:@selector(everyDayButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return _everyDayButton;
}

- (UIButton *)healthButton
{
    if (!_healthButton)
    {
        self.healthButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.healthButton setImage:[UIImage imageNamed:@"Home_yangshengzixun"] forState:UIControlStateNormal];
        [self.healthButton addTarget:self action:@selector(healthButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return _healthButton;
}

- (UIButton *)physiqueButton
{
    if (!_physiqueButton)
    {
        self.physiqueButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.physiqueButton setImage:[UIImage imageNamed:@"Home_tizhiceshi"] forState:UIControlStateNormal];
        [self.physiqueButton addTarget:self action:@selector(physiqueButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return _physiqueButton;
}

- (UIButton *)fashionButton
{
    if (!_fashionButton)
    {
        self.fashionButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.fashionButton setImage:[UIImage imageNamed:@"Home_darenshequ"] forState:UIControlStateNormal];
        [self.fashionButton addTarget:self action:@selector(fashionButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return _fashionButton;
}

- (UIButton *)welfareButton
{
    if (!_welfareButton)
    {
        self.welfareButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.welfareButton setImage:[UIImage imageNamed:@"Home_fulishe"] forState:UIControlStateNormal];
        [self.welfareButton addTarget:self action:@selector(welfareButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return _welfareButton;
}

- (UIButton *)experienceButton
{
    if (!_experienceButton)
    {
        self.experienceButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.experienceButton setImage:[UIImage imageNamed:@"Home_tiyanshiyong"] forState:UIControlStateNormal];
        [self.experienceButton addTarget:self action:@selector(experienceButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return _experienceButton;
}
- (UIImageView *)freeImageView
{
    if (!_freeImageView)
    {
        self.freeImageView = [[UIImageView alloc] init];
        self.freeImageView.image = [UIImage imageNamed:@"Home_mianfei"];
    }
    return _freeImageView;
}

@end
