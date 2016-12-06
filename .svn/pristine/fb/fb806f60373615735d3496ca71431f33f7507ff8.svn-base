//
//  MyaddressViewController.m
//  BMProject
//
//  Created by xa on 16/1/30.
//  Copyright © 2016年 王凯锋. All rights reserved.
//

#import "MyaddressViewController.h"
#import "AddaddressViewController.h"
#import "AddressTableViewCell.h"
#import "EditaddressViewController.h"

@interface MyaddressViewController ()<UITableViewDataSource,UITableViewDelegate>{
    
    NSMutableArray *addressarray;
    NSArray *address;
    NSArray *addressphone;
    UINavigationController *navigation;
    int current;
    NSDictionary *dict;
    
}
@property (weak, nonatomic) IBOutlet UITableView *myaddresstableview;

@end

@implementation MyaddressViewController


//懒加载数组
- (NSMutableArray *)photoArrayM{
    if (!addressarray) {
        addressarray = [NSMutableArray arrayWithCapacity:0];
    }
    return addressarray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    if([[UIDevice currentDevice].systemVersion doubleValue] > 7.0)
        self.edgesForExtendedLayout = UIRectEdgeNone;
    
    
    address = @[
                @{@"name":@"王凯锋",
                  @"xinxi":@[@{
                                  @"address":@"陕西省西安市雁塔区锦业一路陕西省西安市雁塔区锦业路绿地领海A座",
                                  @"phone":@"18092199242",
                                  
                                  },
                            
                              ]
                  },
                
                
                @{@"name":@"何星江",
                  @"xinxi":@[@{
                                  @"address":@"陕西省西安市雁塔区锦业一路",
                                  @"phone":@"18092199242",
                                  
                                  },
                            
                              ]
                  },

    
                ];
    
    [self setBackBarButton];
     self.title = @"我的地址";
     current  = 1;
    self.myaddresstableview.delegate = self;
    self.myaddresstableview.dataSource = self;
    self.myaddresstableview.tableFooterView = [[UIView alloc]init];
    
    self.myaddresstableview.showsVerticalScrollIndicator = NO;
    [self.myaddresstableview registerNib:[UINib nibWithNibName:@"AddressTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    
    
    // Do any additional setup after loading the view from its nib.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return address.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSArray *array = address[section][@"xinxi"];
    return array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static  NSString *reusa = @"cell";
    AddressTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reusa];
   cell.addressname.text = address[indexPath.section][@"name"];
   cell.address.text = address[indexPath.section][@"xinxi"][indexPath.row][@"address"];
   NSString *phonestr = address[indexPath.section][@"xinxi"][indexPath.row][@"phone"];
  
  NSString *phoneone = [phonestr substringWithRange:NSMakeRange(0, 3)];
  NSString *phonetwo= [phonestr substringFromIndex:7];
  NSString *phonesthree = [NSString stringWithFormat:@"%@****%@",phoneone,phonetwo];
  
  cell.addressphone.text = phonesthree;
 
  cell.editaddress.tag = indexPath.section;
  
  cell.setdefaultbut.tag = indexPath.section;
    
  [cell.editaddress addTarget:self action:@selector(editaddressmethod:) forControlEvents:UIControlEventTouchUpInside];
  [cell.delectImg addTarget:self action:@selector(delectClick:) forControlEvents:UIControlEventTouchUpInside];
    
   [cell.setdefaultbut addTarget:self action:@selector(moRenClick:) forControlEvents:UIControlEventTouchUpInside];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (current == indexPath.section) {
        [cell.setdefaultbut setImage:[UIImage imageNamed:@"default"] forState:UIControlStateNormal];
    }else{
        [cell.setdefaultbut setImage:[UIImage imageNamed:@"default－no.png"] forState:UIControlStateNormal];
    }
    
     return cell;

  }

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    CGFloat hight =  [self GetheightfromString:address[indexPath.section][@"xinxi"][indexPath.row][@"address"] font:[UIFont systemFontOfSize:13] width:SCREEN_WIDTH-16];
    
    return hight +102;

}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0.1;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 10;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    


}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)addbut:(id)sender {
    
    AddaddressViewController *placeController = [[AddaddressViewController alloc] initWithNibName:nil bundle:nil];
    navigation = [[UINavigationController alloc] initWithRootViewController:placeController];
    [self presentViewController:navigation animated:YES completion:^{
        
    }];
    
}
-(void)moRenClick : (UIButton *)sender{
    
    current = (int)sender.tag;
    [self.myaddresstableview reloadData];
    
}


-(void)editaddressmethod : (UIButton *)sender{
    
//    EditaddressViewController *editController = [[EditaddressViewController alloc] initWithNibName:nil bundle:nil];
//    navigation = [[UINavigationController alloc] initWithRootViewController:editController];
//    [self presentViewController:navigation animated:YES completion:^{
//        
//    }];
    
    
    AddaddressViewController *placeController = [[AddaddressViewController alloc] initWithNibName:nil bundle:nil];
    navigation = [[UINavigationController alloc] initWithRootViewController:placeController];
    [self presentViewController:navigation animated:YES completion:^{
        
    }];
    
    

}

- (void)delectClick:(UIButton *)sender{
    UIAlertView *alertView= [[UIAlertView alloc]initWithTitle:@"提示" message:@"你确定删除该地址" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"删除", nil];
    [alertView show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex==1) {
        
    }else{
        
    }
}

-(CGFloat)GetheightfromString:(NSString *)string font:(UIFont *)font width:(CGFloat)width{
    if (font == nil) {
        font =  [UIFont systemFontOfSize:15.f];
    }
    CGSize textSize = [string boundingRectWithSize:CGSizeMake(width, MAXFLOAT)
                                           options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                        attributes:@{NSFontAttributeName: font}
                                           context:nil].size;
    return textSize.height ;
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
