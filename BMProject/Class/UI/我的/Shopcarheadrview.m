//
//  Shopcarheadrview.m
//  BMProject
//
//  Created by xa on 16/3/4.
//  Copyright © 2016年 王凯锋  158682312@qq.com. All rights reserved.
//

#import "Shopcarheadrview.h"

@implementation Shopcarheadrview

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        NSArray *array = [[NSBundle mainBundle]loadNibNamed:@"Shopcarheadrview" owner:self options:nil];
        self=array[0];
     
  [_heardviewselecbut setBackgroundImage:[UIImage imageNamed:@"iconfont-xuanze"] forState:UIControlStateNormal];
  [_heardviewselecbut setBackgroundImage:[UIImage imageNamed:@"iconfont-selexuanze"] forState:UIControlStateSelected];
        
        
            }
    return self;
}



- (void)reloadData
{
    if (self.sectionData) {
        _titleLable.text = [self.sectionData objectForKey:@"companyName"];
        _heardviewselecbut.selected = [[self.sectionData objectForKey:@"is_Sected"] boolValue];
    }
}


- (IBAction)selectRowBtnClick:(UICellButton *)sender {
    
    UICellButton *button = (UICellButton *)sender;
    if ([self.delegate respondsToSelector:@selector(carSelectButtonClicked:WithIndexPathSection:WithIndexPathRow:)]) {
        [self.delegate carSelectButtonClicked:self.sectionData WithIndexPathSection:button.sectionTag WithIndexPathRow:button.rowTag];
    }

    
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
