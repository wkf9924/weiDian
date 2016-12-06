//
//  PaymentViewController.m
//  BMProject
//
//  Created by xa on 16/2/26.
//  Copyright © 2016年 王凯锋. All rights reserved.
//

#import "PaymentViewController.h"
#import "PaymenTableViewCell.h"
#import "QXYiorderView.h"
#import "PamenModeViewController.h"



@interface PaymentViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *paymentableview;

@end

@implementation PaymentViewController

- (void)backHome{
    
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"backkkk" object:nil];
    
    [self.navigationController popViewControllerAnimated:YES];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"待付款";
    [self setBackButtonItem:@selector(backHome) backImage:@"back"];

    [self loadtableview];
    
}

-(void)loadtableview{
    
    self.paymentableview.showsVerticalScrollIndicator = NO;
    [self.paymentableview registerNib:[UINib nibWithNibName:@"PaymenTableViewCell" bundle:nil] forCellReuseIdentifier:@"ordercell"];
    self.paymentableview.delegate = self;
    self.paymentableview.dataSource = self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    QXYiorderView *orderview = [[QXYiorderView alloc]init];
    orderview.yorderstate.text = @"待付款";
    
    return orderview;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *rouse = @"ordercell";
    PaymenTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:rouse];

    [cell.paymentbut addTarget:self action:@selector(moRenClick:) forControlEvents:UIControlEventTouchUpInside];
    
    cell.paymentbut.tag = indexPath.section;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 130;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 39;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0.01;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    
}

-(void)moRenClick : (UIButton *)sender{

PamenModeViewController *paymentmodevc = [[PamenModeViewController alloc]init];
    
 [self.navigationController pushViewController:paymentmodevc animated:YES];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
