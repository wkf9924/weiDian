//
//  ShoppingCartTableViewCell.h
//  BMProject
//
//  Created by xa on 16/3/4.
//  Copyright © 2016年 王凯锋  158682312@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "UICellButton.h"
/*-------------------------代理----------------------------------*/
@protocol ShoppingCarCellDelegate <NSObject>

// 2
-(void)carSelectButtonClicked:(NSDictionary *)item WithSectionIndexPath:(NSInteger)section WithIndexPath:(NSInteger)row;


@end

@interface ShoppingCartTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *shopimageview;
@property (weak, nonatomic) IBOutlet UICellButton *selecbut;

@property (weak, nonatomic) IBOutlet UIButton *minusbut;
@property (weak, nonatomic) IBOutlet UIButton *plusbut;
@property (weak, nonatomic) IBOutlet UITextField *taxtfildnumber;
@property (weak, nonatomic) IBOutlet UILabel *goodsname;
@property (weak, nonatomic) IBOutlet UILabel *goodsprice;
@property (weak, nonatomic) IBOutlet UILabel *coloclab;


// 2
@property (nonatomic,strong) NSMutableDictionary     *itemData;

@property (nonatomic,assign) id<ShoppingCarCellDelegate> delegate;

- (void)reloadData;

@end
