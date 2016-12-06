//
//  OrderstateView.h
//  BMProject
//
//  Created by xa on 16/2/25.
//  Copyright © 2016年 王凯锋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderstateView : UIView

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *twospacing;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *threespacing;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *fourspacing;
@property (weak, nonatomic) IBOutlet UIImageView *awaitingpayment;
@property (weak, nonatomic) IBOutlet UIImageView *wftrImage;
@property (weak, nonatomic) IBOutlet UIImageView *receiptgoodsimage;

@property (weak, nonatomic) IBOutlet UIImageView *bcompletedimage;
@property (weak, nonatomic) IBOutlet UIButton *onestatebutton;
@property (weak, nonatomic) IBOutlet UIButton *twostatebutton;
@property (weak, nonatomic) IBOutlet UIButton *threestatebutton;
@property (weak, nonatomic) IBOutlet UIButton *fourstatebutton;





@end
