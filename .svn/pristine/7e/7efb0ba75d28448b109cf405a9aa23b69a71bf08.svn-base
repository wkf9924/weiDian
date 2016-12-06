//
//  Shopcarheadrview.h
//  BMProject
//
//  Created by xa on 16/3/4.
//  Copyright © 2016年 王凯锋  158682312@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "UICellButton.h"
@protocol ShoppingHeaderCellDelegate <NSObject>

//选中按钮点击
-(void)carSelectButtonClicked:(NSDictionary *)item WithIndexPathSection:(NSInteger)section WithIndexPathRow:(NSInteger)row;

@end

@interface Shopcarheadrview : UIView
@property (weak, nonatomic) IBOutlet UICellButton *heardviewselecbut;
@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (nonatomic,assign) id<ShoppingHeaderCellDelegate> delegate;


@property (nonatomic,strong) NSMutableDictionary     *sectionData;
- (void)reloadData;


@end
