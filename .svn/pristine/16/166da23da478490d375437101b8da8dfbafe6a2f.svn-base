//
//  FourViewController.m
//  BMProject
//
//  Created by WangKaifeng on 16/1/5.
//  Copyright © 2016年 王凯锋. All rights reserved.
//

#import "FourViewController.h"
#import "MyinformationViewController.h"
#import "SetVC.h"
#import "OrderViewController.h"
#import "OrderstateView.h"
#import "MywalletViewController.h"
#import "SigninViewController.h"
#import "ShoppingCartViewController.h"
#import "RegisterViewController.h"
#import "UINavigationBar+Awesome.h"
@interface FourViewController ()<UITableViewDataSource,UITableViewDelegate> {
    UINavigationController *nav;
    CGFloat offsetY;
}
@property (strong, nonatomic) IBOutlet UIView *heardView;
@property (strong, nonatomic) IBOutlet UIView *heardtowView;
@property (weak, nonatomic) IBOutlet UIImageView *heardimageview;
@property (weak, nonatomic) IBOutlet UILabel *heardNamelab;
@property (weak, nonatomic) IBOutlet UITableView *mytableview;
@property (weak, nonatomic) IBOutlet UIImageView *sigeImageView;
@property (weak, nonatomic) IBOutlet UIButton *signBut;

@property (weak, nonatomic) IBOutlet UIButton *registerBut;
@property (weak, nonatomic) IBOutlet UIImageView *img;
@property (nonatomic , strong)UILabel * dhlable;

- (IBAction)LoginRegister:(id)sender;

@end

@implementation FourViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //如果么有登录就跳到登录界面
//    [self loginAction];
}

- (void)initNav{
    
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    [self.navigationController.navigationBar lt_setBackgroundColor:[UIColor clearColor]];
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    UIColor * color = [UIColor blackColor];
    offsetY = scrollView.contentOffset.y;
    CGFloat yy = _heardtowView.frame.size.height - self.navigationController.navigationBar.frame.size.height;
    
    
    if (offsetY > 0) {
        
        
        CGFloat alpha =  1-(yy-offsetY)/yy;
        
        [self.navigationController.navigationBar lt_setBackgroundColor:[color colorWithAlphaComponent:alpha]];
        
       
            
//        _dhlable =[[UILabel alloc]init];
//        _dhlable.text = @"我的";
//        [_dhlable sizeToFit];
//        _dhlable.textColor = mRGBAColor(255,255,255,alpha);
//        self.navigationItem.titleView = _dhlable;
  
     
        
    } else{
        [self.navigationController.navigationBar lt_setBackgroundColor:[color colorWithAlphaComponent:0]];
        
    }
    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    if([[UIDevice currentDevice].systemVersion doubleValue] > 7.0)
        self.edgesForExtendedLayout = UIRectEdgeNone;
    
    if([self.heardNamelab.text isEqualToString:@""]){
        
       
        self.mytableview.tableHeaderView = self.heardView;
        
    }else{
        
        self.mytableview.tableHeaderView = self.heardtowView;
        
        
    }
    _mytableview.delegate = self;
    _mytableview.dataSource = self;
    [self initNav];
    
    self.signBut.frame = CGRectMake(MainWidth/2-100, (self.heardtowView.frame.size.height-45), 80, 35);
    self.registerBut.frame = CGRectMake(MainWidth/2+20, (self.heardtowView.frame.size.height-45), 80, 35);
    self.signBut.layer.borderColor = [UIColor grayColor].CGColor;
    [self.signBut.layer setBorderWidth:1.0]; //边框宽度
    [self.signBut.layer setCornerRadius:5];
    self.registerBut.layer.borderColor = [UIColor grayColor].CGColor;
    [self.registerBut.layer setBorderWidth:1.0]; //边框宽度
    [self.registerBut.layer setCornerRadius:5];
    
    //添加点击手势
    UITapGestureRecognizer *portraitTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(editPortraitview)];
    [self.heardView addGestureRecognizer:portraitTap];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(back) name:@"backkkk" object:nil];

    
    
}

- (void)back{
    
    [self scrollViewDidScroll:self.mytableview];
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    OrderstateView *oneview;
    
    if(section == 1){
      
        oneview = [[OrderstateView alloc]init];
}
  
    [oneview setUserInteractionEnabled:YES];
   //待付款
    [oneview.onestatebutton addTarget:self action:@selector(clickViewone:) forControlEvents:UIControlEventTouchUpInside];
   //待收货
    [oneview.twostatebutton addTarget:self action:@selector(clickViewtwo:) forControlEvents:UIControlEventTouchUpInside];
   //已收货
    [oneview.threestatebutton addTarget:self action:@selector(clickViewthree:) forControlEvents:UIControlEventTouchUpInside];
   //已完成
    [oneview.fourstatebutton addTarget:self action:@selector(clickViewfour:) forControlEvents:UIControlEventTouchUpInside];

    return oneview;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if(section == 0){
        
        return 1;
    }
    
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static  NSString *reusa = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reusa];
    
    if(cell == nil){
        
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reusa];
        
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
   
    if(indexPath.section == 1){
        
        if(indexPath.row == 0){
            
            cell.textLabel.text = @"钱包";
            cell.imageView.image = [UIImage imageNamed:@"MoreMyBankCard"];
            
        }else{
            
            cell.textLabel.text = @"微积分";
            cell.imageView.image = [UIImage imageNamed:@"MyCardPackageIcon"];
            
            cell.detailTextLabel.text = @"卡券";
            
}
        
    }else if(indexPath.section == 0){
        
        cell.textLabel.text = @"订单";
        
        cell.imageView.image = [UIImage imageNamed:@"MoreMyAlbum"];
        
        cell.detailTextLabel.text = @"查看全部订单";
        
        
        
    }else{
        if(indexPath.row == 1){
        
        cell.textLabel.text = @"设置";
        
        cell.imageView.image = [UIImage imageNamed:@"MoreSetting"];
        
        }else{
            
        cell.textLabel.text = @"购物车";
            
        cell.imageView.image = [UIImage imageNamed:@"MoreSetting"];
            
        }
    }
    
    cell.detailTextLabel.font = [UIFont systemFontOfSize:14];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0.1;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if(section == 1){
        
        return 80;
    }
    
    return 19;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(indexPath.section == 1){
        
        if(indexPath.row == 0){ //钱包
    
       NAVIGATION_(MywalletViewController)
            
        }else{ //微积分
            
            
        NAVIGATION_(CalculusViewController)
            
            
        }
        
    }else if(indexPath.section == 0){ //订单
        
        NAVIGATION_(OrderViewController)
        
    }else{ //设置
        
        if(indexPath.row == 1){
        
        NAVIGATION_(SetVC)
        
        }else{
        
        NAVIGATION_(ShoppingCartViewController)
            
        }
    
    }
    
    
}

-(void)editPortraitview{
    
        NAVIGATION_(MyinformationViewController)
    
}
//待付款
-(void)clickViewone: (UIButton *)sender{
    
    
       NAVIGATION_(PaymentViewController)
  
}
//待收货
-(void)clickViewtwo: (UIButton *)sender{
    
    
       NAVIGATION_(GoodsreceiptViewController)
    
}
//已收货
-(void)clickViewthree: (UIButton *)sender{
    
    
    NAVIGATION_(AlreadyGoodsViewController)
    
}
//已完成
-(void)clickViewfour: (UIButton *)sender{
    
    NAVIGATION_(CompleteViewController)
    
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

- (IBAction)LoginRegister:(id)sender {

    SigninViewController *groupsController = [[SigninViewController alloc] initWithNibName:nil bundle:nil];
    //nav = [[UINavigationController alloc] initWithRootViewController:groupsController];
   [self presentViewController:groupsController animated:YES completion:^{
        
    }];

}
- (IBAction)geginSter:(id)sender {
    
    RegisterViewController *groupsController = [[RegisterViewController alloc] initWithNibName:nil bundle:nil];
    nav = [[UINavigationController alloc] initWithRootViewController:groupsController];
    [self presentViewController:nav animated:YES completion:^{
        
    }];
    
    
}



@end
