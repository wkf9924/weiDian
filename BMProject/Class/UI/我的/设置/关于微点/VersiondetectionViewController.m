//
//  VersiondetectionViewController.m
//  BMProject
//
//  Created by xa on 16/3/1.
//  Copyright © 2016年 王凯锋  158682312@qq.com. All rights reserved.
//

#import "VersiondetectionViewController.h"

@interface VersiondetectionViewController ()

@end

@implementation VersiondetectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if([[UIDevice currentDevice].systemVersion doubleValue] > 7.0)
        self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.title = @"关于微点";
    
    [self setBackBarButton];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
