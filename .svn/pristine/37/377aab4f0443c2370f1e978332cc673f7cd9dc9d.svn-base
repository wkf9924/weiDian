//
//  CalculusViewController.m
//  BMProject
//
//  Created by xa on 16/2/27.
//  Copyright © 2016年 王凯锋. All rights reserved.
//

#import "CalculusViewController.h"

@interface CalculusViewController ()

@end

@implementation CalculusViewController





- (void)viewDidLoad {
    [super viewDidLoad];
    
    if([[UIDevice currentDevice].systemVersion doubleValue] > 7.0)
        self.edgesForExtendedLayout = UIRectEdgeNone;
    self.title = @"微积分";
    [self setBackButtonItem:@selector(backHome) backImage:@"back"];
    //self.heardimageview.image = [UIImage imageNamed:@"123"];
    self.heardimageview.layer.cornerRadius = 60;
    self.heardimageview.layer.masksToBounds = YES;
    self.heardimageview.userInteractionEnabled = YES;
    
    self.integralbut.layer.borderWidth = 0.7;
    self.integralbut.layer.borderColor = [UIColor colorWithRed:238/255.0f green:238/255.0f blue:238/255.0f alpha:1].CGColor;
    [self.integralbut.layer setCornerRadius:5.0];
    
    self.cardcouponsbut.layer.borderWidth = 0.7;
    self.cardcouponsbut.layer.borderColor = [UIColor colorWithRed:238/255.0f green:238/255.0f blue:238/255.0f alpha:1].CGColor;
    [self.cardcouponsbut.layer setCornerRadius:5.0];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)backHome{
    
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"backkkk" object:nil];
    
    [self.navigationController popViewControllerAnimated:YES];
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
