//
//  SetVC.m
//  BMProject
//
//  Created by WangKaifeng on 16/2/19.
//  Copyright © 2016年 王凯锋. All rights reserved.
//

#import "SetVC.h"
#import "setCell.h"
#import "AppConfigure.h"
#import "AccountVC.h"
#import "MeassageViewController.h"
#import "CurrencyViewController.h"
#import "HelpViewController.h"
#import "VersiondetectionViewController.h"
@interface SetVC () <UITableViewDataSource, UITableViewDelegate> {
    
}
@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@end

@implementation SetVC


- (void)viewDidLoad {
    [super viewDidLoad];
    
    if([[UIDevice currentDevice].systemVersion doubleValue] > 7.0)
        self.edgesForExtendedLayout = UIRectEdgeNone;
    self.title = @"设置";
    [self setBackButtonItem:@selector(backHome) backImage:@"back"];
    
    
    self.myTableView.showsVerticalScrollIndicator = NO;
    [self.myTableView registerNib:[UINib nibWithNibName:@"setCell" bundle:nil] forCellReuseIdentifier:@"mycell"];
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    self.myTableView.tableFooterView = [[UIView alloc]init];
    self.myTableView.scrollEnabled =NO;
}

- (void)backHome{
    
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"backkkk" object:nil];
    
    [self.navigationController popViewControllerAnimated:YES];
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
    return 3;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(section == 1){
        NSLog(@"4");
        return 4;
    }
     NSLog(@"1");
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdenifer = @"mycell";
    setCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdenifer];
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    if (section == 0) {
        if (row == 0) {
            cell.textLabel.text = @"账号与安全";
        }
    } else if (section == 1) {
        if (row == 0) {
            cell.textLabel.text = @"新消息通知";
        }
        else if (row == 1) {
            cell.textLabel.text = @"通用";
        }
        else if (row == 2){
            cell.textLabel.text = @"帮助与反馈";
        }
        else {
            cell.textLabel.text = @"关于微点";
        }
    }else{
        
            cell.textLabel.text = @"联系客服";
        
            cell.detailTextLabel.text = @"400-029-1101";
    }
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSInteger row = indexPath.row;
    NSInteger section = indexPath.section;
    
    if (section == 0) {
        if (row == 0) {
            [self.navigationController pushViewController:[AccountVC new] animated:YES];
        }
    } else if (section == 1) {
        if (row == 0) {
         
       [self.navigationController pushViewController:[MeassageViewController new] animated:YES];
            
        }
        else if (row == 1) {
            
        [self.navigationController pushViewController:[CurrencyViewController new] animated:YES];
            
        }
        else if (row == 2){
        
       [self.navigationController pushViewController:[HelpViewController new] animated:YES];
        }
        else {
         
         [self.navigationController pushViewController:[VersiondetectionViewController new] animated:YES];
            
        }
    } else{
        
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"400-029-1101" message:@"是否拨打客服电话" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alertView show];
        
    }
        
        
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 10;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0.1;
    
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex==1) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel://18702999999"]];
    }
    
}
@end
