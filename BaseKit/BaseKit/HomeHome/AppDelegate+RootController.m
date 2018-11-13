//
//  AppDelegate+RootController.m
//  BaseKit
//
//  Created by GuoYanjun on 2018/11/8.
//  Copyright © 2018年 shiyujin. All rights reserved.
//

#import "AppDelegate+RootController.h"

@implementation AppDelegate (RootController)
-(void)initWithRootView{
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor=[UIColor whiteColor];
    ViewController *vc =[[ViewController alloc]init];
    self.window.rootViewController=vc;
    [self.window makeKeyAndVisible];
}
@end
