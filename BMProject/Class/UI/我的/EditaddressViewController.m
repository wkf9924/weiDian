//
//  EditaddressViewController.m
//  BMProject
//
//  Created by xa on 16/3/18.
//  Copyright © 2016年 王凯锋  158682312@qq.com. All rights reserved.
//

#import "EditaddressViewController.h"
#import "PlaceholderTextView.h"
#import "AddressPickView.h"


@interface EditaddressViewController ()<UIAlertViewDelegate,UITextFieldDelegate,UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *peoplename;
@property (weak, nonatomic) IBOutlet UITextField *phonenumber;
@property (weak, nonatomic) IBOutlet UITextField *regionalinformation; //地址
@property (weak, nonatomic) IBOutlet UITextField *postcodenumber;
@property (weak, nonatomic) IBOutlet UIView *placetextView;
@property (nonatomic, strong) PlaceholderTextView * textView;
@property (nonatomic, strong) UIToolbar *toolBar;

@end

@implementation EditaddressViewController

- (void)ruturnPreviouspage {
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

//光标选中
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    
    
    
}

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
    
    self.title = @"新建地址";
    
    [self setbutton];
    self.onlinepayment.layer.borderWidth = 0.7;
    
    [ self.onlinepayment.layer setCornerRadius:5]; //设置矩形四个圆角半径
    
    self.onlinepayment.layer.borderColor = COLOR_FOR_RGB(236,184,184,1).CGColor;
    
    self.cashonDelivery.layer.borderWidth = 0.7;
    
    [ self.cashonDelivery.layer setCornerRadius:5]; //设置矩形四个圆角半径
    
    self.cashonDelivery.layer.borderColor = COLOR_FOR_RGB(223,224,224,1).CGColor;
    
    
    self.regionalinformation.delegate = self;
    self.peoplename.delegate = self;
    [self.placetextView addSubview:self.textView];
    
    
    
    // Do any additional setup after loading the view from its nib.
}

-(void)setbutton{
    
    UIButton *leftButton = [[UIButton alloc]initWithFrame:CGRectMake(0,0,20,20)];
    
    [leftButton setImage:[UIImage imageNamed:@"back.png"]forState:UIControlStateNormal];
    
    [leftButton addTarget:self action:@selector(ruturnPreviouspage) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    
    self.navigationItem.leftBarButtonItem= leftItem;
    
    UIBarButtonItem * rightBarButton = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(sureClick:)];
    self.navigationItem.rightBarButtonItem = rightBarButton;
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)changeaddress:(id)sender {
    
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




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
