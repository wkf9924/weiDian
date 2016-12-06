//
//  ShoppingCartViewController.m
//  BMProject
//
//  Created by xa on 16/3/4.
//  Copyright © 2016年 王凯锋  158682312@qq.com. All rights reserved.
//

#import "ShoppingCartViewController.h"
#import "ShoppingCartTableViewCell.h"
#import "Shopcarheadrview.h"
#import "PlaceorderViewController.h"
#import "UICellButton.h"
@interface ShoppingCartViewController ()<UITableViewDataSource,UITableViewDelegate,ShoppingCarCellDelegate,ShoppingHeaderCellDelegate>{
    
    UINavigationController *navigation;
    
    
}
@property (weak, nonatomic) IBOutlet UITableView *shopcartableview;
@property (strong, nonatomic) IBOutlet UIView *heardview;
@property (nonatomic,strong) NSMutableArray *listArray;
@property (nonatomic,assign) CGFloat totalPrice;
@property (nonatomic,strong) NSMutableArray *rowArray;
@property (nonatomic,assign) NSInteger integernumber;
@end

@implementation ShoppingCartViewController

-(void)initVariable
{
    
    _listArray = [NSMutableArray array];
    
    NSString* path = [[NSBundle mainBundle] pathForResource:@"shopping_json"
                                                     ofType:@"txt"];
    NSString* content = [NSString stringWithContentsOfFile:path
                                                  encoding:NSUTF8StringEncoding
                                                     error:nil];
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:[content dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:nil];
    NSDictionary *sectionDictionary = [dictionary objectForKey:@"data"];
    NSArray *dataArray = [sectionDictionary objectForKey:@"list"];
    for (NSDictionary *dict in dataArray) {
        [dict setValue:@"0" forKey:@"is_Sected"];
        [dict setValue:@"0.00" forKey:@"price"];
        [dict setValue:@"0" forKey:@"quantity"];
        [_listArray addObject:dict];

     }
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"购物车";
    [self setBackButtonItem:@selector(backHome) backImage:@"back"];
    
    [self initVariable];
    [self didloadTableview];
    
   
    
     // Do any additional setup after loading the view from its nib.
}

- (void)backHome{
    
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"backkkk" object:nil];
    
    [self.navigationController popViewControllerAnimated:YES];
}


-(void)didloadTableview{
    
    self.shopcartableview.showsVerticalScrollIndicator = NO;
    [self.shopcartableview registerNib:[UINib nibWithNibName:@"ShoppingCartTableViewCell" bundle:nil] forCellReuseIdentifier:@"shopcell"];
    self.shopcartableview.delegate = self;
    self.shopcartableview.dataSource = self;
    self.shopcartableview.tableHeaderView = self.heardview;
    [_allsecletbut setBackgroundImage:[UIImage imageNamed:@"iconfont-xuanze"] forState:0];
    [_allsecletbut setBackgroundImage:[UIImage imageNamed:@"iconfont-selexuanze"] forState:UIControlStateSelected];
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    Shopcarheadrview *shopview = [[Shopcarheadrview alloc]init];
    
    shopview.delegate = self;
    
    shopview.sectionData = [_listArray objectAtIndex:section];
    shopview.heardviewselecbut.sectionTag = section;
    [shopview reloadData];
    
    return shopview;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSDictionary *dict = _listArray[section];
    NSArray *array = [dict objectForKey:@"cartVoList"];
    return array.count;
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return _listArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *rouse = @"shopcell";
    ShoppingCartTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:rouse];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.delegate = self;
    NSDictionary *dict = _listArray[indexPath.section];
    NSArray *cellDict = [dict objectForKey:@"cartVoList"];
    cell.itemData = cellDict[indexPath.row];
    NSString *isSale = [NSString stringWithFormat:@"%@",[cell.itemData objectForKey:@"isSale"]];
    
    if ([isSale isEqualToString:@"2"]) {
        cell.selecbut.userInteractionEnabled = NO;
        cell.contentView.alpha = 0.5;
    }
    else
    {
        cell.contentView.alpha = 1.0f;
    }
    
    
    cell.selecbut.sectionTag = indexPath.section;
    cell.selecbut.rowTag = indexPath.row;
    NSString *image = cellDict[indexPath.row][@"imagePath"];
    cell.shopimageview.image = [UIImage imageNamed:image];
    cell.goodsname.text = cellDict[indexPath.row][@"category"];
    cell.goodsprice.text = cellDict[indexPath.row][@"price"];
    cell.coloclab.text = cellDict[indexPath.row][@"color"];
    
    NSString *strinteger = [NSString stringWithFormat:@"%@",[cell.itemData objectForKey:@"quantity"]];
    
    _integernumber = [strinteger integerValue];
    
    cell.taxtfildnumber.text = strinteger;

    [cell.minusbut addTarget:self action:@selector(vcminbut:) forControlEvents:UIControlEventTouchUpInside];
    
    [cell.plusbut addTarget:self action:@selector(vcplusbut:) forControlEvents:UIControlEventTouchUpInside];
    
    [cell reloadData];
    return cell;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 140;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 50;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0.1;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    

    
}


-(void) vcminbut :(UICellButton *)sender{
    
    
    
    
    
    
}

-(void) vcplusbut :(UICellButton *)sender{
    
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)buyimmediatelybut:(id)sender {
    
    PlaceorderViewController *placeController = [[PlaceorderViewController alloc] initWithNibName:nil bundle:nil];
    navigation = [[UINavigationController alloc] initWithRootViewController:placeController];
    [self presentViewController:navigation animated:YES completion:^{
        
    }];
    
}

//全选
- (IBAction)wholechange:(UICellButton *)sender {
    
    sender.selected = !sender.selected;
    CGFloat allAmount = 0.00f;
    NSInteger allQuantity = 0;
    for (NSMutableDictionary *sectionDictionary in _listArray) {
        CGFloat sectionAmount = 0.00f;
        NSInteger sectionQuantity = 0;
        __weak NSArray *array =(NSArray *)[sectionDictionary objectForKey:@"cartVoList"];
        for (__weak NSMutableDictionary* dictionCell in array) {
            NSString *isSale = [NSString stringWithFormat:@"%@",[dictionCell objectForKey:@"isSale"]];
            if ([isSale isEqualToString:@"1"]) {
                [dictionCell setObject:[[NSNumber alloc] initWithBool:sender.selected?YES:NO] forKey:@"selected"];
                if (sender.selected) {
                    CGFloat realPrice = [[dictionCell objectForKey:@"realPrice"] floatValue];
                    NSInteger quantity = [[dictionCell objectForKey:@"quantity"] integerValue];
                    sectionAmount += realPrice * quantity;
                    sectionQuantity += quantity;
                }
                else
                {
                    sectionQuantity = 0;
                    sectionAmount = 0.00f;
                }
                
                
            }
            
        }
        
        [sectionDictionary setValue:[NSString stringWithFormat:@"%.2f",sectionAmount] forKey:@"price"];
        [sectionDictionary setValue:[NSString stringWithFormat:@"%ld",(long)sectionQuantity] forKey:@"quantity"];
        [sectionDictionary setObject:[[NSNumber alloc] initWithBool:sender.selected?YES:NO] forKey:@"is_Sected"];
        allAmount += sectionAmount;
        allQuantity += sectionQuantity;
    }
    _allPriceLB.text = [NSString stringWithFormat:@"￥%.2f",allAmount];
    _totalPrice = allAmount;
    [_shopcartableview reloadData];

}

-(void)carSelectButtonClicked:(NSDictionary *)item WithIndexPathSection:(NSInteger)section WithIndexPathRow:(NSInteger)row
{
    __weak NSMutableDictionary *sectionDict = _listArray[section];
    BOOL sectionSelected = ![[sectionDict objectForKey:@"is_Sected"] boolValue];
    __weak NSArray *cellArray = [sectionDict objectForKey:@"cartVoList"];
    CGFloat sectionAmount = 0.00f;
    NSInteger sectionQuantity = 0;
    for (__weak NSMutableDictionary *cellDict in cellArray) {
        NSString *isSale = [NSString stringWithFormat:@"%@",[cellDict objectForKey:@"isSale"]];
        if ([isSale isEqualToString:@"1"]) {
            [cellDict setObject:[[NSNumber alloc] initWithBool:sectionSelected?YES:NO] forKey:@"selected"];
            if (sectionSelected) {
                CGFloat realPrice = [[cellDict objectForKey:@"realPrice"] floatValue];
                NSInteger quantity = [[cellDict objectForKey:@"quantity"] integerValue];
                sectionAmount += realPrice * quantity;
                sectionQuantity += quantity;
            }
            else
            {
                sectionAmount = 0.00f;
                sectionQuantity = 0;
            }
        }
        
    }
    
    CGFloat price = [[sectionDict objectForKey:@"price"] floatValue];
    [sectionDict setValue:[NSString stringWithFormat:@"%.2f",sectionAmount] forKey:@"price"];
    [sectionDict setValue:[NSString stringWithFormat:@"%ld",(long)sectionQuantity] forKey:@"quantity"];
    [sectionDict setObject:[[NSNumber alloc] initWithBool:sectionSelected] forKey: @"is_Sected"];
    _totalPrice += sectionAmount - price;
    _allPriceLB.text = [NSString stringWithFormat:@"￥%.2f",_totalPrice];
    if (sectionSelected) {
        BOOL allSelect = YES;
        for (__weak NSDictionary *sectionDict in _listArray) {
            BOOL sectSelected = [[sectionDict objectForKey:@"is_Sected"] boolValue];
            allSelect = allSelect && sectSelected;
        }
        _allsecletbut.selected = allSelect;
    }
    else
    {
        _allsecletbut.selected = NO;
    }
    [_shopcartableview reloadData];
}
#pragma mark------ShoppingCarCellDelegate
-(void)carSelectButtonClicked:(NSDictionary *)item WithSectionIndexPath:(NSInteger)section WithIndexPath:(NSInteger)row
{
    __weak NSMutableDictionary *sectionDict = _listArray[section];
    __weak NSArray *cellArray = [sectionDict objectForKey:@"cartVoList"];
    __weak NSMutableDictionary *cellDict = cellArray[row];
    
    BOOL cellSelected = ![[cellDict objectForKey:@"selected"] boolValue];
    [cellDict setObject:[[NSNumber alloc] initWithBool:cellSelected] forKey:@"selected"];
    BOOL sectionSelected = YES;
    CGFloat currentSectionAmount = 0.00f;
    NSInteger currentSectionQuantity = 0;
    
    for (__weak NSMutableDictionary *dictCell in cellArray) {
        NSString *isSale = [NSString stringWithFormat:@"%@",[dictCell objectForKey:@"isSale"]];
        if ([isSale isEqualToString:@"1"]) {
            //            NSString *isSale = [cellDict objectForKey:@"isSale"];
            BOOL selectedCell = [[dictCell objectForKey:@"selected"] boolValue];
            sectionSelected = sectionSelected && selectedCell;
            CGFloat realPrice = [[dictCell objectForKey:@"realPrice"] floatValue];
            NSInteger quantity = [[dictCell objectForKey:@"quantity"] integerValue];
            if (selectedCell) {
                currentSectionAmount += realPrice * quantity;
                currentSectionQuantity += quantity;
            }
        }
    }
    CGFloat currentSectionPrice = [[sectionDict objectForKey:@"price"] floatValue];
    [sectionDict setValue:[NSString stringWithFormat:@"%.2f",currentSectionAmount] forKey:@"price"];
    [sectionDict setValue:[NSString stringWithFormat:@"%ld",currentSectionQuantity] forKey:@"quantity"];
    [sectionDict setObject:[[NSNumber alloc] initWithBool:sectionSelected] forKey:@"is_Sected" ];
    _totalPrice += currentSectionAmount - currentSectionPrice;
    _allPriceLB.text = [NSString stringWithFormat:@"￥%.2f",_totalPrice];
    if (sectionSelected) {
        for (NSDictionary *dict in _listArray) {
            BOOL secSelect = [[dict objectForKey:@"is_Sected"] boolValue];
            sectionSelected = sectionSelected && secSelect;
        }
        _allsecletbut.selected = sectionSelected;
    }
    else
    {
        _allsecletbut.selected = NO;
    }
    [_shopcartableview reloadData];
    
}



//删除
- (IBAction)deletebut:(UIButton *)sender {
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:@"确定要放弃此次编辑" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alert show];
    
  
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if(buttonIndex == 1){
        
        
       
    }
    
    
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
