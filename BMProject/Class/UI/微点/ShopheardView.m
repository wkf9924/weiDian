//
//  ShopheardView.m
//  BMProject
//
//  Created by xa on 16/3/3.
//  Copyright © 2016年 王凯锋  158682312@qq.com. All rights reserved.
//

#import "ShopheardView.h"

@implementation ShopheardView

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        NSArray *array = [[NSBundle mainBundle]loadNibNamed:@"ShopheardView" owner:self options:nil];
        self=array[0];
        
        self.abstractview.backgroundColor = [UIColor colorWithWhite:0.8 alpha:1];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
