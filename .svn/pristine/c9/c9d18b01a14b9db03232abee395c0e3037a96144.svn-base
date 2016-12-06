//
//  RegisterViewController.m
//  BMProject
//
//  Created by xa on 16/2/29.
//  Copyright © 2016年 王凯锋  158682312@qq.com. All rights reserved.
//

#import "RegisterViewController.h"
#import "IQKeyboardManager.h"
@interface RegisterViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIButton *obtainnumber;
@property (weak, nonatomic) IBOutlet UITextField *wdNickname;
@property (weak, nonatomic) IBOutlet UITextField *rgPhoneText;
@property (weak, nonatomic) IBOutlet UITextField *verificationCodeText;
@property (weak, nonatomic) IBOutlet UITextField *passWorldText;
@property (weak, nonatomic) IBOutlet UIButton *registerBut;


@end

@implementation RegisterViewController

- (void)viewWillAppear:(BOOL)animated{
    [[IQKeyboardManager sharedManager] setEnableAutoToolbar:NO];
    
}

- (void)viewWillDisappear:(BOOL)animated{
    [[IQKeyboardManager sharedManager] setEnableAutoToolbar:YES];
    
}

-(void)initButtonItem{
   
    ViewBorderRadius(self.obtainnumber, 5, 1.0, [UIColor grayColor]);
    
    ViewRadius(self.registerBut, 5);
    
    self.view.backgroundColor = BEIJ_UICOLOR;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if([[UIDevice currentDevice].systemVersion doubleValue] > 7.0)
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.edgesForExtendedLayout=NO;
    self.title = @"注册";
    
    [self setBackButtonItem:@selector(ruturnPreviouspage) backImage:@"back.png"];
    
    [self initButtonItem];
    _wdNickname.delegate = self;
    _rgPhoneText.delegate = self;
    _verificationCodeText.delegate = self;
    _passWorldText.delegate = self;
    
    [_rgPhoneText addTarget:self action:@selector(returnOnKeyboard:) forControlEvents:UIControlEventEditingChanged];
    [_passWorldText addTarget:self action:@selector(returnOnKeyboard:) forControlEvents:UIControlEventEditingChanged];
    [_verificationCodeText addTarget:self action:@selector(returnOnKeyboard:) forControlEvents:UIControlEventEditingChanged];
    
    
    // Do any additional setup after loading the view from its nib.
}



- (IBAction)getVerification:(id)sender
   {
    
    if(!self.rgPhoneText.text || [self.rgPhoneText.text isEqualToString:@""] ){

        ITOAST_ALERT(@"手机号不能为空");

        return;
    }
    if(self.rgPhoneText.text.length != 11 ){


        ITOAST_ALERT(@"请输入正确手机号");

        return;
    }

    //倒计时
    [self performSelector:@selector(refreshTime:) withObject:[NSNumber numberWithInt:60] afterDelay:0];
    

}
- (IBAction)registerBut:(id)sender
{
    
    if(!self.rgPhoneText.text || [self.rgPhoneText.text isEqualToString:@""] ){
        
        
        ITOAST_ALERT(@"手机号不能为空");
        
        return;
    }

    if(self.rgPhoneText.text.length !=11)
    {
        
        
        ITOAST_ALERT(@"请输入正确手机号");
        
        return;
    }
    if(!self.verificationCodeText.text || [self.verificationCodeText.text isEqualToString:@""] ){
        
        
        ITOAST_ALERT(@"验证码不能为空");
        
        return;
    }
    if(!self.passWorldText.text || [self.passWorldText.text isEqualToString:@""] ){
        
        
        ITOAST_ALERT(@"密码不能为空");
        
        return;
    }

    
    
    
}


- (void)returnOnKeyboard:(UITextField *)sender
{
    
if (_rgPhoneText.text.length != 0 && _passWorldText.text.length !=0 && _verificationCodeText.text.length !=0) {
        _registerBut.enabled = YES;
        [_registerBut setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_registerBut setBackgroundImage:[UIImage imageNamed:@"login_btn_red-1"] forState:UIControlStateNormal];
    } else {
        _registerBut.enabled = NO;
        [_registerBut setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_registerBut setBackgroundImage:[UIImage imageNamed:@"login_btn_gray-1"] forState:UIControlStateNormal];
        
    }
    
}



#pragma mark 倒计时
- (void)refreshTime:(NSNumber *)number
{
    if ([number integerValue] == 0)
    {
    self.obtainnumber.userInteractionEnabled=YES;
    [self.obtainnumber setTitle:@"获取验证码" forState:UIControlStateNormal];
    }
    else
    {
    self.obtainnumber.userInteractionEnabled=NO;
    int i = [number intValue];
    [self.obtainnumber setTitle:[NSString stringWithFormat:@"%i秒后重发",i] forState:UIControlStateNormal];
    [self performSelector:@selector(refreshTime:) withObject:[NSNumber numberWithInt:i-1] afterDelay:1];
    }
}

- (void)ruturnPreviouspage

{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField

{
    
    [textField resignFirstResponder];
    
    
    return YES;
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

- (void)testAction {
    NSLog(@"asdfadfasdfasdfasdfasdf");
}

@end
