//
//  PamenModeViewController.m
//  BMProject
//
//  Created by xa on 16/3/23.
//  Copyright © 2016年 王凯锋  158682312@qq.com. All rights reserved.
//

#import "PamenModeViewController.h"
#import "PamenModeTableViewCell.h"
#import "WXApi.h"
#import "payRequsestHandler.h"
#import "ApiXml.h"
#import "WXUtil.h"
#import "AlipayHeader.h"

@interface PamenModeViewController ()<UITableViewDataSource,UITableViewDelegate>{
    
    NSArray *paymentarray;
    int current;
    
    
}
@property (strong, nonatomic) IBOutlet UITableView *paymenTableview;

@end

@implementation PamenModeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if([[UIDevice currentDevice].systemVersion doubleValue] > 7.0)
        self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.title = @"微点支付中心";
    
    [self setBackBarButton];
    
    [self loadtableview];
    
    self.view.backgroundColor = RGBCOLOR(237, 237, 237);
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(wxpayhuidiao:) name:@"ZHIFU-weixin" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(alipayHuidiao:) name:@"ZHIFU-BAO" object:nil];
    
    // Do any additional setup after loading the view from its nib.
}

-(void)loadtableview{
    
    current  = 0;
   
    self.impaymentbut.layer.borderWidth = 0.7;
    
    [ self.impaymentbut.layer setCornerRadius:5]; //设置矩形四个圆角半径
    
    self.impaymentbut.layer.borderColor = COLOR_FOR_RGB(236,184,184,1).CGColor;
    
    
    paymentarray = @[@"微信支付",@"支付宝支付",@"网银支付"];
    
    CGFloat height = self.heardView.frame.size.height+paymentarray.count*60;

    self.paymenTableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, MainWidth,height ) style:UITableViewStylePlain] ;
    [self.paymenTableview registerNib:[UINib nibWithNibName:@"PamenModeTableViewCell" bundle:nil] forCellReuseIdentifier:@"paymentcell"];
    self.paymenTableview.delegate = self;
    self.paymenTableview.dataSource = self;
    self.paymenTableview.tableHeaderView = self.heardView;
    //self.paymenTableview.tableFooterView = [[UIView alloc]init];
    self.paymenTableview.scrollEnabled =NO;
    self.paymenTableview.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.paymenTableview];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return paymentarray.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *rouse = @"paymentcell";
    PamenModeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:rouse];
    
    cell.choiceBut.tag = indexPath.row;
    
    if (current == indexPath.row) {
        [cell.choiceBut setImage:[UIImage imageNamed:@"iconfont-selexuanze"] forState:UIControlStateNormal];
    }else{
        [cell.choiceBut setImage:[UIImage imageNamed:@"iconfont-xuanze"] forState:UIControlStateNormal];
    }
    
    [cell.choiceBut addTarget:self action:@selector(moRenClick:) forControlEvents:UIControlEventTouchUpInside];
    
    cell.pamentName.text = paymentarray[indexPath.row];
    NSArray *paylogoarray = @[@"Pwlogo",@"Pzlogo",@"Pulogo"];
    
    cell.paymentImage.image = [UIImage imageNamed:paylogoarray[indexPath.row]];
    
    if([cell.pamentName.text isEqualToString:@"微信支付"]){
       
        cell.recommendImage.image = [UIImage imageNamed:@"按钮标签"];
        
    }
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   
   PamenModeTableViewCell *currentCell = (PamenModeTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    
    current = (int)currentCell.choiceBut.tag;
    [self.paymenTableview reloadData];
    
}

-(void)moRenClick : (UIButton *)sender{
    
    current = (int)sender.tag;
    [self.paymenTableview reloadData];
    
}

//点击调用支付接口
- (IBAction)paymenbut:(id)sender {
    
    
switch (current) {
        case 0:
        
        //微信支付
        [self bizPay];
        
            break;
            
        case 1:
        
        //支付宝支付
        [self  Alipayment];
            NSLog(@"+++++++++++");
            
            break;
            
        case 2:
            
            NSLog(@"==============");
            
            break;
            
        default:
            break;
    }
    
  }


- (void)bizPay {
    
    
    NSString *ad = @"139";
    
    NSString *moneyStr = [NSString stringWithFormat:@"%i",[ad integerValue]*100];
   
    [self wxpay:@"150" orderName:@"订单支付" orderMoney:moneyStr];
    
}
//调起微信支付
- (void)wxpay:(NSString *)orderNo orderName:(NSString *)orderName orderMoney:(NSString *)orderMoney
{
    //DLog(@"-微信---%@ %@",orderName,orderNo);
    //    cstrOrderNumber =  orderNo;
    [WXApi registerApp:@"wxd43dc866323c77c7" withDescription:@"车尚生活汇"];
    //创建支付签名对象
    payRequsestHandler *req = [payRequsestHandler alloc];
    //初始化支付签名对象
    [req init:@"wxd43dc866323c77c7" mch_id:@"1292635601"];
    //设置密钥
    [req setKey:@"yaFengcheshangshenghuohui1727625"];
    
    //获取到实际调起微信支付的参数后，在app端调起支付
    NSMutableDictionary *dict = [req sendPay_demo:orderNo orderPrice:orderMoney orderName:orderName notifyUrl:@"145"];
    
    if(dict == nil){
        //错误提示
        
        [self showErrorHud:@"失败"];
    
    }else{
        
        NSMutableString *stamp  = [dict objectForKey:@"timestamp"];
        //调起微信支付
        PayReq* req             = [[PayReq alloc] init];
        req.openID              = [dict objectForKey:@"appid"];
        req.partnerId           = [dict objectForKey:@"partnerid"];
        req.prepayId            = [dict objectForKey:@"prepayid"];
        req.nonceStr            = [dict objectForKey:@"noncestr"];
        req.timeStamp           = stamp.intValue;
        req.package             = [dict objectForKey:@"package"];
        req.sign                = [dict objectForKey:@"sign"];
        
        [WXApi sendReq:req];
        //DLog(@"%@  %@  %@",req.prepayId,req.nonceStr,req.sign);
        //payNumber = req.prepayId;
        
    }
    
    
}

//微信回调
-(void)wxpayhuidiao:(NSNotification *)notify{
   
    NSDictionary * dic = notify.userInfo;
    switch ([dic[@"code"]integerValue]) {
        case WXSuccess:
            //成功回调
        {
            
            
            
//            NSDictionary *payDic = @{@"id":_orderID ,
//                                     @"paynum":payNumber,
//                                     @"paytypes":@3
//                                     };
//           
//            
//            RequestManager *requestManager = [[RequestManager alloc]init];
//            [requestManager orderPay:payDic complete:^(NSDictionary *dictionary) {
//               
//                if ([dictionary[@"str"] intValue]==1) {
//                    [self showSuccessHud:dictionary[@"msg"]];
//                    
//                }else{
//                    [self showErrorHud:dictionary[@"msg"]];
//                    
//                }
//                [self goBack];
//                
//            }];
            
            
            
        }
            break;
        case WXErrCodeCommon:
            //失败
        {
            [self goBack];
            [self showErrorHud:@"交易失败"];
            
        }
            break;
        case WXErrCodeUserCancel:
            //取消
        {
            [self goBack];
            [self showErrorHud:@"交易已取消"];
            
        }
            break;
        case WXErrCodeSentFail:
            //成功回调
        {
            [self goBack];
            [self showErrorHud:@"交易失败"];
            
        }
            break;
        case WXErrCodeAuthDeny:
            //成功回调
        {
            [self goBack];
            [self showErrorHud:@"授权失败"];
            
        }
            break;
        case WXErrCodeUnsupport:
            //成功回调
        {
            [self goBack];
            [self showErrorHud:@"交易失败"];
            
        }
            break;
            
            
        default:
            break;
    }
    
}
-(void)goBack{
    
    [self setBackBarButton];
    
}


-(void)Alipayment{
    
    [AlipayRequestConfig alipayWithPartner:kPartnerID seller:kSellerAccount tradeNO:[AlipayToolKit genTradeNoWithTime] productName:@"邮票" productDescription:@"全真邮票" amount:@"0.8" notifyURL:kNotifyURL itBPay:@"30m"];
    
}

-(void)alipayHuidiao:(NSNotification *)noti{






}
    // Do any additional setup after loading the view from its nib.


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
