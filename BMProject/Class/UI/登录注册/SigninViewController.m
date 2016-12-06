//
//  SigninViewController.m
//  BMProject
//
//  Created by xa on 16/2/29.
//  Copyright © 2016年 王凯锋  158682312@qq.com. All rights reserved.
//

#import "SigninViewController.h"
#import "RegisterViewController.h"
#import "ForgetPasswordViewController.h"
#import "IQKeyboardManager.h"

@interface SigninViewController ()<UITextFieldDelegate>{
    
    UINavigationController *nav;
    
    
}
@property (weak, nonatomic) IBOutlet UITextField *accountNumber;
@property (weak, nonatomic) IBOutlet UITextField *passWorld;
@property (weak, nonatomic) IBOutlet UIButton *registerBut;
@property (weak, nonatomic) IBOutlet UILabel *lmLable;
@property (weak, nonatomic) IBOutlet UIImageView *lmImageView;
@property (weak, nonatomic) IBOutlet UIView *blackView;
@property (weak, nonatomic) IBOutlet UIButton *loinBUtton;

@end

@implementation SigninViewController

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:YES];
    
    [self politelanguage];
    
    [[IQKeyboardManager sharedManager] setEnableAutoToolbar:NO];

    
}

- (void)viewWillDisappear:(BOOL)animated{
    
    [[IQKeyboardManager sharedManager] setEnableAutoToolbar:YES];
    
}


-(void)initButtonItem{
    
    UIButton *rightButton = [[UIButton alloc]initWithFrame:CGRectMake(10,25,20,20)];
    
    [rightButton setImage:[UIImage imageNamed:@"back.png"]forState:UIControlStateNormal];
    
    [rightButton addTarget:self action:@selector(ruturnPreviouspage) forControlEvents:UIControlEventTouchUpInside];
    
    
    UILabel *signinLable = [[UILabel alloc]initWithFrame:CGRectMake(Main_Screen_Width/2-50, 25, 100, 30)];
    
    signinLable.textAlignment = NSTextAlignmentCenter;
    
    signinLable.text = @"登陆";
    
    signinLable.font = SYSTEMFONT(18);
    
    signinLable.textColor = [UIColor whiteColor];
    
    [self.view addSubview:signinLable];
    
    
   // UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    
    [self.view addSubview:rightButton];
    
    
    [_accountNumber addTarget:self action:@selector(returnOnKeyboard:) forControlEvents:UIControlEventEditingChanged];
    [_passWorld addTarget:self action:@selector(returnOnKeyboard:) forControlEvents:UIControlEventEditingChanged];
    
    
   // self.navigationItem.leftBarButtonItem= rightItem;
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    

    
    if([[UIDevice currentDevice].systemVersion doubleValue] > 7.0)
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.edgesForExtendedLayout=NO;
    
    self.title = @"登录";
    
    
   [self initButtonItem];
   [self attributeSet];
    _accountNumber.delegate = self;
    _passWorld.delegate = self;
    
    
    
    
    // Do any additional setup after loading the view from its nib.
}

-(void)politelanguage{
    
    NSDate *today = [NSDate date];

    NSDateFormatter *date =[[NSDateFormatter alloc]init];

    [date setDateFormat:@"yyyy年MM月dd日HH时mm分ss秒"];

    NSString *date1 = [date stringFromDate:today];
    NSString *phoneone = [date1 substringWithRange:NSMakeRange(11, 2)];
    int dataS = [phoneone intValue];

    if(dataS>=0 && dataS <= 10){
        
        self.lmLable.text = @"早上好!";
        self.lmImageView.image = [UIImage imageNamed:@"mc.jpg"];
        
    }else if(dataS > 10 && dataS < 18){
        
        self.lmLable.text = @"下午好!";
        self.lmImageView.image = [UIImage imageNamed:@"nc.jpg"];
    }else{
        
        self.lmLable.text = @"晚上好!";
        self.lmImageView.image = [UIImage imageNamed:@"nnc.jpg"];
        
    }

    
    
}

-(void)attributeSet{

    
    ViewBorderRadius(self.registerBut, 20, 1.0, [UIColor grayColor]);
    ViewRadius(self.lmImageView,30);
    
    _blackView.layer.cornerRadius = 5.0;
    _blackView.alpha = 0.7;
    _blackView.backgroundColor = [UIColor whiteColor];
    
    
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

-(void)ruturnPreviouspage{
    
   [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (IBAction)signinBut:(id)sender {
    
    [self.accountNumber resignFirstResponder];
    [self.passWorld resignFirstResponder];
    
    if(!self.accountNumber.text || [self.accountNumber.text isEqualToString:@""] ){
        
        ITOAST_ALERT(@"手机号不能为空");
        
        return;
    }
    
    if(self.accountNumber.text.length !=11)
    {
        
        ITOAST_ALERT(@"请输入正确手机号");
        
        return;
    }
    
    if(!self.passWorld.text || [self.passWorld.text isEqualToString:@""] ){
        
        ITOAST_ALERT(@"密码不能为空");
        
        return;
    }

    [self storelist];
  
    
}

#pragma mark 登陆接口
- (void)storelist {
    
    //封装参数 memberalias  password
NSDictionary *dict = @{@"memberalias":self.accountNumber.text,
                           @"password":self.passWorld.text
                           };
    
    NSString *stringJson = [dict toJsonString];
    
    NSDictionary *jsonDic = @{@"mData" : stringJson};
    
//    [IanAlert showloading];
    //拼接链接
    NSString *url = [NSString stringWithFormat:@"%@%@",kSERVER,LOGIN_USER];
    
//    [self checkNetWork];
    [AFNetworkTool jsonPostStringRequestWithUrl:url params:jsonDic success:^(id data) {
        
//        [IanAlert hideLoading];
        
        NSLog(@"data:%@", data);
        
        
    } fail:^{
        
    }];
    
    
}

- (IBAction)registerbutton:(id)sender {
    
    RegisterViewController *groupsController = [[RegisterViewController alloc] initWithNibName:nil bundle:nil];
    nav = [[UINavigationController alloc] initWithRootViewController:groupsController];
    [self presentViewController:nav animated:YES completion:^{
        
    }];
    
}

- (IBAction)forgetpasswordnut:(id)sender {
    
    
    ForgetPasswordViewController *groupsController = [[ForgetPasswordViewController alloc] initWithNibName:nil bundle:nil];
    nav = [[UINavigationController alloc] initWithRootViewController:groupsController];
    [self presentViewController:nav animated:YES completion:^{
        
    }];
    
    
//    ForgetPasswordViewController *registervc = [[ForgetPasswordViewController  alloc]init];
//    [self.navigationController pushViewController:registervc animated:YES];

}

//  判断满足条件按钮才可以显示和点击
- (void)returnOnKeyboard:(UITextField *)sender
{
    
    if (_accountNumber.text.length != 0 && _passWorld.text.length !=0 ) {
        _loinBUtton.enabled = YES;
        [_loinBUtton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_loinBUtton setBackgroundImage:[UIImage imageNamed:@"login_btn_red-1"] forState:UIControlStateNormal];
    } else {
        _loinBUtton.enabled = NO;
        [_loinBUtton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_loinBUtton setBackgroundImage:[UIImage imageNamed:@"login_btn_gray-1"] forState:UIControlStateNormal];
        
    }
    
}





- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    
    
    return YES;
}


@end
