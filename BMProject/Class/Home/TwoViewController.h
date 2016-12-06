//
//  TwoViewController.h
//  BMProject
//
//  Created by WangKaifeng on 16/1/5.
//  Copyright © 2016年 王凯锋. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImage+SCImage.h"
#import "UIBarButtonItem+SCBarButtonItem.h"
@interface TwoViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIView *headerView;
@property (weak, nonatomic) IBOutlet UIImageView *bsimageVIew;
@property (weak, nonatomic) IBOutlet UIImageView *snimageView;
- (IBAction)bsButton:(id)sender;
- (IBAction)snButton:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *cellView;
@property (weak, nonatomic) IBOutlet UILabel *sectionLab;


@end
