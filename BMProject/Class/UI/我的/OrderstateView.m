//
//  OrderstateView.m
//  BMProject
//
//  Created by xa on 16/2/25.
//  Copyright © 2016年 王凯锋. All rights reserved.
//

#import "OrderstateView.h"

@implementation OrderstateView

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        NSArray *array = [[NSBundle mainBundle]loadNibNamed:@"OrderstateView" owner:self options:nil];
        self=array[0];
        

        NSLayoutConstraint * layout2 = self.twospacing;
        layout2.constant = (Main_Screen_Width-192)/3 ;
        NSLayoutConstraint * layout3 = self.threespacing;
        layout3.constant = (Main_Screen_Width-192)/3 ;
        NSLayoutConstraint * layout4 = self.fourspacing;
        layout4.constant = (Main_Screen_Width-192)/3 ;


               
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
