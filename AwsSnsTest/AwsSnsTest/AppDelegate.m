//
//  AppDelegate.m
//  AwsSnsTest
//
//  Created by 김민아 on 2017. 3. 15..
//  Copyright © 2017년 김민아. All rights reserved.
//

#import "AppDelegate.h"
#import "LibraryClass.h"

@interface AppDelegate ()

@property (weak, nonatomic) LibraryClass *lib;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    UIUserNotificationType types = UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert;
    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:types categories:nil];
    
    [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
    
    self.lib = [LibraryClass sharedInstance];
    
    // OneSignal을 사용하기 위해 OneSignal에 launchOptions 등록
    [self.lib registerDeviceTokenWithLaunchOptions:launchOptions];
    
    // 노티피케이션 사용을 위한 등록 -> 토큰 정보 요청
    [[UIApplication sharedApplication] registerForRemoteNotifications];
    
    return YES;
}

-(void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    //device token값 넘기기
    NSLog( @"data : %@" , deviceToken);
    
    // 토큰 정보 string으로 변환해서 저장
    [self.lib saveDeviceToken:deviceToken];
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
