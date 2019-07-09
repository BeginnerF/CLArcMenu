//
//  ViewController.m
//  CLArcMenu
//
//  Created by wonders_cll on 2019/6/21.
//  Copyright © 2019 wonders_cll. All rights reserved.
//

#import "ViewController.h"
#import "CLArcMenuView.h"
//view的高度
#define ViewHeight 300

@interface ViewController ()<CLArcMenuViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSArray *iconImageArray = @[@"我的服务343_23",@"我的服务343_18",@"我的服务343_09",@"我的服务343_03",@"我的服务343_06",@"我的服务343_14"];
    NSArray *imageArray = @[@"我的服务1_03-1",@"我的服务1_06-1",@"我的服务1_09-1",@"我的服务1_12-1",@"我的服务1_17-1",@"我的服务1_40-1"];
    NSArray *titleArray = @[@"我的服务",@"我的服务",@"我的服务",@"我的服务",@"我的服务",@"我的服务"];
    
    CLArcMenuView * menuView = [[CLArcMenuView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, ViewHeight)];
    menuView.backgroundColor=[UIColor whiteColor];
    [menuView addIconSubView:iconImageArray];
    [menuView addBtnSubView:imageArray titleArray:titleArray];
    [self.view addSubview:menuView];
}

-(void)didClickBtnForArcView:(UIButton *)sender{
    
}

@end
