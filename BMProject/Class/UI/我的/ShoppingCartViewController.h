//
//  ShoppingCartViewController.h
//  BMProject
//
//  Created by xa on 16/3/4.
//  Copyright © 2016年 王凯锋  158682312@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UICellButton.h"
@interface ShoppingCartViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *goodsPriceLB;

@property (weak, nonatomic) IBOutlet UILabel *allPriceLB;
@property (weak, nonatomic) IBOutlet UIButton *payOrderButton;
@property (weak, nonatomic) IBOutlet UILabel *dddiscount;
@property (weak, nonatomic) IBOutlet UIButton *detebutton;
@property (weak, nonatomic) IBOutlet UICellButton *allsecletbut;



@end
