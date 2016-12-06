//
//  TwoViewController.m
//  BMProject
//
//  Created by WangKaifeng on 16/1/5.
//  Copyright © 2016年 王凯锋. All rights reserved.
//

#import "TwoViewController.h"
#import "BrandStreetTableViewCell.h"
#import "ChineseString.h"
@interface TwoViewController ()<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate,UISearchDisplayDelegate>{
    
    NSMutableArray *arrayname;
    
    //原始数据处理之后的索引
    NSMutableArray *sectionHeadsKeys;
    //tableview加载的数据
    NSMutableArray *dataForTableView;
    //tableview加载的索引
    NSMutableArray *indexListForTableView;
}
@property (weak, nonatomic) IBOutlet UITableView *bsTableView;

@property (strong, nonatomic) IBOutlet UISearchDisplayController *searchDC;
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;

@property (nonatomic, strong)NSMutableArray *suoyinCityList;

@property (nonatomic, strong)NSMutableArray *array;
@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if([[UIDevice currentDevice].systemVersion doubleValue] > 7.0)
        self.edgesForExtendedLayout = UIRectEdgeNone;
    
    sectionHeadsKeys = [[NSMutableArray alloc]init];
    dataForTableView = [[NSMutableArray alloc]init];
    
    [self loadtableview];
    [self hxsxnax];
    [self xsearchBar];
    
    // 4. 右侧加号按钮
    self.navigationItem.rightBarButtonItem
    = [UIBarButtonItem barButtonItemWithBackgroundImage:[UIImage originalImageNamed:@"iconfont-jiahao(1)"]
                                       highlightedImage:nil
                                                 target:self
                                                 action:@selector(checkMyMessage:)
                                       forControlEvents:UIControlEventTouchUpInside];

    
    
    // Do any additional setup after loading the view from its nib.
}

//加载索引
-(void)hxsxnax{
    
    arrayname = [[NSMutableArray alloc]initWithObjects:@"琳琅小铺",@"A傲娇美容汽车",@"Asmr三耳",@"伊莉媛服饰店",@"小妹店铺",@"饿了吗",@"全球精品美妆馆",@"宅人潮店",@"小三专卖店",@"丰田车行",@"百姓鞋业",@"百雀羚",nil] ;
    
    //重新构造列表数据（按首字母分组、排序） 需要分组：sort=yes
    self.array = [self dataRestructure:arrayname sort:YES];
    
    //初始化列表tableView
    indexListForTableView = sectionHeadsKeys;
    dataForTableView = self.array;
    
}

//ios8.0以下
-(void)xsearchBar{
    
    self.searchBar = [[UISearchBar alloc]init];
    [self.searchBar setScopeButtonTitles:[NSArray arrayWithObjects:@"商品",@"店铺",nil]];
    
    self.searchBar.delegate = self;
   
    [self.searchBar setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    
    [self.searchBar sizeToFit];
    
    self.bsTableView.tableHeaderView = self.searchBar;
   
    self.searchDC = [[UISearchDisplayController alloc] initWithSearchBar:self.searchBar contentsController:self];
    
    self.searchDC.searchContentsController.view.backgroundColor = [UIColor whiteColor];
    
    self.searchDC.delegate = self;
    
}
//选中之后
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault ];
    return YES;
}
//取消选中之后
- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar{
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent ];
    
    return YES;
}

-(void)loadtableview{
    
    self.bsTableView.dataSource = self;
    self.bsTableView.delegate = self;
    // 取消滚动条
    self.bsTableView.showsVerticalScrollIndicator = NO;
    [self.bsTableView registerNib:[UINib nibWithNibName:@"BrandStreetTableViewCell" bundle:nil] forCellReuseIdentifier:@"mycell"];
    //检索字母颜色
    self.bsTableView.sectionIndexColor = [UIColor grayColor];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return  dataForTableView.count+1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section == 0){
        
        return 0;
    }
    return [[dataForTableView objectAtIndex:section-1] count];

}
//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
//   
//    return [indexListForTableView objectAtIndex:section];
//}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if(section == 0){
        
        return _headerView;
   
    }else{
    
    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, 18)];
    view1.backgroundColor = [UIColor whiteColor];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 2,100 , 14)];
    
    label.text = [indexListForTableView objectAtIndex:section-1];
        label.font = [UIFont systemFontOfSize:14];
    view1.backgroundColor = COLOR_FOR_RGB(239,239,244,1);
    [view1 addSubview:label];
       
        
    return view1;
    
    }
    
}
//加载索引
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return indexListForTableView;
}

//点击索引相应的方法
- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    NSInteger count = 0;
    
   for(NSString *character in indexListForTableView)
    {
        if([character isEqualToString:title])
        {
            return count;
        }
        count ++;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdenifer = @"mycell";
    BrandStreetTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdenifer];
    if(indexPath.section == 0){
        
        
    }
    
    //添加索引字母
    ChineseString *_chineseString = [[dataForTableView objectAtIndex:indexPath.section-1] objectAtIndex:indexPath.row];
    
    cell.bsshopnameLab.text = _chineseString.string;
    
    return cell;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 70;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if(section == 0){
        return 87;
    }
    return 18;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0.1;
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle==UITableViewCellEditingStyleDelete) {
        [dataForTableView removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationTop];
        
    }
    
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"取消关注";
}
/**
 *----------------------------------------------------检索字母排序--------------------------------------------
 */
#pragma mark - 自定义方法
//重新构造列表数据（按首字母分组、排序）
//sort yes=需要排序  no=不需要排序
- (NSMutableArray *)dataRestructure:(NSMutableArray *)dataArray sort:(BOOL)sort
{
    NSMutableArray *arrayForTableView = [[NSMutableArray alloc]init];
    NSMutableArray *chineseStringsArray = [[NSMutableArray alloc]init];
    
    //---------------汉字转拼音并排序----开始----------------------------//
    for(int i = 0; i < dataArray.count; i++)
    {
        ChineseString *_chineseString = [[ChineseString alloc]init];
        _chineseString.string = [NSString stringWithFormat:@"%@",dataArray[i]];
        if(_chineseString.string==nil)
        {
            _chineseString.string=@"";
        }
        if(![_chineseString.string isEqualToString:@""])
        {//在对象中加入汉字转换的拼音
            //---------汉字转拼音----开始---------
            NSString *_string = [_chineseString.string mutableCopy];
            CFStringTransform((CFMutableStringRef)_string, NULL, kCFStringTransformMandarinLatin, NO);
            CFStringTransform((CFMutableStringRef)_string, NULL, kCFStringTransformStripDiacritics, NO);
            //---------汉字转拼音----结束---------
            
            //过滤拼音中的空格并保存到对象
            _chineseString.firstChar =  [_string stringByReplacingOccurrencesOfString:@" " withString:@""];
        }
        else
        {
            _chineseString.firstChar = @"";
        }
        [chineseStringsArray addObject:_chineseString];
    }
    
   //按照首字母进行排序
    NSArray *sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"firstChar" ascending:YES]];
    [chineseStringsArray sortUsingDescriptors:sortDescriptors];
    //---------------汉字转拼音并排序----结束----------------------------//
    
    //---------------分组重新打包数据----开始----------------------------//
    if (sort == YES)
    {//需要分组
        BOOL checkValueAtIndex= NO;//大写字母是否已经存在的标识
        NSMutableArray *TempArrForGrouping;
        for(int i = 0; i < [chineseStringsArray count]; i++)
        {
            ChineseString *chineseStr = (ChineseString *)[chineseStringsArray objectAtIndex:i];
            NSString *_firstChar= [[chineseStr.firstChar substringToIndex:1] uppercaseString];
            
            //当前汉字的首字母 在索引中是否存在
            if(![sectionHeadsKeys containsObject:_firstChar])
            {//如果索引中不存在当前首字母 添加到索引 并重新实例化一个分组的数组
                [sectionHeadsKeys addObject:_firstChar];
                TempArrForGrouping = [[NSMutableArray alloc]init];
                checkValueAtIndex = NO;
            }
            
            //如果索引中存在当前汉字首字母，则添加到相应首字母分组，如果不存在，则会添加到重新实例化的分组
            if([sectionHeadsKeys containsObject:_firstChar])
            {//如果索引中存在当前首字母
                [TempArrForGrouping addObject:[chineseStringsArray objectAtIndex:i]];
                
                if(checkValueAtIndex == NO)
                {//如果当前首字母不存在索引中，则在城市列表新添加分组
                    [arrayForTableView addObject:TempArrForGrouping];
                    checkValueAtIndex = YES;
                }
            }
        }
        return arrayForTableView;
        //---------------分组重新打包数据----结束---------------------------//
    }
    else
    {
        //不需要分组
        return chineseStringsArray;
    }
}

/**
 * -------------------------------------------------结束（调皮的横线）----------------------------------------
 */
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

- (void)checkMyMessage:(UIButton *)button {
    
    NSLog(@"--------");
    
}
- (IBAction)bsButton:(id)sender {
    
    UIButton *but = sender;
    but.highlighted = YES;
    
}

- (IBAction)snButton:(id)sender {
}
@end
