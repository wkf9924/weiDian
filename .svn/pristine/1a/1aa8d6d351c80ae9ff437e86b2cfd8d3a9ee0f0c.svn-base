//
//  CompleteViewController.m
//  BMProject
//
//  Created by xa on 16/2/26.
//  Copyright © 2016年 王凯锋. All rights reserved.
//

#import "CompleteViewController.h"
#import "CompleteTableViewCell.h"
#import "QXYiorderView.h"
#import "CommentViewController.h"
@interface CompleteViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *completetableview;

@end

@implementation CompleteViewController


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
    
    self.title = @"已完成";
    [self setBackButtonItem:@selector(backHome) backImage:@"back"];
    [self loadtableview];
    
}
-(void)loadtableview{
    
    self.completetableview.showsVerticalScrollIndicator = NO;
    [self.completetableview registerNib:[UINib nibWithNibName:@"CompleteTableViewCell" bundle:nil] forCellReuseIdentifier:@"ordercell"];
    self.completetableview.delegate = self;
    self.completetableview.dataSource = self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 2;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    QXYiorderView *orderview = [[QXYiorderView alloc]init];
    orderview.yorderstate.text = @"已完成";
    
    return orderview;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *rouse = @"ordercell";
    CompleteTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:rouse];
    
    [cell.commentbut addTarget:self action:@selector(pushcomment:) forControlEvents:UIControlEventTouchUpInside];
    cell.commentbut.tag = indexPath.row;
    
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

-(void) pushcomment :(UIButton *)sender {
    
    CommentViewController *commentvc = [[CommentViewController alloc]init];
    [self.navigationController pushViewController:commentvc animated:YES];
    
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
