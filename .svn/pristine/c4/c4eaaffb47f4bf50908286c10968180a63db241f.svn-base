//
//  GoodsreceiptViewController.m
//  BMProject
//
//  Created by xa on 16/2/26.
//  Copyright © 2016年 王凯锋. All rights reserved.
//

#import "GoodsreceiptViewController.h"
#import "GoodsreceiptTableViewCell.h"
#import "LogisticsinformationViewController.h"
#import "QXYiorderView.h"
@interface GoodsreceiptViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *goodsreceipttableview;

@end

@implementation GoodsreceiptViewController

- (void)backHome{
    
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"backkkk" object:nil];
    
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    if([[UIDevice currentDevice].systemVersion doubleValue] > 7.0)
        self.edgesForExtendedLayout = UIRectEdgeNone;
    self.edgesForExtendedLayout=NO;
    
    self.title = @"待收货";
    [self setBackButtonItem:@selector(backHome) backImage:@"back"];
    [self loadtableview];
    
}

-(void)loadtableview{
    
    self.goodsreceipttableview.showsVerticalScrollIndicator = NO;
    [self.goodsreceipttableview registerNib:[UINib nibWithNibName:@"GoodsreceiptTableViewCell" bundle:nil] forCellReuseIdentifier:@"ordercell"];
    self.goodsreceipttableview.delegate = self;
    self.goodsreceipttableview.dataSource = self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 2;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    QXYiorderView *orderview = [[QXYiorderView alloc]init];
    return orderview;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *rouse = @"ordercell";
    GoodsreceiptTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:rouse];
    
    [cell.confirmreceiptbut addTarget:self action:@selector(confirmGoodsreceipt) forControlEvents:UIControlEventTouchUpInside];
    
    [cell.logisticsbut addTarget:self action:@selector(logisticsbutdj:) forControlEvents:UIControlEventTouchUpInside];
    
    cell.logisticsbut.tag = indexPath.row;
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 170;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 39;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0.01;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    
}

-(void)confirmGoodsreceipt{
    
    
}


-(void)logisticsbutdj : (UIButton *)sender{
    
    LogisticsinformationViewController *logistivc = [[LogisticsinformationViewController alloc]init];
    
    [self.navigationController pushViewController:logistivc animated:YES];
    
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
