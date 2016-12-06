//
//  CommentViewController.m
//  BMProject
//
//  Created by xa on 16/3/19.
//  Copyright © 2016年 王凯锋  158682312@qq.com. All rights reserved.
//

#import "CommentViewController.h"
#import "PlaceorderTableViewCell.h"
#import "XMCommentStarCell.h"
#import "RatingBar.h"
@interface CommentViewController ()<UITableViewDataSource,UITableViewDelegate,UITextViewDelegate,UIGestureRecognizerDelegate,UIActionSheetDelegate,UIImagePickerControllerDelegate,UIAlertViewDelegate,UINavigationControllerDelegate>{
    
    NSArray *carrBtn;
    NSMutableArray *carrBtnImg;
    UIImagePickerController *imagePicker ;
    NSMutableArray * carrPhotos;
    NSInteger  index ;
    
}
@property (weak, nonatomic) IBOutlet UITableView *commentableview;

@end

@implementation CommentViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    
    if([[UIDevice currentDevice].systemVersion doubleValue] > 7.0)
        self.edgesForExtendedLayout = UIRectEdgeNone;
    self.edgesForExtendedLayout=NO;
    
    self.title = @"评论";
    [self setBackBarButton];
    
    
    
    [self setDoneBarButtonWithSelector:@selector(submitbut) andTitle:@"提交"];
    
    [self loadtableview];
    // Do any additional setup after loading the view from its nib.
}

-(void)loadtableview{
    
    self.commentableview.showsVerticalScrollIndicator = NO;
    [self.commentableview registerNib:[UINib nibWithNibName:@"PlaceorderTableViewCell" bundle:nil] forCellReuseIdentifier:@"ordercell"];
    
    [self.commentableview registerNib:[UINib nibWithNibName:@"XMCommentStarCell" bundle:nil] forCellReuseIdentifier:@"commentStarCell"];
    
    self.commentableview.delegate = self;
    self.commentableview.dataSource = self;
    
    carrPhotos  = [NSMutableArray new];
    carrBtnImg = [NSMutableArray new];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return  4;
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
        
        static NSString *rouse = @"commentStarCell";
        XMCommentStarCell *cell = [tableView dequeueReusableCellWithIdentifier:rouse];
        
        RatingBar *RatingBarFist= [[RatingBar alloc]initWithFrame:CGRectMake(0, 0, 150, 30)];
        [cell.starFirst addSubview:RatingBarFist];
        
        RatingBar *RatingBarSed= [[RatingBar alloc]initWithFrame:CGRectMake(0, 0, 150, 30)];
        [cell.starSed addSubview:RatingBarSed];
        
        RatingBar *RatingBarThird= [[RatingBar alloc]initWithFrame:CGRectMake(0, 0, 150, 30)];
        [cell.starThird addSubview:RatingBarThird];
        cell.selectionStyle =  UITableViewCellSelectionStyleNone;
        
        RatingBar *RatingBarFour= [[RatingBar alloc]initWithFrame:CGRectMake(0, 0, 150, 30)];
        [cell.starFour addSubview:RatingBarFour];
        cell.selectionStyle =  UITableViewCellSelectionStyleNone;
        
        
        return cell;
        
    }else if (indexPath.section==2){
        
        static NSString *reuse = @"cell";
        UITableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:reuse];
        if (cell==nil) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuse];
        }
        cell.textLabel.text = @"您还想在说点什么";
        cell.textLabel.font = [UIFont systemFontOfSize:14];
        cell.textLabel.textColor = [UIColor darkGrayColor];
        cell.selectionStyle =  UITableViewCellSelectionStyleNone;
        return cell;
    }else{
        static NSString *reuse = @"cell";
        UITableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:reuse];
        if (cell==nil) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuse];
        }
        
        ZSPTextView *textView  = [[ZSPTextView alloc]init];
        textView.frame = CGRectMake(10, 10, SCREEN_WIDTH-20 , 90);
        textView.backgroundColor = [UIColor lightTextColor];
        //        textView.text = cstrMsg;
        textView.placeholder = @"您的评论是我们最大的动力！";
        textView.textColor = [UIColor lightGrayColor];
        textView.font =  [UIFont systemFontOfSize:13];
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
    if (indexPath.section==0) {
        return 80;
        
    }else if(indexPath.section==1) {
        return 155;
    }else if(indexPath.section==2) {
        return 30;
    }else{
        return 110;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if(section == 3){
        
        return 0.1;
    }
    
    
    return 8;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    if (section == 1) {
        
        float height  = SCREEN_WIDTH/5*(carrPhotos.count/3+1) +40+20*(carrPhotos.count/3);
        return height+10;
    }
    return 0.0001;

}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if(section == 1){
    NSInteger count = carrPhotos.count + 1 ;
    UIView *backView = [[UIView alloc]init];
    float height  = SCREEN_WIDTH/5*(carrPhotos.count/3+1) +40+20*(carrPhotos.count/3);
    UIView *blurView = [[UIView alloc]initWithFrame:CGRectMake(10,5, SCREEN_WIDTH - 20, height)];
    blurView.layer.borderColor = [UIColor lightGrayColor].
        CGColor;
    blurView.layer.borderWidth = 1;
    blurView.layer.cornerRadius = 8;
    backView.backgroundColor = [UIColor whiteColor];
    blurView.backgroundColor = [UIColor whiteColor];
    [backView addSubview:blurView];
    
   
    for (int i = 0; i<count; i++) {
        UIButton *btnImg  = [[UIButton alloc]init];
        float Width = (SCREEN_WIDTH/5*2 - 20)/4;
        int j = i/3;
        btnImg.frame = CGRectMake(Width+(SCREEN_WIDTH/5)*(i%3)+Width*(i%3), 20*(j+1) + (SCREEN_WIDTH/5)*j, SCREEN_WIDTH/5, SCREEN_WIDTH/5);
        
        [blurView addSubview:btnImg];
        btnImg.tag =  i;
        [carrBtnImg addObject:btnImg];
        
        if (i < count -1 ) {
            [btnImg setImage:carrPhotos[i] forState:UIControlStateNormal];
            [btnImg addTarget:self action:@selector(DelePhoto:) forControlEvents:UIControlEventTouchUpInside];
        }else{
            [btnImg setBackgroundImage:[UIImage imageNamed:@"add_address"] forState:UIControlStateNormal];
            [btnImg addTarget:self action:@selector(AddPhoto:) forControlEvents:UIControlEventTouchUpInside];
            //                    if (carrPhotos.count == 3) {
            //                        btnImg.hidden=YES;
            //                    }
        }
    }
    
    
    return backView;
    
    }
    
    return nil;


}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
    }
    
    return YES;
    
}

#pragma mark ----删除图片
- (void)DelePhoto:(UIButton *)sender{
    
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"你确定要删除该图片" delegate:self cancelButtonTitle:@"否" otherButtonTitles:@"是", nil];
    [alertView show];
    index = sender.tag;
    
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex==1) {
        
        for (int i = 0; i<carrBtnImg.count;i++) {
            UIButton *btn  = carrBtnImg[i];
            [btn removeFromSuperview];
        }
        [self.view endEditing:YES];
        [carrPhotos removeObjectAtIndex:index];
        [self.commentableview reloadSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation:UITableViewRowAnimationNone];
    }
    
}

#pragma mark ----上传图片
-(void)AddPhoto:(UIButton *)sender{
    
    [self.view endEditing:YES];
    //    cbtnTemp = sender;
    UIActionSheet * actionSheet  = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照",@"相册", nil];
    [actionSheet showInView:self.view];
    
    
    
    //    index = sender.tag ;
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    switch (buttonIndex) {
        case 1:
            [self pickImageFromAlbum];
            break;
        case 0:
            [self pickImageFromCamera];
            break ;
            
        default:
            break;
    }
}

//　从摄像头/相册获取图片
//　　刚刚在上面的知识中提到从摄像头/相册获取图片是面向终端用户的，由用户去浏览并选择图片为程序使用。在这里，我们需要过UIImagePickerController类来和用户交互。
//　　使用UIImagePickerController和用户交互，我们需要实现2个协议。
//　　View Code
//　　代码如下
#pragma mark 从用户相册获取活动图片
- (void)pickImageFromAlbum
{
    
    imagePicker = [[UIImagePickerController alloc] init];
    
    //imagePicker.showsCameraControls = YES ;
    imagePicker.delegate = self;
    
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    imagePicker.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    
    imagePicker.allowsEditing = YES;
    
    [self presentViewController:imagePicker animated:YES completion:nil];
    
}
//　　我们来看看上面的从相册获取图片，我们首先要实例化UIImagePickerController对象，然后设置imagePicker对象为当前对象，设置imagePicker的图片来源为UIImagePickerControllerSourceTypePhotoLibrary，表明当前图片的来源为相册，除此之外还可以设置用户对图片是否可编辑。
//　　View Code
//　　代码如下
#pragma mark 从摄像头获取活动图片
- (void)pickImageFromCamera
{
    
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera])
    {
        imagePicker = [[UIImagePickerController alloc] init];
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
        {
            imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
            imagePicker.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:imagePicker.sourceType];
            imagePicker.delegate=self;
            imagePicker.allowsEditing = YES;
            
        }
        [self presentViewController:imagePicker animated:YES completion:nil];
        
    }else
    {
        
    }
    
}
//　　以上是从摄像头获取图片，和从相册获取图片只是图片来源的设置不一样，摄像头图片的来源为UIImagePickerControllerSourceTypeCamera。
//　　在和用户交互之后，用户选择好图片后，会回调选择结束的方法。
//　　View Code
//　　代码如下
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    UIImage *image= [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    if (picker.sourceType == UIImagePickerControllerSourceTypeCamera)
    {
       
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
    }
    
    
    NSData * dataIMG = UIImageJPEGRepresentation(image, 0.4);
    
    [carrPhotos addObject:image];
    [self.commentableview reloadSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation:UITableViewRowAnimationNone];
    
    //    cstrURLimg
    //    [cbtnTemp setBackgroundImage:image forState:UIControlStateNormal];
    //    NSDictionary * cdicInfo = @{@"Filedata":dataIMG};
    //
    //    [RequestManager UploadFiles:cdicInfo Data:dataIMG complete:^(NSDictionary *dictionary) {
    //        DLog(@"  返回信息  %@ ",dictionary);
    //
    //        NSString * cstr = [dictionary[@"status"] stringValue];
    //        if ([cstr isEqualToString:@"0"]) {
    //            [self showErrorHud:@"上传失败"];
    //        }else{
    //
    //            if ([cstrURLimg isEqualToString:@""]) {
    //
    //                cstrURLimg = dictionary[@"msg"][@"path"];
    //
    //            }else{
    //                cstrURLimg = [cstrURLimg stringByAppendingString:[NSString stringWithFormat:@",%@",dictionary[@"msg"][@"path"]]];
    //                DLog(@",,.,., %@",cstrURLimg);
    //            }
    //
    //            [_cmutArr replaceObjectAtIndex:5 withObject:cstrURLimg];
    //
    //            [self.tableview reloadData];
    //            [self showSuccessHud:[ NSString stringWithFormat:@"上传成功"]];
    //            DLog(@",,.,., %@",cstrURLimg);
    //        }
    //    }];
    
    
    
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
