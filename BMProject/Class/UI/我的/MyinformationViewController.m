//
//  MyinformationViewController.m
//  BMProject
//
//  Created by xa on 16/1/30.
//  Copyright © 2016年 王凯锋. All rights reserved.
//
#define ORIGINAL_MAX_WIDTH 640.0f
#import "MyinformationViewController.h"
#import "NJImageCropperViewController.h"
#import "WDnumberViewController.h"
#import "MyaddressViewController.h"
#import "GenderViewController.h"
#import "AutographViewController.h"
#import "LewPopupViewController.h"
#import "PopupView.h"
#import "AddressPickView.h"


@interface MyinformationViewController ()<UITableViewDataSource,UITableViewDelegate,NJImageCropperDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>{
    
    UIView *mengView;
    UIImageView *imageview;
    NSString *addressString;
    UINavigationController *navigation;
}


@property (strong, nonatomic) IBOutlet UIView *inforheardView;
@property (weak, nonatomic) IBOutlet UILabel *inforNamelab;
@property (weak, nonatomic) IBOutlet UIImageView *inforheardimageview;
@property (weak, nonatomic) IBOutlet UITableView *myinfortableview;


@property (nonatomic, strong) UIToolbar *toolBar;


@end

@implementation MyinformationViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.myinfortableview reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if([[UIDevice currentDevice].systemVersion doubleValue] > 7.0)
        self.edgesForExtendedLayout = UIRectEdgeNone;
   
    [self setBackBarButton];
    
    self.title = @"个人信息";
    
    self.myinfortableview.tableHeaderView = self.inforheardView;
    self.myinfortableview.delegate = self;
    self.myinfortableview.dataSource = self;
    
   //添加点击手势
    UITapGestureRecognizer *portraitTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(editPortrait)];
    [self.inforheardView addGestureRecognizer:portraitTap];
    
    
    //添加点击手势
    UITapGestureRecognizer *portraitTapimage = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(editPortraitimage)];
    [self.inforheardimageview addGestureRecognizer:portraitTapimage];
    
    self.inforheardimageview.userInteractionEnabled=YES;
    
    // Do any additional setup after loading the view from its nib.
}


#pragma mark -- wkf

-(void)editPortraitimage{
    
    PopupView *view = [PopupView defaultPopupView];
    view.parentVC = self;
    view.peopleimage.image = [UIImage imageNamed:@"1480514b4db52b0fe4b396548f7f71b9"];
    
    [self lew_presentPopupView:view animation:[LewPopupViewAnimationDrop new] dismissed:^{
        NSLog(@"动画结束");
    }];
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if(section == 0){
        
        return 3;
    }
    
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static  NSString *reusa = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reusa];
    
    if(cell == nil){
        
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reusa];
        
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    cell.detailTextLabel.text = @"未设置";
    
    if(indexPath.section == 0){
        NSArray *onearray = @[@"微点号",@"我的二维码",@"我的地址"];
        cell.textLabel.text = onearray[indexPath.row];
        if ([cell.textLabel.text isEqualToString:@"我的地址"]) {
            cell.detailTextLabel.text = @"";
        }
    }else{
        
        NSArray *twoarray = @[@"性别",@"地区",@"个人签名"];
        
        cell.textLabel.text = twoarray[indexPath.row];
        
        
        if ([cell.textLabel.text isEqualToString:@"性别"]) {
            cell.detailTextLabel.text = COM.sexString;
        }
       
        if ([cell.textLabel.text isEqualToString:@"地区"]) {
            
          
           
//            cell.detailTextLabel.text = @"陕西渭南";
        }
    }
    
    return cell;
}

- (void)textfieldAction {
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0.1;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if(section == 0 ){
        
        return 0;
    }
    
    
    return 20;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
   WDnumberViewController *WDnumberController = [[WDnumberViewController alloc] initWithNibName:nil bundle:nil];
    MyaddressViewController *myaddressVc = [[MyaddressViewController alloc]init];
    
    GenderViewController *genderVc = [[GenderViewController alloc]init];
    
    AutographViewController *autograpVc = [[AutographViewController alloc]init];
    
    if(indexPath.section == 0){
        
        switch (indexPath.row) {
            case 0:
    
     navigation = [[UINavigationController alloc] initWithRootViewController:WDnumberController];
     [self presentViewController:navigation animated:YES completion:^{
                    
                }];
                
                break;
                
            case 1:
                
                break;
                
            case 2:
                
                [self.navigationController pushViewController:myaddressVc animated:YES];
                
                break;
                
            default:
                break;
        }
        
    }else{
        
        switch (indexPath.row) {
            case 0:
                
                [self.navigationController pushViewController:genderVc animated:YES];
                
                break;
                
            case 1: {
                
                AddressPickView *addressPickView = [AddressPickView shareInstance];
                [self.view addSubview:addressPickView];
                addressPickView.block = ^(NSString *province,NSString *city,NSString *town){
                   
                    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ %@ %@",province,city,town] ;
                    
                };
            }

                break;
                
            case 2:
                
                [self.navigationController pushViewController:autograpVc animated:YES];
                
                break;
                
            default:
                break;
        }
    }
}

-(void)editPortrait{
    
    [UIActionSheet showInView:self.view
                    withTitle:nil
            cancelButtonTitle:@"取消"
       destructiveButtonTitle:@"拍照"
            otherButtonTitles:@[@"从手机相册选择"]
                     tapBlock:^(UIActionSheet *actionSheet, NSInteger buttonIndex){
                         
                         switch (buttonIndex) {
                             case 0: {
                                 
                                 // 拍照
                                 if ([self isCameraAvailable] && [self doesCameraSupportTakingPhotos]) {
                                     UIImagePickerController *controller = [[UIImagePickerController alloc] init];
                                     controller.sourceType = UIImagePickerControllerSourceTypeCamera;
                                     if ([self isFrontCameraAvailable]) {
                                         controller.cameraDevice = UIImagePickerControllerCameraDeviceFront;
                                     }
                                     NSMutableArray *mediaTypes = [[NSMutableArray alloc] init];
                                     [mediaTypes addObject:(__bridge NSString *)kUTTypeImage];
                                     controller.mediaTypes = mediaTypes;
                                     controller.delegate = self;
                                     [self presentViewController:controller
                                                        animated:YES
                                                      completion:^(void){
                                                          NSLog(@"Picker View Controller is presented");
                                                      }];
                                 }
                                 
                             }
                                 
                                 break;
                                 
                             case 1: {
                                 
                                 // 从相册中选取
                                 if ([self isPhotoLibraryAvailable]) {
                                     UIImagePickerController *controller = [[UIImagePickerController alloc] init];
                                     controller.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                                     NSMutableArray *mediaTypes = [[NSMutableArray alloc] init];
                                     [mediaTypes addObject:(__bridge NSString *)kUTTypeImage];
                                     controller.mediaTypes = mediaTypes;
                                     controller.delegate = self;
                                     [self presentViewController:controller
                                                        animated:YES
                                                      completion:^(void){
                                                          NSLog(@"Picker View Controller is presented");
                                                      }];
                                     
                                     
                                 }
                                 break;
                                 
                                 
                             default:
                                 break;
                             }
                                 
                         }
                         
                     }];
    
}


#pragma mark VPImageCropperDelegate
- (void)imageCropper:(NJImageCropperViewController *)cropperViewController didFinished:(UIImage *)editedImage {
    self.inforheardimageview.image = editedImage;
    [cropperViewController dismissViewControllerAnimated:YES completion:^{
        // 上传图片
        //        [self subImage:self.inforheardimageview.image];
    }];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
}

- (void)imageCropperDidCancel:(NJImageCropperViewController *)cropperViewController {
    [cropperViewController dismissViewControllerAnimated:YES completion:^{
    }];
}


#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [picker dismissViewControllerAnimated:YES completion:^() {
        UIImage *portraitImg = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
        portraitImg = [self imageByScalingToMaxSize:portraitImg];
        // 裁剪
        NJImageCropperViewController *imgEditorVC = [[NJImageCropperViewController alloc] initWithImage:portraitImg cropFrame:CGRectMake(0, 100.0f, self.view.frame.size.width, self.view.frame.size.width) limitScaleRatio:3.0];
        imgEditorVC.delegate = self;
        [self presentViewController:imgEditorVC animated:YES completion:^{
            // TO DO
        }];
    }];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:^(){
    }];
}

#pragma mark - UINavigationControllerDelegate
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
}

#pragma mark camera utility
- (BOOL) isCameraAvailable{
    return [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
}

- (BOOL) isRearCameraAvailable{
    return [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear];
}

- (BOOL) isFrontCameraAvailable {
    return [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront];
}

- (BOOL) doesCameraSupportTakingPhotos {
    return [self cameraSupportsMedia:(__bridge NSString *)kUTTypeImage sourceType:UIImagePickerControllerSourceTypeCamera];
}

- (BOOL) isPhotoLibraryAvailable{
    return [UIImagePickerController isSourceTypeAvailable:
            UIImagePickerControllerSourceTypePhotoLibrary];
}
- (BOOL) canUserPickVideosFromPhotoLibrary{
    return [self
            cameraSupportsMedia:(__bridge NSString *)kUTTypeMovie sourceType:UIImagePickerControllerSourceTypePhotoLibrary];
}
- (BOOL) canUserPickPhotosFromPhotoLibrary{
    return [self
            cameraSupportsMedia:(__bridge NSString *)kUTTypeImage sourceType:UIImagePickerControllerSourceTypePhotoLibrary];
}

- (BOOL) cameraSupportsMedia:(NSString *)paramMediaType sourceType:(UIImagePickerControllerSourceType)paramSourceType{
    __block BOOL result = NO;
    if ([paramMediaType length] == 0) {
        return NO;
    }
    NSArray *availableMediaTypes = [UIImagePickerController availableMediaTypesForSourceType:paramSourceType];
    [availableMediaTypes enumerateObjectsUsingBlock: ^(id obj, NSUInteger idx, BOOL *stop) {
        NSString *mediaType = (NSString *)obj;
        if ([mediaType isEqualToString:paramMediaType]){
            result = YES;
            *stop= YES;
        }
    }];
    return result;
}

#pragma mark image scale utility
- (UIImage *)imageByScalingToMaxSize:(UIImage *)sourceImage {
    if (sourceImage.size.width < ORIGINAL_MAX_WIDTH) return sourceImage;
    CGFloat btWidth = 0.0f;
    CGFloat btHeight = 0.0f;
    if (sourceImage.size.width > sourceImage.size.height) {
        btHeight = ORIGINAL_MAX_WIDTH;
        btWidth = sourceImage.size.width * (ORIGINAL_MAX_WIDTH / sourceImage.size.height);
    } else {
        btWidth = ORIGINAL_MAX_WIDTH;
        btHeight = sourceImage.size.height * (ORIGINAL_MAX_WIDTH / sourceImage.size.width);
    }
    CGSize targetSize = CGSizeMake(btWidth, btHeight);
    return [self imageByScalingAndCroppingForSourceImage:sourceImage targetSize:targetSize];
}

- (UIImage *)imageByScalingAndCroppingForSourceImage:(UIImage *)sourceImage targetSize:(CGSize)targetSize {
    UIImage *newImage = nil;
    CGSize imageSize = sourceImage.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    CGFloat targetWidth = targetSize.width;
    CGFloat targetHeight = targetSize.height;
    CGFloat scaleFactor = 0.0;
    CGFloat scaledWidth = targetWidth;
    CGFloat scaledHeight = targetHeight;
    CGPoint thumbnailPoint = CGPointMake(0.0,0.0);
    if (CGSizeEqualToSize(imageSize, targetSize) == NO)
    {
        CGFloat widthFactor = targetWidth / width;
        CGFloat heightFactor = targetHeight / height;
        
        if (widthFactor > heightFactor)
            scaleFactor = widthFactor; // scale to fit height
        else
            scaleFactor = heightFactor; // scale to fit width
        scaledWidth  = width * scaleFactor;
        scaledHeight = height * scaleFactor;
        
        // center the image
        if (widthFactor > heightFactor)
        {
            thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5;
        }
        else
            if (widthFactor < heightFactor)
            {
                thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
            }
    }
    UIGraphicsBeginImageContext(targetSize); // this will crop
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = thumbnailPoint;
    thumbnailRect.size.width  = scaledWidth;
    thumbnailRect.size.height = scaledHeight;
    
    [sourceImage drawInRect:thumbnailRect];
    
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    if(newImage == nil) NSLog(@"could not scale image");
    
    //pop the context to get back to the default
    UIGraphicsEndImageContext();
    return newImage;
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
