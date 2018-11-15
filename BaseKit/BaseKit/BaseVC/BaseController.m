//
//  BaseController.m
//  BaseKit
//
//  Created by GuoYanjun on 2018/11/8.
//  Copyright © 2018年 shiyujin. All rights reserved.
//

#import "BaseController.h"
#import "AllUrlrequest.h"
@interface BaseController ()

@end

@implementation BaseController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}

-(UITableView *)tableview{
    if (!_tableview) {
        _tableview = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        
        if (@available(iOS 11.0, *)) {
            self.tableview.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
        
        _tableview.showsVerticalScrollIndicator = NO;
        _tableview.estimatedRowHeight = 0;
        _tableview.estimatedSectionFooterHeight = 0;
        _tableview.estimatedSectionHeaderHeight = 0;
        _tableview.scrollsToTop = YES;
        _tableview.separatorStyle = UITableViewCellSelectionStyleNone;
        
//        头部刷新
        MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRerefsh)];
        header.automaticallyChangeAlpha =YES;
        header.lastUpdatedTimeLabel.hidden = YES;
        _tableview.mj_header = header;
        
//        底部刷新
        _tableview.mj_footer = [MJRefreshBackFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerRerefsh)];
        _tableview.mj_footer.ignoredScrollViewContentInsetBottom = 30;
        
    
        
    }
    return _tableview;
}

-(UICollectionView *)collectionview{
    if (!_collectionview) {
        UICollectionViewFlowLayout *layout =[[UICollectionViewFlowLayout alloc]init];
        _collectionview = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        
        if (@available(iOS 11.0, *)) {
            self.collectionview.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
        
        _collectionview.scrollsToTop = YES;
        //        头部刷新
        MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRerefsh)];
        header.automaticallyChangeAlpha =YES;
        header.lastUpdatedTimeLabel.hidden = YES;
        _collectionview.mj_header = header;
        
        //        底部刷新
        _collectionview.mj_footer = [MJRefreshBackFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerRerefsh)];
        _collectionview.mj_footer.ignoredScrollViewContentInsetBottom = 30;
        
    }
    return _collectionview;
}

@end
