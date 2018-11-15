//
//  BaseNavController.m
//  BaseKit
//
//  Created by GuoYanjun on 2018/11/9.
//  Copyright © 2018年 shiyujin. All rights reserved.
//

#import "BaseNavController.h"

@interface BaseNavController ()<UIGestureRecognizerDelegate,UINavigationBarDelegate>

@end

@implementation BaseNavController

- (void)viewDidLoad {
    [super viewDidLoad];
//    Nav的主题背景色
    
    
//    Nav的主题字体大小和颜色
    
    
//------    Nav的系统返回手势   -------
    self.interactivePopGestureRecognizer.delegate=self;
//    获取系统自带滑动手势的target对象
    id taager = self.interactivePopGestureRecognizer.delegate;
//    创建全屏滑动手势，调用系统自带滑动手势的target的action方法
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:taager action:@selector(hanleNavtionTransition:)];
//    设置手势代理，拦截手势触发
    pan.delegate=self;
//    给导航控制机器添加全屏滑动手势
    [self.view addGestureRecognizer:pan];
//    禁止使用系统自带的滑动手势
    self.interactivePopGestureRecognizer.enabled = NO;

}

-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    if (self.childViewControllers.count<2) {
        return NO;
    }else{
        return YES;
    }
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.viewControllers.count>0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }else{
        viewController.hidesBottomBarWhenPushed = NO;
    }
    [super pushViewController:viewController animated:animated];
}

@end
