//
//  ViewController.m
//  StretchHeadControls
//
//  Created by 宋好云 on 2017/11/6.
//  Copyright © 2017年 宋好云. All rights reserved.
//

#import "ViewController.h"
#import "CustomNavigationBar.h"
#import "Config.h"

#define imgFloat 170/375.0 //pic图片比例
#define imgFloat1 750.0/341.0 //pic图片比例
#define realImgHeight imgFloat*WIDTH //pic图片实际高度

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView*tableView;
@property (nonatomic, strong) CustomNavigationBar* navBar;
@property (nonatomic, strong) UIImageView* imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    UIImageView* imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, kTopHeight, WIDTH, realImgHeight)];
    imageView.image = [UIImage imageNamed:@"pic"];
    [self.view addSubview:imageView];
    _imageView = imageView;
    [_imageView setContentMode:UIViewContentModeScaleAspectFit];
    
    CustomNavigationBar* navBar = [CustomNavigationBar navigationBar];
    [navBar setBackgroundColor:[[UIColor blueColor]colorWithAlphaComponent:0]];
    [self.view addSubview:navBar];
    _navBar = navBar;
    
    _navBar.titleLabel.text = @"Title";
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, kTopHeight, WIDTH, HEIGHT-kTopHeight-kTabBarHeight)];
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    UIView* view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, realImgHeight)];
    [view setBackgroundColor:[UIColor clearColor]];
    [_tableView setTableHeaderView:view];
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 50;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString* cell = @"MYCell";
    UITableViewCell* tableViewCell = [tableView dequeueReusableCellWithIdentifier:cell];
    if (tableViewCell == nil) {
        tableViewCell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cell];
    }
    tableViewCell.textLabel.text = @"可拉伸头部控件";
    return tableViewCell;
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat y = scrollView.contentOffset.y;
    if (y > realImgHeight) {//完全覆盖背景图
        //        [_navBar setBackgroundColor:[UIColor blueColor]];
    } else if (y > 0 && y <= realImgHeight) {//未完全覆盖背景图
        [_navBar setBackgroundColor:[[UIColor blueColor] colorWithAlphaComponent:y/(WIDTH*imgFloat)]];
    }
    
    CGFloat ih = realImgHeight-y;
    CGFloat iw = ih*imgFloat1;
    CGFloat ix = (WIDTH-iw)/2;
    CGFloat iy = kTopHeight;
    if (y > 0) {
        ih = realImgHeight;
        iw = WIDTH;
        ix = 0;
        iy = kTopHeight-y;
    } else {
        
    }
    [_imageView setFrame:CGRectMake(ix, iy, iw, ih)];
    //    NSLog(@"%@,%f",NSStringFromCGRect(_imageView.frame),ih);
}

@end
