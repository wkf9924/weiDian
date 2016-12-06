//
//  AddaddressViewController.m
//  BMProject
//
//  Created by xa on 16/1/30.
//  Copyright © 2016年 王凯锋. All rights reserved.
//

#import "AddaddressViewController.h"
#import "PlaceholderTextView.h"
#import "AddressPickView.h"
@interface AddaddressViewController ()<UIAlertViewDelegate,UITextFieldDelegate,UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *peoplename;
@property (weak, nonatomic) IBOutlet UITextField *phonenumber;
@property (weak, nonatomic) IBOutlet UITextField *regionalinformation; //地址
@property (weak, nonatomic) IBOutlet UITextField *postcodenumber;
@property (weak, nonatomic) IBOutlet UIView *placetextView;
- (IBAction)djbut:(id)sender;
@property (nonatomic, strong) PlaceholderTextView * textView;
@property (nonatomic, strong) UIToolbar *toolBar;

@end
@implementation AddaddressViewController



- (void)ruturnPreviouspage {
   
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:@"确定要放弃此次编辑" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alert show];
    
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if(buttonIndex == 1){
        
        [self dismissViewControllerAnimated:YES completion:nil];

    }
    
}

- (IBAction)preservationbut:(id)sender {
   
    if(!self.peoplename.text || [self.peoplename.text isEqualToString:@""] ){
        
        ITOAST_ALERT(@"姓名不能为空");
        
        return;
    }
    if(!self.phonenumber.text || [self.phonenumber.text isEqualToString:@""] ){
        
        ITOAST_ALERT(@"手机号不能为空");
        
        return;
    }
    
   if(![self isMobileNumber:self.phonenumber.text] ){
    
        ITOAST_ALERT(@"手机号不正确");
      
        return;
    
    }
    
    if(!self.regionalinformation.text || [self.regionalinformation.text isEqualToString:@""] ){
        
        ITOAST_ALERT(@"请选择地区");
        
        return;
    }
    
    if(!self.textView.text || [self.textView.text isEqualToString:@""] ){
        
        ITOAST_ALERT(@"请填写详细地址");
        
        return;
    }


    
    

}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    
    
    return YES;
}

//光标选中 
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {

    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {



}



#pragma mark -- wkf

- (UIToolbar *)toolBar{
    if (_toolBar == nil) {
        self.toolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 44)];
        _toolBar.barTintColor=[UIColor brownColor];
        UIBarButtonItem *item1=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        UIBarButtonItem *item2=[[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(click)];
        _toolBar.items = @[item1, item2];
    }
    return _toolBar;
}

- (void)click{
    if (_regionalinformation.isFirstResponder) {
        [_regionalinformation resignFirstResponder];
//        _regionalinformation.text = [NSString stringWithFormat:@"%@%@%@",self.addressView.province,self.addressView.city,self.addressView.area];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    if([[UIDevice currentDevice].systemVersion doubleValue] > 7.0)
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.edgesForExtendedLayout=NO;
    
    self.title = @"新建地址";
    
    [self setBackButtonItem:@selector(ruturnPreviouspage) backImage:@"back.png"];
   
    [self setDoneBarButtonWithSelector:@selector(preservationbut:) andTitle:@"提交"];
   
    self.regionalinformation.delegate = self;
    self.peoplename.delegate = self;
    self.phonenumber.delegate = self;
    self.postcodenumber.delegate = self;
    [self.placetextView addSubview:self.textView];
    self.view.backgroundColor = mRGBColor(246,246,246);
    
}



- (IBAction)djbut:(id)sender {
    
    AddressPickView *addressPickView = [AddressPickView shareInstance];
    [self.view addSubview:addressPickView];
    addressPickView.block = ^(NSString *province,NSString *city,NSString *town){
        
    _regionalinformation.text = [NSString stringWithFormat:@"%@ %@ %@",province,city,town] ;
        
    };
}

-(PlaceholderTextView *)textView{
    
    if (!_textView) {
        _textView = [[PlaceholderTextView alloc]initWithFrame:CGRectMake(0, 0, self.placetextView.frame.size.width, self.placetextView.frame.size.height)];
        _textView.backgroundColor = [UIColor whiteColor];
        _textView.delegate = self;
        _textView.font = [UIFont systemFontOfSize:14.f];
        _textView.textColor = [UIColor blackColor];
        _textView.textAlignment = NSTextAlignmentLeft;
        _textView.editable = YES;
        _textView.layer.cornerRadius = 4.0f;
        _textView.layer.borderColor = kTextBorderColor.CGColor;
        _textView.layer.borderWidth = 0;
        _textView.placeholderColor = RGBCOLOR(213, 213, 217);
        _textView.placeholder = @"街道门牌信息";
        
    }
    
    return _textView;
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
