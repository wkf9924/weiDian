//
//  HelpViewController.m
//  BMProject
//
//  Created by xa on 16/2/24.
//  Copyright © 2016年 王凯锋. All rights reserved.
//

#import "HelpViewController.h"
#import "PlaceholderTextView.h"
@interface HelpViewController ()<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *aView;
@property (weak, nonatomic) IBOutlet UITextField *textField;


//字数的限制
@property (nonatomic, strong)UILabel *wordCountLabel;
//邮箱
@property (nonatomic, assign)BOOL emailRight;
//手机
@property (nonatomic, assign)BOOL phoneRight;
//QQ
@property (nonatomic, assign)BOOL qqRight;

@property (nonatomic, strong) PlaceholderTextView * textView;

@property (weak, nonatomic) IBOutlet UIButton *sendButton;
- (IBAction)tjbutton:(id)sender;



@end

@implementation HelpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if([[UIDevice currentDevice].systemVersion doubleValue] > 7.0)
        self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.title = @"反馈意见";
    [self setBackBarButton];
    

    [self didloadTextview];
    
        //[self addContactInformation];
    
    // Do any additional setup after loading the view from its nib.
}

-(void)didloadTextview{
    
    self.wordCountLabel = [[UILabel alloc]initWithFrame:CGRectMake(MainWidth-60 ,  self.textView.frame.size.height-20, 60, 19)];
    _wordCountLabel.font = [UIFont systemFontOfSize:14.f];
    _wordCountLabel.textColor = [UIColor lightGrayColor];
    self.wordCountLabel.text = @"0/300";
    self.wordCountLabel.backgroundColor = [UIColor whiteColor];
    self.wordCountLabel.textAlignment = NSTextAlignmentRight;
    
    [self.view addSubview:_wordCountLabel];
    [_aView addSubview:self.textView];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    //添加联系方式
    
    _textField.keyboardType = UIKeyboardTypeTwitter;

}
///添加联系方式
-(void)addContactInformation{
    
    _textField.backgroundColor = [UIColor whiteColor];
    _textField.font = [UIFont systemFontOfSize:14.f];
    _textField.placeholder = @"你的联系方式(手机号/电子邮箱)";
    _textField.keyboardType = UIKeyboardTypeTwitter;
    
}

-(PlaceholderTextView *)textView{
    
    if (!_textView) {
        _textView = [[PlaceholderTextView alloc]initWithFrame:CGRectMake(0, 0, self.aView.frame.size.width , self.aView.frame.size.height)];
        _textView.backgroundColor = [UIColor whiteColor];
        _textView.delegate = self;
        _textView.font = [UIFont systemFontOfSize:14.f];
        _textView.textColor = [UIColor blackColor];
        _textView.textAlignment = NSTextAlignmentLeft;
        _textView.editable = YES;
        _textView.layer.cornerRadius = 4.0f;
        _textView.layer.borderColor = kTextBorderColor.CGColor;
        _textView.layer.borderWidth = 0.5;
        _textView.placeholderColor = RGBCOLOR(0x89, 0x89, 0x89);
        _textView.placeholder = @"写下你遇到的问题，或告诉我们你的宝贵意见~";
        
        
    }
    
    return _textView;
}

//把回车键当做退出键盘的响应键  textView退出键盘的操作
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    
    if ([@"\n" isEqualToString:text] == YES)
    {
        [textView resignFirstResponder];
        
        
        return NO;
    }
    
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
#pragma mark -----提交数据
- (IBAction)tjbutton:(id)sender {
    if (self.textView.text.length == 0) {
        
        UIAlertController *alertLength = [UIAlertController alertControllerWithTitle:@"提示" message:@"你输入的信息为空，请重新输入" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *suer = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        [alertLength addAction:suer];
        [self presentViewController:alertLength animated:YES completion:nil];
    }
    else{
        [self isMobileNumber:self.textField.text];
        [self isValidateEmail:self.textField.text];
        [self validateqq : self.textField.text];
        
        if (self.emailRight != 0 || self.phoneRight != 0){
            
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"意见反馈" message:@"亲你的意见我们已经收到，我们会尽快处理" preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *album = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
            }];
            UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
            [alertController addAction:album];
            [alertController addAction:cancel];
            [self presentViewController:alertController animated:YES completion:nil];
        }
        else{
            UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"通知" message:@"你输入的邮箱，QQ号或者手机号错误,请重新输入" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
            [alertC addAction:alertAction];
            [self presentViewController:alertC animated:YES completion:nil];
            
        }
        
        
    }

    
    
}

#pragma mark textField的字数限制

//在这个地方计算输入的字数
- (void)textViewDidChange:(UITextView *)textView
{
    NSInteger wordCount = textView.text.length;
    self.wordCountLabel.text = [NSString stringWithFormat:@"%ld/300",(long)wordCount];
    [self wordLimit:textView];
}
#pragma mark 超过300字不能输入
-(BOOL)wordLimit:(UITextView *)text{
    if (text.text.length < 300) {
//        NSLog(@"%ld",text.text.length);
        self.textView.editable = YES;
        
    }
    else{
        self.textView.editable = NO;
        
    }
    return NO;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [_textView resignFirstResponder];
    [_textField resignFirstResponder];
}

#pragma mark 判断邮箱，手机，QQ的格式
-(BOOL)isValidateEmail:(NSString *)email{
    
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    self.emailRight = [emailTest evaluateWithObject:email];
    return self.emailRight;
    
}

- (BOOL) validateqq :(NSString *)qq

{
    
    NSString *qqRegex = @"^[0-9]+$";
    
    NSPredicate *qqTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",qqRegex];
    self.qqRight = [qqTest evaluateWithObject:qq];
    
    return self.qqRight;
    
}

//验证手机号码的格式

- (BOOL)isMobileNumber:(NSString *)mobileNum
{
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,134,153,180,189
     */
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     12         */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186
     17         */
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189
     22         */
    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:mobileNum] == YES)
        || ([regextestcm evaluateWithObject:mobileNum] == YES)
        || ([regextestct evaluateWithObject:mobileNum] == YES)
        || ([regextestcu evaluateWithObject:mobileNum] == YES))
    {
        self.phoneRight = 1;
        return YES;
    }
    else
    {
        self.phoneRight = 0;
        return NO;
    }
}


@end





