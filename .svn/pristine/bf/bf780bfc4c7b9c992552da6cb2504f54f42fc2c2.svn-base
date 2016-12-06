//
//  MywalletViewController.m
//  BMProject
//
//  Created by xa on 16/2/27.
//  Copyright © 2016年 王凯锋  158682312@qq.com. All rights reserved.
//

#import "MywalletViewController.h"

@interface MywalletViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *walletimage;
- (IBAction)rechargebut:(id)sender;
- (IBAction)withdrawalsbut:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *myrecharge;
@property (weak, nonatomic) IBOutlet UIButton *mywithdrawals;

@end

@implementation MywalletViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if([[UIDevice currentDevice].systemVersion doubleValue] > 7.0)
        self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.title = @"我的钱包";
    [self setBackButtonItem:@selector(backHome) backImage:@"back"];
    
    self.walletimage.layer.cornerRadius = 60;
    self.walletimage.layer.masksToBounds = YES;
    self.walletimage.userInteractionEnabled = YES;

     [self.myrecharge.layer setCornerRadius:5.0];
     [self.mywithdrawals.layer setCornerRadius:5.0];
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

- (IBAction)rechargebut:(id)sender {
}

- (IBAction)withdrawalsbut:(id)sender {
}
@end
