//
//  ApplymoneyViewController.m
//  BMProject
//
//  Created by xa on 16/3/19.
//  Copyright © 2016年 王凯锋  158682312@qq.com. All rights reserved.
//

#import "ApplymoneyViewController.h"
#import "PlaceorderTableViewCell.h"
#import "ZHPickView.h"

@interface ApplymoneyViewController ()<UITableViewDataSource,UITableViewDelegate,UITextViewDelegate,ZHPickViewDelegate>{
    
    NSArray *pickarray;
    
    ZSPTextView *textView;
}
@property (weak, nonatomic) IBOutlet UITableView *applymoneyTableview;
@property(nonatomic,strong)ZHPickView *pickview;
@end

@implementation ApplymoneyViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    if([[UIDevice currentDevice].systemVersion doubleValue] > 7.0)
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.edgesForExtendedLayout=NO;
    
    
    [self setBackButtonItem:@selector(ruturnPreviouspage) backImage:@"back"];
    
    self.title = @"申请退款";
    
    [self setDoneBarButtonWithSelector:@selector(submitbut) andTitle:@"提交"];
    
    [self loadtableview];
    // Do any additional setup after loading the view from its nib.
}
-(void)loadtableview{
    
    
    pickarray = @[@"宝贝质量问题",@"物流太慢",@"客服人员服务不好",@"不想买了"];
    
    self.applymoneyTableview.showsVerticalScrollIndicator = NO;
    [self.applymoneyTableview registerNib:[UINib nibWithNibName:@"PlaceorderTableViewCell" bundle:nil] forCellReuseIdentifier:@"ordercell"];
    self.applymoneyTableview.dataSource = self;
    self.applymoneyTableview.delegate = self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return  3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    if(indexPath.section == 0){
        
        static NSString *rouse = @"ordercell";
        PlaceorderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:rouse];
        return cell;
        
        
        
    }else if(indexPath.section == 1){
        
        static NSString *reuse = @"cell";
        UITableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:reuse];
        if (cell==nil) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuse];
        }
        
        UILabel *testlable = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 100, 35)];
        
        testlable.text = @"退款理由";
        testlable.font = [UIFont systemFontOfSize:15];
        testlable.textColor = [UIColor darkGrayColor];
        cell.selectionStyle =  UITableViewCellSelectionStyleNone;
        [cell.contentView addSubview: testlable];
        UIButton *pickbutton = [[UIButton alloc]initWithFrame:CGRectMake(MainWidth-100, 0, 100, 35)];
        [pickbutton setTitle:@"常见理由" forState:UIControlStateNormal];
        [pickbutton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [pickbutton addTarget:self action:@selector(reasonbut) forControlEvents:UIControlEventTouchUpInside];
        
        pickbutton.titleLabel.font= [UIFont systemFontOfSize:15];
        pickbutton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        
        [cell.contentView addSubview:pickbutton];
        
        
        return cell;

        }else {
        
        static NSString *reuse = @"cell";
        UITableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:reuse];
        if (cell==nil) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuse];
        }
        
        textView  = [[ZSPTextView alloc]init];
        textView.frame = CGRectMake(10, 10, SCREEN_WIDTH-20 , 90);
        textView.backgroundColor = [UIColor lightTextColor];
      
        textView.placeholder = @"您申请退款的详细理由:";
        textView.textColor = [UIColor lightGrayColor];
        textView.font =  [UIFont systemFontOfSize:14];
        textView.layer.borderColor =  [UIColor groupTableViewBackgroundColor].CGColor;
        textView.layer.borderWidth = 1;
        textView.delegate = self;
        textView.returnKeyType =  UIReturnKeyDone;
        [cell.contentView addSubview:textView];
        
        cell.selectionStyle =  UITableViewCellSelectionStyleNone;
        return cell;

    }
    

}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0){
        
        return 90;
    }else if(indexPath.section == 1){
        
        return 40;
    }
    
    return 110;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if(section == 2){
        
        return 0.01;
    }
    
    return 5;
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0.001;
    
}

-(void)reasonbut{
    
    
    
    if(_pickview){
        [_pickview remove];
    }
    
    _pickview=[[ZHPickView alloc] initPickviewWithArray:pickarray isHaveNavControler:YES];
    _pickview.delegate=self;
    
    [_pickview setPickViewColer:[UIColor whiteColor]];
    [_pickview setTintColor:[UIColor blackColor]];
   
    [_pickview show];
    
    
}

-(void)toobarDonBtnHaveClick:(ZHPickView *)pickView resultString:(NSString *)resultString{
    
   NSLog(@"resultString%@",resultString);
   textView.text = resultString;

}

-(void)ruturnPreviouspage {
    
    [_pickview remove];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

-(void)submitbut{
    
    
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
