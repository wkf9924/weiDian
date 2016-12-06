//
//  QXwdTableViewCell.m
//  BMProject
//
//  Created by xa on 16/1/6.
//  Copyright © 2016年 王凯锋. All rights reserved.
//

#import "QXwdTableViewCell.h"

@implementation QXwdTableViewCell

-(void)drawRect:(CGRect)rect{
    
    [super drawRect:rect];
    
    self.wdlogoImageVIew.layer.cornerRadius = 10;
    self.wdlogoImageVIew.layer.masksToBounds = YES;
    
    [self numberlable];


}
-(void)numberlable{
   UIColor *customColor  = [UIColor colorWithRed:237/255.0 green:20/255.0 blue:91/255.0 alpha:1.0f];
    _cntLabel.textColor = customColor;
    _cntLabel.textAlignment = NSTextAlignmentCenter;
    _cntLabel.font = [UIFont boldSystemFontOfSize:13];
    _cntLabel.backgroundColor = [UIColor whiteColor];
    _cntLabel.layer.cornerRadius = CGRectGetHeight(_cntLabel.bounds)/2;
    _cntLabel.layer.masksToBounds = YES;
    _cntLabel.layer.borderWidth = 1.0f;
    _cntLabel.layer.borderColor = customColor.CGColor;
 
}

- (void)awakeFromNib {
    
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
