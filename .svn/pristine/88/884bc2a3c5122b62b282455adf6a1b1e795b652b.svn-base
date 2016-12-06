//
//  MeassageViewController.m
//  BMProject
//
//  Created by xa on 16/2/24.
//  Copyright © 2016年 王凯锋. All rights reserved.
//

#import "MeassageViewController.h"

@interface MeassageViewController ()
@property (weak, nonatomic) IBOutlet UISwitch *switchMeassage;
- (IBAction)swichchange:(id)sender;

@end

@implementation MeassageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if([[UIDevice currentDevice].systemVersion doubleValue] > 7.0)
        self.edgesForExtendedLayout = UIRectEdgeNone;
    self.title = @"新消息通知";
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

- (IBAction)swichchange:(id)sender {
    
    UISwitch *swit = (UISwitch *)sender;
    if(swit.isOn){
        
        NSLog(@"-----");
        
    }else{
        
        NSLog(@"-----___+++"); 
    }
    
    
}
@end
