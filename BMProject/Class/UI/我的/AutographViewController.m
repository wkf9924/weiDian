//
//  AutographViewController.m
//  BMProject
//
//  Created by xa on 16/1/31.
//  Copyright © 2016年 王凯锋. All rights reserved.
//

#import "AutographViewController.h"
#import "PlaceholderTextView.h"


@interface AutographViewController ()<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *autgraphView;

@property (nonatomic, strong) PlaceholderTextView * textView;

//字数的限制
@property (nonatomic, strong)UILabel *wordCountLabel;
@end

@implementation AutographViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if([[UIDevice currentDevice].systemVersion doubleValue] > 7.0)
        self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.title = @"个性签名";
    
    [self setBackBarButton];
    [self setDoneBarButtonWithSelector:@selector(buttonBc) andTitle:@"保存"];
    
    self.wordCountLabel = [[UILabel alloc]initWithFrame:CGRectMake(MainWidth-60 ,  self.textView.frame.size.height-15, 60, 15)];
    _wordCountLabel.font = [UIFont systemFontOfSize:14.f];
    _wordCountLabel.textColor = [UIColor lightGrayColor];
    self.wordCountLabel.text = @"0/30";
    self.wordCountLabel.backgroundColor = [UIColor whiteColor];
    self.wordCountLabel.textAlignment = NSTextAlignmentRight;
    
    [self.view addSubview:_wordCountLabel];
    [_autgraphView addSubview:self.textView];
    
    self.automaticallyAdjustsScrollViewInsets = NO;

    // Do any additional setup after loading the view from its nib.
}

-(PlaceholderTextView *)textView{
    
    if (!_textView) {
        _textView = [[PlaceholderTextView alloc]initWithFrame:CGRectMake(0,0, self.autgraphView.frame.size.width, self.autgraphView.frame.size.height)];
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
        _textView.placeholder = @"个性签名";
        
    }
    
    return _textView;
}


//在这个地方计算输入的字数
- (void)textViewDidChange:(UITextView *)textView
{
    NSInteger wordCount = textView.text.length;
    self.wordCountLabel.text = [NSString stringWithFormat:@"%ld/30",(long)wordCount];
    [self wordLimit:textView];
}
#pragma mark 超过300字不能输入
-(BOOL)wordLimit:(UITextView *)text{
    if (text.text.length < 30) {
       
        self.textView.editable = YES;
        
    }
    else{
        self.textView.editable = NO;
        
    }
    return NO;
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [_textView resignFirstResponder];
   
}

-(void)buttonBc{
    
    
    
    
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
