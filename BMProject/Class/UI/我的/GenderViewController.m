//
//  GenderViewController.m
//  BMProject
//
//  Created by xa on 16/1/31.
//  Copyright © 2016年 王凯锋. All rights reserved.
//

#import "GenderViewController.h"
#import "Single.h"

@interface GenderViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *arraySex;
    NSInteger  *current;
}
@property (weak, nonatomic) IBOutlet UITableView *gendertableview;

@end

@implementation GenderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if([[UIDevice currentDevice].systemVersion doubleValue] > 7.0)
        self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.title = @"性别";
    
    [self setBackBarButton];
    
    self.gendertableview.dataSource = self;
    
    self.gendertableview.delegate = self;
    
    self.gendertableview.tableFooterView = [[UIView alloc]init];
    
    arraySex =@[@"男", @"女",@"保密"];
    
    // Do any additional setup after loading the view from its nib.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return arraySex.count;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static  NSString *reusa = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reusa];
    
    if(cell == nil){
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reusa];
        
    }
    cell.textLabel.text = arraySex[indexPath.row];
    
    //cell.accessoryType = UITableViewCellAccessoryCheckmark;
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 45;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSArray *array = [tableView visibleCells];
    for (UITableViewCell *cell in array) {
        [cell setAccessoryType:UITableViewCellAccessoryNone];
        cell.textLabel.textColor=[UIColor blackColor];
        
    }
    UITableViewCell *cell=[self.gendertableview cellForRowAtIndexPath:indexPath];
    cell.textLabel.textColor=[UIColor blueColor];
    [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
    
    NSString *sexStr =   arraySex[indexPath.row];
    COM.sexString = sexStr;
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSIndexPath *index=[tableView indexPathForSelectedRow];
    
    if (index.row==indexPath.row&& index!=nil)
    {
        cell.backgroundColor=[UIColor colorWithRed:232.0/255.0 green:232.0/255.0 blue:232.0/255.0 alpha:1.0];
        cell.textLabel.textColor=[UIColor colorWithRed:0.0 green:206.0/255.0 blue:192.0/255.0 alpha:1.0];
    }
    else
    {
        cell.backgroundColor=[UIColor clearColor];
        cell.textLabel.textColor=[UIColor blackColor];
    }
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
