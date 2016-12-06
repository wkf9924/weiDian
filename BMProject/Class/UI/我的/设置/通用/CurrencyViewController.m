//
//  CurrencyViewController.m
//  BMProject
//
//  Created by xa on 16/2/24.
//  Copyright © 2016年 王凯锋. All rights reserved.
//

#import "CurrencyViewController.h"

@interface CurrencyViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *currentableview;

@end

@implementation CurrencyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"通用";
    [self setBackBarButton];
    
    self.currentableview.delegate = self;
    self.currentableview.dataSource = self;
    self.currentableview.tableFooterView = [[UIView alloc]init];
    // Do any additional setup after loading the view from its nib.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 2;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static  NSString *reusa = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reusa];
    
    if(cell == nil){
        
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reusa];
        
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
   
    NSArray *arrayname = @[@"功能设置",@"清理储存空间"];
    cell.textLabel.text = arrayname[indexPath.row];
    if(indexPath.row == 1){
    
    cell.detailTextLabel.text=[NSString stringWithFormat:@"%.1fM",[self filePath]];
    }
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row == 0){
        
        
    }else{
        
        [self actionSheet];
        
    }
    
}

-(void)actionSheet{
    
    [UIActionSheet showInView:self.view
                    withTitle:nil
            cancelButtonTitle:@"取消"
       destructiveButtonTitle:@"清除缓存"
            otherButtonTitles:nil
                     tapBlock:^(UIActionSheet *actionSheet, NSInteger buttonIndex){
                         
                         switch (buttonIndex) {
                             case 0:
                                 
                                 [self clearFile];
                                 
                                 break;
                                 
                             
                             default:
                                 break;
                         }
                     }];

}

// 显示缓存大小
-( float )filePath
{
    
    NSString * cachPath = [ NSSearchPathForDirectoriesInDomains ( NSCachesDirectory , NSUserDomainMask , YES ) firstObject ];
    
    return [ self folderSizeAtPath :cachPath];
    
}
//1:首先我们计算一下 单个文件的大小

- ( long long ) fileSizeAtPath:( NSString *) filePath{
    
    NSFileManager * manager = [ NSFileManager defaultManager ];
    
    if ([manager fileExistsAtPath :filePath]){
        
        return [[manager attributesOfItemAtPath :filePath error : nil ] fileSize ];
    }
    
    return 0 ;
    
}
//2:遍历文件夹获得文件夹大小，返回多少 M（提示：你可以在工程界设置（)m）

- ( float ) folderSizeAtPath:( NSString *) folderPath{
    
    NSFileManager * manager = [ NSFileManager defaultManager ];
    
    if (![manager fileExistsAtPath :folderPath]) return 0 ;
    
    NSEnumerator *childFilesEnumerator = [[manager subpathsAtPath :folderPath] objectEnumerator ];
    
    NSString * fileName;
    
    long long folderSize = 0 ;
    
    while ((fileName = [childFilesEnumerator nextObject ]) != nil ){
        
        NSString * fileAbsolutePath = [folderPath stringByAppendingPathComponent :fileName];
        
        folderSize += [ self fileSizeAtPath :fileAbsolutePath];
        
    }
    
    return folderSize/( 1024.0 * 1024.0 );
    
}

- (void)clearFile
{
    [IanAlert showloading];
    NSString * cachPath = [ NSSearchPathForDirectoriesInDomains ( NSCachesDirectory , NSUserDomainMask , YES ) firstObject ];
    
    NSArray * files = [[ NSFileManager defaultManager ] subpathsAtPath :cachPath];
    
    NSLog ( @"cachpath = %@" , cachPath);
    
    for ( NSString * p in files) {
        
        NSError * error = nil ;
        
        NSString * path = [cachPath stringByAppendingPathComponent :p];
        
        if ([[ NSFileManager defaultManager ] fileExistsAtPath :path]) {
            
            [[ NSFileManager defaultManager ] removeItemAtPath :path error :&error];
            
        }
        
    }
    
    [ self performSelectorOnMainThread : @selector (clearCachSuccess) withObject : nil waitUntilDone : YES ];
    
}
-(void)clearCachSuccess
{
    NSLog ( @" 清理成功 " );
    
    NSIndexPath *index=[NSIndexPath indexPathForRow:1 inSection:0];//刷新
    [_currentableview reloadRowsAtIndexPaths:[NSArray arrayWithObjects:index,nil] withRowAnimation:UITableViewRowAnimationNone];
    [IanAlert hideLoading];
    ITOAST_ALERT(@"清楚完成");
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
