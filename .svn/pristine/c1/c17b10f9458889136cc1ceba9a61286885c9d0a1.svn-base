//
//  ForgetPasswordViewController.m
//  BMProject
//
//  Created by xa on 16/2/29.
//  Copyright © 2016年 王凯锋  158682312@qq.com. All rights reserved.
//

#import "ForgetPasswordViewController.h"
#import "ModifyApasswordViewController.h"
#import "IQKeyboardManager.h"
@interface ForgetPasswordViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIButton *obtaincode;
@property (weak, nonatomic) IBOutlet UITextField *numberPhone;
@property (weak, nonatomic) IBOutlet UITextField *passWorld;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;

@end

@implementation ForgetPasswordViewController

- (void)viewWillAppear:(BOOL)animated{
    [[IQKeyboardManager sharedManager] setEnableAutoToolbar:NO];
    
}

- (void)viewWillDisappear:(BOOL)animated{
    [[IQKeyboardManager sharedManager] setEnableAutoToolbar:YES];
    
}

-(void)initButton{
    
    UIButton *rightButton = [[UIButton alloc]initWithFrame:CGRectMake(0,0,20,20)];
    
    [rightButton setImage:[UIImage imageNamed:@"back.png"]forState:UIControlStateNormal];
    
    [rightButton addTarget:self action:@selector(ruturnPreviouspage) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    
    self.navigationItem.leftBarButtonItem= rightItem;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    if([[UIDevice currentDevice].systemVersion doubleValue] > 7.0)
        self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.title = @"找回密码";
   // [self setBackBarButton];
    
    [self initButton];
    ViewBorderRadius(self.obtaincode, 5, 1.0, [UIColor grayColor]);
    
    
    self.numberPhone.delegate = self;
     self.passWorld.delegate = self;
    
    [_numberPhone addTarget:self action:@selector(returnOnKeyboard:) forControlEvents:UIControlEventEditingChanged];
    [_passWorld addTarget:self action:@selector(returnOnKeyboard:) forControlEvents:UIControlEventEditingChanged];
    
    

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)obtainbutton:(id)sender {
    
    if(!self.numberPhone.text || [self.numberPhone.text isEqualToString:@""] ){
        
        ITOAST_ALERT(@"手机号不能为空");
        
        return;
    }
    if(self.numberPhone.text.length != 11 ){
        
        
        ITOAST_ALERT(@"请输入正确手机号");
        
        return;
    }
    
    //倒计时
    [self performSelector:@selector(refreshTime:) withObject:[NSNumber numberWithInt:60] afterDelay:0];
    
    
    


}
- (IBAction)nextstepbut:(id)sender {
    
    if(!self.numberPhone.text || [self.numberPhone.text isEqualToString:@""] ){
        
        ITOAST_ALERT(@"手机号不能为空");
        
        return;
    }
    if(self.numberPhone.text.length != 11 ){
        
        
        ITOAST_ALERT(@"请输入正确手机号");
        
        return;
    }
    
    if(!self.passWorld.text || [self.passWorld.text isEqualToString:@""] ){
        
        
        ITOAST_ALERT(@"验证码不能为空");
        
        return;
    }
    
    
    ModifyApasswordViewController *passwordvc = [[ModifyApasswordViewController alloc]init];
    [self.navigationController pushViewController:passwordvc animated:YES];
    
}

- (void)returnOnKeyboard:(UITextField *)sender
{
    
    if (_numberPhone.text.length != 0 && _passWorld.text.length !=0 ) {
        _nextButton.enabled = YES;
        [_nextButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_nextButton setBackgroundImage:[UIImage imageNamed:@"login_btn_red-1"] forState:UIControlStateNormal];
    } else {
        _nextButton.enabled = NO;
        [_nextButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_nextButton setBackgroundImage:[UIImage imageNamed:@"login_btn_gray-1"] forState:UIControlStateNormal];
        
    }
    
}




#pragma mark 倒计时
- (void)refreshTime:(NSNumber *)number
{
    if ([number integerValue] == 0)
    {
        self.obtaincode.userInteractionEnabled=YES;
        [self.obtaincode setTitle:@"获取验证码" forState:UIControlStateNormal];
    }
    else
    {
        self.obtaincode.userInteractionEnabled=NO;
        int i = [number intValue];
        [self.obtaincode setTitle:[NSString stringWithFormat:@"%i秒后重发",i] forState:UIControlStateNormal];
        [self performSelector:@selector(refreshTime:) withObject:[NSNumber numberWithInt:i-1] afterDelay:1];
    }
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    
    
    return YES;
}

-(void)ruturnPreviouspage{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
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
