//
//  OrderViewController.m
//  BMProject
//
//  Created by xa on 16/2/25.
//  Copyright © 2016年 王凯锋. All rights reserved.
//

#import "OrderViewController.h"
#import "OrderTableViewCell.h"
#import "QXYiorderView.h"
@interface OrderViewController ()<UITableViewDataSource,UITableViewDelegate>{
   
    NSMutableArray *ordersumArray;
    NSMutableArray *orderinfoArray;
    
}
@property (weak, nonatomic) IBOutlet UITableView *ordertableview;

@end

@implementation OrderViewController


-(void)initArray{
    
    ordersumArray = [NSMutableArray new];
    orderinfoArray = [NSMutableArray new];
    
}

- (void)backHome{
    
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"backkkk" object:nil];
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if([[UIDevice currentDevice].systemVersion doubleValue] > 7.0)
        self.edgesForExtendedLayout = UIRectEdgeNone;
    self.title = @"全部订单";
    [self setBackButtonItem:@selector(backHome) backImage:@"back"];
    
    
    [self initArray];
    
    //查看订单
    [self orderLoading];
    
//    [self loadtableview];
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];


}

#pragma -mark 获取用户订单
- (void)orderLoading {
    
    /**
     *  订单接口
     */
    NSString *userId = [COM byUserId];
    NSDictionary *orderDic = @{@"memberid" : userId};
    //装成json字符串
    NSString *orderJSON = [orderDic toJsonString];
    
    NSDictionary *orderJonsDic = @{@"mData" : orderJSON};
    
    //拼接链接
    NSString *orderURL = [NSString stringWithFormat:@"%@%@", kSERVER, ORDERLIST_UER];
    
    
    [AFNetworkTool jsonPostStringRequestWithUrl:orderURL params:orderJonsDic success:^(id data) {
        
        NSDictionary *dicData = [[data toJsonString] toJsonDictionary];
        
        ordersumArray = dicData[@"data"];
        
        [self.ordertableview reloadData];
        
        NSLog(@"--%ld",(unsigned long)ordersumArray.count);
        
    } fail:^{
        
    }];

}

-(void)loadtableview{
    
    self.ordertableview.showsVerticalScrollIndicator = NO;
    [self.ordertableview registerNib:[UINib nibWithNibName:@"OrderTableViewCell" bundle:nil] forCellReuseIdentifier:@"ordercell1"];
    self.ordertableview.delegate = self;
    self.ordertableview.dataSource = self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return ordersumArray.count;
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
   
    QXYiorderView *orderview = [[QXYiorderView alloc]init];
    orderview.yordername.text = ordersumArray[section][@"orderid"];
    orderview.yorderstate.text = ordersumArray[section][@"orderstatus"];
    

    return orderview;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    orderinfoArray = ordersumArray[section][@"orderinfo"];
  
    
    return 5;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *rouse = @"ordercell1";
    OrderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:rouse];
    

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
