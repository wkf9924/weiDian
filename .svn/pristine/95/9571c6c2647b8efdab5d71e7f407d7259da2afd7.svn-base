//
//  ModifyApasswordViewController.m
//  BMProject
//
//  Created by xa on 16/3/1.
//  Copyright © 2016年 王凯锋  158682312@qq.com. All rights reserved.
//

#import "ModifyApasswordViewController.h"
#import "IQKeyboardManager.h"
@interface ModifyApasswordViewController ()<UITextFieldDelegate>

@end

@implementation ModifyApasswordViewController


- (void)viewWillAppear:(BOOL)animated{
    [[IQKeyboardManager sharedManager] setEnableAutoToolbar:NO];
    
}

- (void)viewWillDisappear:(BOOL)animated{
    [[IQKeyboardManager sharedManager] setEnableAutoToolbar:YES];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    if([[UIDevice currentDevice].systemVersion doubleValue] > 7.0){
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
     self.title = @"修改密码";
     [self setBackBarButton];
    
    _passworldNew.delegate = self;
    _confNewPass.delegate = self;
    
    
    [_passworldNew addTarget:self action:@selector(returnOnKeyboard:) forControlEvents:UIControlEventEditingChanged];
    [_confNewPass addTarget:self action:@selector(returnOnKeyboard:) forControlEvents:UIControlEventEditingChanged];

    
    
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)submitAction:(id)sender {
    
    if(!self.passworldNew.text || [self.passworldNew.text isEqualToString:@""] ){
        
        ITOAST_ALERT(@"新密码不能为空");
        
        return;
    }
    
    if(!self.confNewPass.text || [self.confNewPass.text isEqualToString:@""] ){
        
        ITOAST_ALERT(@"确认新密码不能为空");
        
        return;
    }
    if(self.passworldNew.text != self.confNewPass.text){
        
        ITOAST_ALERT(@"两次密码不一致");
        
        return;
        
    }

    
}


// 判断当满足条件后显示but和点击事件
- (void)returnOnKeyboard:(UITextField *)sender
{
    
    if (_passworldNew.text.length != 0 && _confNewPass.text.length !=0 ) {
        _submitButton.enabled = YES;
        [_submitButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_submitButton setBackgroundImage:[UIImage imageNamed:@"login_btn_red-1"] forState:UIControlStateNormal];
    } else {
        _submitButton.enabled = NO;
        [_submitButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_submitButton setBackgroundImage:[UIImage imageNamed:@"login_btn_gray-1"] forState:UIControlStateNormal];
        
    }
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
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

@end
