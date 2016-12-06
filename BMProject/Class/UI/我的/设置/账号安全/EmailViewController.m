//
//  EmailViewController.m
//  BMProject
//
//  Created by mac-admin on 16/2/24.
//  Copyright © 2016年 王凯锋. All rights reserved.
//

#import "EmailViewController.h"

@interface EmailViewController ()

@property (weak, nonatomic) IBOutlet UIButton *btnSubmit;
- (IBAction)submitAction:(id)sender;
@end

@implementation EmailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if([[UIDevice currentDevice].systemVersion doubleValue] > 7.0)
        self.edgesForExtendedLayout = UIRectEdgeNone;
    [self setBackBarButton];
    self.title  = @"绑定邮箱";
    _btnSubmit.backgroundColor = BUTTON_BACKGROUND
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

- (IBAction)submitAction:(id)sender {
}
@end
