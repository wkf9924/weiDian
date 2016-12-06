//
//  AppDelegate.m
//  BMProject
//
//  Created by MengHuan on 15/4/19.
//  Copyright (c) 2015年 MengHuan. All rights reserved.
//

#import "AppDelegate.h"
#import "Reachability.h"
#import "GuideView.h"
#import "OneViewController.h"
#import "TwoViewController.h"
#import "ThreeViewController.h"
#import "FourViewController.h"
#import "BaseNavigationViewController.h"
#import "WXApi.h"
#import "AlipayHeader.h"
#import "TWMessageBarManager.h"
#import "AppConfigure.h"


@interface AppDelegate ()<WXApiDelegate,UIAlertViewDelegate>
{
    NSMutableArray *arrayTemp;
    NSString *_userID;
}

// 网络状态实时监听
@property (strong, nonatomic) Reachability *reachability;
@property (assign, nonatomic) UIBackgroundTaskIdentifier backgroundUpdateTask;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    // 实时监听网络状态
   // [self startRealTimeNetworkStatus];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
    _window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    _window.backgroundColor = [UIColor whiteColor];
   
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"aroundfriends_bar_bg"] forBarMetrics:UIBarMetricsDefault];
    
   //向微信注册wxd930ea5d5a258f4f
    
    [WXApi registerApp:@"wxd43dc866323c77c7" withDescription:@"车尚生活汇"];
    
   [self tabbarData];
    // 显示引导页
//    [self showGuideHUD];
    // 显示水印
//    [self blueMobiWatermark];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)tabbarData {

   
    OneViewController *one = [[OneViewController alloc]init];
    TwoViewController *two = [[TwoViewController alloc]init];
    ThreeViewController *three = [[ThreeViewController alloc]init];
    FourViewController *four = [[FourViewController alloc]init];
    
    
    //改变导航栏文字大小和颜色;
//    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor redColor],NSFontAttributeName:[UIFont systemFontOfSize:20.0]}];
    
    //改变tabbar文字大小
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor grayColor], NSForegroundColorAttributeName, [UIFont fontWithName:@"Helvetica" size:12.0f],NSFontAttributeName,nil] forState:UIControlStateNormal];
   
    //改变tabbar文字颜色
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor greenColor], NSForegroundColorAttributeName,nil] forState:UIControlStateSelected];
    
    
    //只改变导航栏文字颜色
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    //改变导航栏颜色
    //[UINavigationBar appearance].barTintColor = [UIColor grayColor];
    
   
    UINavigationController *navigation = [[BaseNavigationViewController alloc]initWithRootViewController:one];
    UIImage *imageyaowen = [[UIImage imageNamed:@"tabbar_mainframe"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *redYaowen = [[UIImage imageNamed:@"tabbar_mainframeHL"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    navigation.tabBarItem=[[UITabBarItem alloc]initWithTitle:@"微点" image:imageyaowen selectedImage:redYaowen];
    one.title = @"微点";
    
   UINavigationController *sencondnavigation = [[BaseNavigationViewController alloc]initWithRootViewController:two];
    UIImage *imageweiwenming = [[UIImage imageNamed:@"品牌街默认"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *redWeiming = [[UIImage imageNamed:@"品牌街选中"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    sencondnavigation.tabBarItem=[[UITabBarItem alloc]initWithTitle:@"品牌街" image:imageweiwenming selectedImage:redWeiming];
    two.title = @"品牌街";
    
    UINavigationController *thirdnavgation = [[BaseNavigationViewController alloc]initWithRootViewController:three];
    UIImage *imagegonyi = [[UIImage imageNamed:@"tabbar_discover"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *Redimagegonyi = [[UIImage imageNamed:@"tabbar_discoverHL"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    thirdnavgation.tabBarItem=[[UITabBarItem alloc]initWithTitle:@"发现" image:imagegonyi selectedImage:Redimagegonyi];
    three.title = @"发现";
    
    UINavigationController *fournavigation = [[BaseNavigationViewController alloc]initWithRootViewController:four];
    UIImage *imagewenmigban = [[UIImage imageNamed:@"tabbar_me"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *Redimagewenmigban = [[UIImage imageNamed:@"tabbar_meHL"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    fournavigation.tabBarItem=[[UITabBarItem alloc]initWithTitle:@"我" image:imagewenmigban selectedImage:Redimagewenmigban];
    four.title = @"我";
    
    UITabBarController *tabber = [[UITabBarController alloc]init];
    tabber.viewControllers = @[navigation,sencondnavigation,thirdnavgation,fournavigation];
//    tabber.tabBar.frame = CGRectMake(0, Main_Screen_Height-70, Main_Screen_Width, 70);
//    //UIView * transitionView = [[tabber.view subviews] objectAtIndex:0];

   self.window.rootViewController = tabber;
}

//微信回调
- (void)onResp:(BaseResp *)resp {
    //errCode
    NSDictionary * dic = @{
                           @"code":[NSNumber numberWithInt:resp.errCode]
                           };
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"ZHIFU-weixin" object:nil userInfo:dic];
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    
    //跳转支付宝钱包进行支付，处理支付结果
    [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
        NSLog(@"result = %@",resultDic);
        [[NSNotificationCenter defaultCenter]postNotificationName:@"ZHIFU-BAO" object:nil userInfo:resultDic];
        
    }];
    
    //如果极简开发包不可用，会跳转支付宝钱包进行支付，需要将支付宝钱包的支付结果回传给开 发包
    if ([url.host isEqualToString:@"safepay"]) {
        [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
            
            //【由于在跳转支付宝客户端支付的过程中，商户 app 在后台很可能被系统 kill 了，所以 pay 接口的 callback 就会失效，请商户对 standbyCallback 返回的回调结果进行处理,就是在这个方法里面处理跟 callback 一样的逻辑】
            //                NSLog(@"result = %@",resultDic);
            
            [[NSNotificationCenter defaultCenter]postNotificationName:@"ZHIFU-BAO" object:nil userInfo:resultDic];
        }];
    }
    
    if ([url.host isEqualToString:@"platformapi"]){//支付宝钱包快登授权返回 authCode
        [[AlipaySDK defaultService] processAuthResult:url standbyCallback:^(NSDictionary *resultDic) {
            NSLog(@"result = %@",resultDic);
            
            [[NSNotificationCenter defaultCenter]postNotificationName:@"ZHIFU-BAO" object:nil userInfo:resultDic];
        }];
    }
    
    return  [WXApi handleOpenURL:url delegate:self];

}


- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    return  [WXApi handleOpenURL:url delegate:self];
}


#pragma mark ----支付
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary*)options{
    
    //跳转支付宝钱包进行支付，处理支付结果
    [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
        NSLog(@"result = %@",resultDic);
        [[NSNotificationCenter defaultCenter]postNotificationName:@"ZHIFU-BAO" object:nil userInfo:resultDic];
        
    }];
    
    //    //如果极简开发包不可用，会跳转支付宝钱包进行支付，需要将支付宝钱包的支付结果回传给开 发包
    if ([url.host isEqualToString:@"safepay"]) {
        [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
            //【由于在跳转支付宝客户端支付的过程中，商户 app 在后台很可能被系统 kill 了，所以 pay 接口的 callback 就会失效，请商户对 standbyCallback 返回的回调结果进行处理,就是在这个方法里面处理跟 callback 一样的逻辑】
            //                NSLog(@"result = %@",resultDic);
            
            [[NSNotificationCenter defaultCenter]postNotificationName:@"ZHIFU-BAO" object:nil userInfo:resultDic];
            
        }];
    }
    
    if ([url.host isEqualToString:@"platformapi"]){//支付宝钱包快登授权返回 authCode
        [[AlipaySDK defaultService] processAuthResult:url standbyCallback:^(NSDictionary *resultDic) {
            //            NSLog(@"result = %@",resultDic);
            
            [[NSNotificationCenter defaultCenter]postNotificationName:@"ZHIFU-BAO" object:nil userInfo:resultDic];
        }];
    }
    
    
    return  [WXApi handleOpenURL:url delegate:self];
}



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    
     [self beingBackgroundUpdateTask];
     // 在这里加上你需要长久运行的代码
     [self endBackgroundUpdateTask];
    
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.window endEditing:YES];
    [[self.window viewWithTag:1000] removeFromSuperview];
}

#pragma mark -
+ (AppDelegate *)appDelegate
{
    return (AppDelegate *)[UIApplication sharedApplication].delegate;
}

#pragma mark - 显示引导页
- (void)showGuideHUD

{
    // 引导页
    if (![DEF_PERSISTENT_GET_OBJECT(@"showGuide") boolValue])
    {
        DEF_PERSISTENT_SET_OBJECT([NSNumber numberWithBool:YES], @"showGuide");
        GuideView *guide = [[GuideView alloc] initWithFrame:self.window.bounds];
        [self.window addSubview:guide];
    }
}

#pragma mark - 水印
- (void)blueMobiWatermark
{
    // 添加水印
    UIImageView *iv = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"blueMobiWatermark"]];
    iv.frame        = CGRectMake(0, DEF_HEIGHT(self.window) - 12, DEF_WIDTH(self.window), 12);
    [self.window addSubview:iv];
    [self.window bringSubviewToFront:iv];
}


#pragma mark -
#pragma mark - 实时监听网络状态

- (void)startRealTimeNetworkStatus
{
    // 开启网络状况的监听
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(reachabilityChanged:)
                                                 name:kReachabilityChangedNotification
                                               object:nil];
    self.reachability = [Reachability reachabilityWithHostName:@"www.baidu.com"];
    [self.reachability startNotifier];
}

- (void)reachabilityChanged:(NSNotification* )note
{
    Reachability * reach = [note object];
    NSParameterAssert([reach isKindOfClass: [Reachability class]]);
    NetworkStatus status = [reach currentReachabilityStatus];
    
    
    NSLog(@"网络状态值: %ld", (long)status);
    
    if(status == NotReachable){
        
        [[TWMessageBarManager sharedInstance] showMessageWithTitle:@"网络连接失败" description:@"请检查下您的网络" type:TWMessageBarMessageTypeError callback:^{
            
            UIAlertView *alertView1 = [[UIAlertView alloc] initWithTitle:nil message:@"网络错误" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"设置", nil];
            [alertView1 show];
        }];
        
    }else if(status == ReachableViaWWAN){
        
       UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:@"移动网络" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alertView show];

    }
    
    // 根据网络状态值，在这里做你想做的事
    // ...
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if(buttonIndex == 1){
        
        NSURL *url = [NSURL URLWithString:@"prefs:root=WIFI"];
        if ([[UIApplication sharedApplication] canOpenURL:url])
        {
            [[UIApplication sharedApplication] openURL:url];
        }
        
    }
    
    
    
}


- (void)beingBackgroundUpdateTask
{
    self.backgroundUpdateTask = [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:^{
        [self endBackgroundUpdateTask];
    }];
}

- (void)endBackgroundUpdateTask
{
    [[UIApplication sharedApplication] endBackgroundTask: self.backgroundUpdateTask];
    self.backgroundUpdateTask = UIBackgroundTaskInvalid;
}



//
//- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
//    
//    if ([viewController isKindOfClass:[UINavigationController class]]) {
//        
//        [(UINavigationController *)viewController popToRootViewControllerAnimated:YES];
//        
//    }
//    
//}

@end
