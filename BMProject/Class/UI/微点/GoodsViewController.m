//
//  GoodsViewController.m
//  BMProject
//
//  Created by xa on 16/1/26.
//  Copyright © 2016年 王凯锋. All rights reserved.
//

#import "GoodsViewController.h"
#import "ShopheardView.h"
#import "ShopnewTableViewCell.h"
@interface GoodsViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *shoptableview;

@end

@implementation GoodsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
   
    self.title = @"美特斯邦威";
    
    [self setBackBarButton];
  
    self.shoptableview.showsVerticalScrollIndicator = NO;
    [self.shoptableview registerNib:[UINib nibWithNibName:@"ShopnewTableViewCell" bundle:nil] forCellReuseIdentifier:@"shopcell"];
    self.shoptableview.delegate = self;
    self.shoptableview.dataSource = self;

// Do any additional setup after loading the view from its nib.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    ShopheardView *shopview = [[ShopheardView alloc]init];
    return shopview;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 3;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *rouse = @"shopcell";
    ShopnewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:rouse];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 70;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 170;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0.1;
    
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
