//
//  ShoppingCartTableViewCell.m
//  BMProject
//
//  Created by xa on 16/3/4.
//  Copyright © 2016年 王凯锋  158682312@qq.com. All rights reserved.
//

#import "ShoppingCartTableViewCell.h"


@implementation ShoppingCartTableViewCell

-(void)drawRect:(CGRect)rect{
    
    [super drawRect:rect];
    
    _shopimageview.layer.borderWidth = 1;
    
    _shopimageview.layer.borderColor = [[UIColor grayColor] CGColor];
    
  
}

- (void)awakeFromNib {
    
    [_selecbut setBackgroundImage:[UIImage imageNamed:@"iconfont-xuanze"] forState:0];
    [_selecbut setBackgroundImage:[UIImage imageNamed:@"iconfont-selexuanze"] forState:UIControlStateSelected];
    
    
    // Initialization code
}


- (void)reloadData
{
    if (self.itemData) {
        _selecbut.selected = [[self.itemData objectForKey:@"selected"] boolValue];
        
        }
}

- (IBAction)selectBtnAction:(UICellButton *)sender {
    
    if ([self.delegate respondsToSelector:@selector(carSelectButtonClicked:WithSectionIndexPath:WithIndexPath:)]) {
        [self.delegate carSelectButtonClicked:self.itemData WithSectionIndexPath:sender.sectionTag WithIndexPath:sender.rowTag];
    }
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)minbut:(UIButton *)sender {
    
    int NumberInt =[_taxtfildnumber.text intValue];
    if (NumberInt == 1) {
        
        return;
    }
    --NumberInt;
    _taxtfildnumber.text =[NSString stringWithFormat:@"%d",NumberInt];
    
    if (NumberInt == 1) {
        
        return;
    }
    
  
}

- (IBAction)plusbut:(UIButton *)sender {
    
    int NumberInt =[_taxtfildnumber.text intValue];
    if (NumberInt ==99) {
        return;
    }
    ++NumberInt;
    
    _taxtfildnumber.text =[NSString stringWithFormat:@"%d",NumberInt];
 
    
}




@end
