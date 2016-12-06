//
//  OneViewController.m
//  BMProject
//
//  Created by WangKaifeng on 16/1/5.
//  Copyright © 2016年 王凯锋. All rights reserved.
//

#import "OneViewController.h"
#import "MyTestViewController.h"
#import "QXwdTableViewCell.h"
#import "UIImage+SCImage.h"
#import "UIBarButtonItem+SCBarButtonItem.h"
#import "GoodsViewController.h"
@interface OneViewController ()<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate,UISearchDisplayDelegate>{
    
    NSInteger _cut;
    UISearchDisplayController *searchDisplayController;
}
@property (weak, nonatomic) IBOutlet UITableView *wdTableView;
@property (nonatomic, strong) UISearchController *searchVC;

@property (strong, nonatomic) IBOutlet UISearchDisplayController *searchDC;
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;

@property (nonatomic ,strong) NSMutableArray *wdarray;
@property (nonatomic,strong) NSMutableArray *saveArr;

@end

@implementation OneViewController

// 懒加载
- (NSMutableArray *)wdarray {
    if (_wdarray == nil) {
        _wdarray = [NSMutableArray array];
    }
    return _wdarray;
}
- (NSMutableArray *)saveArr {
    if (_saveArr == nil) {
        _saveArr = [NSMutableArray array];
    }
    return _saveArr;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadtableview];
    
    
    //获取当前页面字体大小
//    UIFont *newFont = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
//    
//    UIFontDescriptor *ctfFont = newFont.fontDescriptor;
//    
//    NSNumber *fontString = [ctfFont objectForKey:@"NSFontSizeAttribute"];
//    
//    NSLog(@"----==__====%@",fontString);
//    
//    int ss = [fontString intValue]*0.8;
//    
    
    
    
    
    
    //[self checkNetWork];
   
//    NSURL *url = [NSURL URLWithString:@"prefs:root=WIFI"];
//    if ([[UIApplication sharedApplication] canOpenURL:url])
//    {
//        [[UIApplication sharedApplication] openURL:url];
//    }

    self.wdarray = [[NSMutableArray alloc]initWithObjects:@"美特斯邦威",@"美特斯邦威",@"美特斯邦威",@"美特斯邦威",@"美特斯邦威",@"美特斯邦威",@"美特斯邦威",@"美特斯邦威",@"美特斯邦威",@"美特斯邦威", nil];
    
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

-(void)xsearchBar{
    
    self.searchBar = [[UISearchBar alloc]init];
    
    
    self.searchBar.delegate = self;
    
    [self.searchBar setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    
    [self.searchBar sizeToFit];
    
    self.wdTableView.tableHeaderView = self.searchBar;
    
    self.searchDC = [[UISearchDisplayController alloc] initWithSearchBar:self.searchBar contentsController:self];
    
    self.searchDC.searchResultsTableView.backgroundColor = [UIColor whiteColor];
    
    self.searchDC.delegate = self;
    
}
//选中之后
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    //[searchBar setScopeButtonTitles:[NSArray arrayWithObjects:@"商品",@"店铺",nil]];
    
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault ];
    return YES;
}
//取消选中之后
- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar{
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent ];

    return YES;
}
//一旦SearchBar輸入內容有變化，則執行這個方法

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller

shouldReloadTableForSearchString:(NSString *)searchString
{
    
   return YES;
    
}
//一旦Scope Button有變化，則執行這個方法

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller

shouldReloadTableForSearchScope:(NSInteger)searchOption
{
    
    return YES;
    
}


-(void)loadtableview{
    
    self.wdTableView.dataSource = self;
    self.wdTableView.delegate = self;
    // 取消滚动条
    self.wdTableView.showsVerticalScrollIndicator = NO;
    [self.wdTableView registerNib:[UINib nibWithNibName:@"QXwdTableViewCell" bundle:nil] forCellReuseIdentifier:@"mycell"];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
        return self.wdarray.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdenifer = @"mycell";
    QXwdTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdenifer];
    
    cell.wdfilmnameLab.text = self.wdarray[indexPath.row];
    
        if(_cut == 0){
        
        cell.cntLabel.hidden = YES;
      
        }
   

    return cell;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 80;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle==UITableViewCellEditingStyleDelete) {
        [self.wdarray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationTop];
        
    }
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(indexPath.row == 0){
        
        GoodsViewController *goods = [[GoodsViewController alloc]init];
        
        [self.navigationController pushViewController:goods animated:YES];
        
        
    }
    
    
}
//移除searchController
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    if (self.searchVC.active) {
        self.searchVC.active = NO;
        [self.searchVC.searchBar removeFromSuperview];
    }
}

// 点击加号按钮
- (void)checkMyMessage:(UIButton *)sender {
    
    
    


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
