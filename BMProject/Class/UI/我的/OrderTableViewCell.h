//
//  OrderTableViewCell.h
//  BMProject
//
//  Created by xa on 16/2/25.
//  Copyright © 2016年 王凯锋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *goodsimage;
@property (weak, nonatomic) IBOutlet UILabel *goodsdescribe;
@property (weak, nonatomic) IBOutlet UILabel *goodsprice;
@property (weak, nonatomic) IBOutlet UILabel *goodscolour;
@property (weak, nonatomic) IBOutlet UILabel *goodssize;
@property (weak, nonatomic) IBOutlet UILabel *goodsnumbers;
@property (weak, nonatomic) IBOutlet UILabel *goodsnumbers2;
@property (weak, nonatomic) IBOutlet UILabel *goodssumprice;
- (IBAction)cancelorder:(id)sender;
- (IBAction)orderstatetwo:(id)sender;

@end
