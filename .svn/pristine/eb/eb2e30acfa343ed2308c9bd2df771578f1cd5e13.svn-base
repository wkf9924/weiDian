//
//  PlaceorderViewController.m
//  BMProject
//
//  Created by xa on 16/3/4.
//  Copyright © 2016年 王凯锋  158682312@qq.com. All rights reserved.
//

#import "PlaceorderViewController.h"
#import "PlaceorderTableViewCell.h"
#import "MyaddressViewController.h"
#import "PamenModeViewController.h"

@interface PlaceorderViewController ()<UITableViewDataSource,UITableViewDelegate>{
    
    UIView *view;
}
@property (weak, nonatomic) IBOutlet UITableView *placeordertableview;
@property (strong, nonatomic) IBOutlet UIView *tabheardview;
@property (strong, nonatomic) IBOutlet UIView *tabfootview;
@property (strong, nonatomic) IBOutlet UIView *hideview;
@property (weak, nonatomic) IBOutlet UIView *clickhideview;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *distancewidth;
@property (weak, nonatomic) IBOutlet UILabel *changepayment;

@end

@implementation PlaceorderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if([[UIDevice currentDevice].systemVersion doubleValue] > 7.0)
        self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.title = @"提交订单";
    
    [self modificationbut];
    [self didloadTableview];
    
  
    
    //添加点击手势
    UITapGestureRecognizer *portraitTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(editPortraitview)];
    [self.clickhideview addGestureRecognizer:portraitTap];
    
    //添加点击手势
    UITapGestureRecognizer *newtapges = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(newlybuildaddress)];
    [self.tabheardview addGestureRecognizer:newtapges];
    
   //重写leftback
    UIButton *leftButton = [[UIButton alloc]initWithFrame:CGRectMake(0,0,20,20)];
    
    [leftButton setImage:[UIImage imageNamed:@"back.png"]forState:UIControlStateNormal];
    
    [leftButton addTarget:self action:@selector(ruturnPreviouspage) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    
    self.navigationItem.leftBarButtonItem= leftItem;

    
    
    // Do any additional setup after loading the view from its nib.
}
-(void)modificationbut{
    
    self.onlinebutton.layer.borderWidth = 0.7;
    
    [ self.onlinebutton.layer setCornerRadius:5]; //设置矩形四个圆角半径
    
    self.onlinebutton.layer.borderColor = COLOR_FOR_RGB(236,184,184,1).CGColor;
    
    self.deliverybutton.layer.borderWidth = 0.7;
    
    [ self.deliverybutton.layer setCornerRadius:5]; //设置矩形四个圆角半径
    
    self.deliverybutton.layer.borderColor = COLOR_FOR_RGB(223,224,224,1).CGColor;

}

-(void)didloadTableview{
    
    self.placeordertableview.showsVerticalScrollIndicator = NO;
    [self.placeordertableview registerNib:[UINib nibWithNibName:@"PlaceorderTableViewCell" bundle:nil] forCellReuseIdentifier:@"placecell"];
    self.placeordertableview.delegate = self;
    self.placeordertableview.dataSource = self;
    self.placeordertableview.tableHeaderView = self.tabheardview;
    self.placeordertableview.tableFooterView = self.tabfootview;
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *rouse = @"placecell";
    PlaceorderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:rouse];
   
    

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 80;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 10;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0.1;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
}

NSInteger flag = 0;
CGFloat y = 0;

-(void)editPortraitview{
    
    flag ++;
    

    if(flag%2 == 1){
    
        self.hideview.hidden = NO;
       _distancewidth.constant = 40;
        y = 40;
      [self.cutonehairbut setBackgroundImage:[UIImage imageNamed:@"iconfont-shangjiantou"] forState:UIControlStateNormal];
    
    }else{
        
        self.hideview.hidden = YES;
        _distancewidth.constant = 10;
        y = 0;
       [self.cutonehairbut setBackgroundImage:[UIImage imageNamed:@"iconfont-xiajiantou"] forState:UIControlStateNormal];
        
     }
    
    view = [[UIView alloc]initWithFrame:CGRectMake(0,40 , MainWidth, y)];
    [view addSubview:self.hideview];
    [self.tabfootview addSubview:view];
    [self.placeordertableview reloadData];
    
}

-(void)newlybuildaddress{
    
MyaddressViewController *myaddressvc = [[MyaddressViewController alloc]init];
    [self.navigationController pushViewController:myaddressvc animated:YES];
    
    
}
- (IBAction)onlinebut:(id)sender {
    
    self.onlinebutton.layer.borderColor = COLOR_FOR_RGB(236,184,184,1).CGColor;
    self.deliverybutton.layer.borderColor = COLOR_FOR_RGB(223,224,224,1).CGColor;
    
    [self.onlinebutton setTitleColor:COLOR_FOR_RGB(255,127,0,1) forState:UIControlStateNormal];
    [self.deliverybutton setTitleColor:COLOR_FOR_RGB(223,224,224,1) forState:UIControlStateNormal];
    self.changepayment.text = @"在线支付";
    
}
- (IBAction)deliverybut:(id)sender {
    
    self.onlinebutton.layer.borderColor = COLOR_FOR_RGB(223,224,224,1).CGColor;
    self.deliverybutton.layer.borderColor = COLOR_FOR_RGB(236,184,184,1).CGColor;
    [self.deliverybutton setTitleColor:COLOR_FOR_RGB(255,127,0,1) forState:UIControlStateNormal];
    
    [self.onlinebutton setTitleColor:COLOR_FOR_RGB(223,224,224,1) forState:UIControlStateNormal];
    self.changepayment.text = @"货到付款";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)ruturnPreviouspage {
  
 UIAlertView *alerview = [[UIAlertView alloc] initWithTitle:@"在有一步就可以抢到宝贝了！" message:@"" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"走你",nil];
    [alerview show];


}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if(buttonIndex == 1){
        [self dismissViewControllerAnimated:YES completion:nil];
        
    }
    
}

- (IBAction)goPaymentBut:(id)sender {
    
    PamenModeViewController *paymentmodevc = [[PamenModeViewController alloc]init];
    
    [self.navigationController pushViewController:paymentmodevc animated:YES];
    
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
