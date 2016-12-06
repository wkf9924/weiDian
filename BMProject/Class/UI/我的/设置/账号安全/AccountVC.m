//
//  AccountVC.m
//  BMProject
//
//  Created by xa on 16/2/23.
//  Copyright © 2016年 王凯锋. All rights reserved.
//

#import "AccountVC.h"
#import "AccountCell.h"
#import "AppConfigure.h"
#import "EmailViewController.h"
#import "MobelOneViewController.h"
#import "MobelViewController.h"
#import "PasswordChangeViewController.h"

@interface AccountVC () <UITableViewDataSource, UITableViewDelegate >
@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@end

@implementation AccountVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"帐号与安全";
    
    [self setBackBarButton];
    
    self.myTableView.showsVerticalScrollIndicator = NO;
    [self.myTableView registerNib:[UINib nibWithNibName:@"AccountCell" bundle:nil] forCellReuseIdentifier:@"mycell"];
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
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

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(section == 0){
        return 2;
    }
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdenifer = @"mycell";
    AccountCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdenifer];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    
//    if (section == 0) {
//        if (row == 0) {
//            cell.titLabel.text = @"微点号";
//        }
//    } else
    if (section == 0) {
        if (row == 0) {
            cell.titLabel.text = @"手机号";
        }
        else if (row == 1) {
            cell.titLabel.text = @"邮箱地址";
        }
    } else {
        if (row == 0) {
            cell.titLabel.text = @"密码保护";
        }
        else if (row == 1) {
            cell.titLabel.text = @"密码修改";
        } else {
            cell.titLabel.text = @"微点安全";
        }
        
    }
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    
     if (section == 0) {
        if (row == 0) {
            [self.navigationController pushViewController:[[MobelViewController alloc] init] animated:YES];
        }
        else {
            [self.navigationController pushViewController:[[EmailViewController alloc] init] animated:YES];
        }
    } else {
        if (row == 0) {
            
        }
        else if (row == 1) {
            [self.navigationController pushViewController:[[PasswordChangeViewController alloc] init] animated:YES];
            
        } else {
            
        }
        
    }
    
    
    

}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 10;
    
}
@end
