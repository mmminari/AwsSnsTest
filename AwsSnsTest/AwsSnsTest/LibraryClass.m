//
//  LibraryClass.m
//  AwsSnsTest
//
//  Created by 김민아 on 2017. 3. 16..
//  Copyright © 2017년 김민아. All rights reserved.
//

#import "LibraryClass.h"
#import <OneSignal/OneSignal.h>

@interface LibraryClass ()

@property (strong, nonatomic) OneSignal *oneSignal;
@property (strong, nonatomic) NSString *deviceToken;

@end

@implementation LibraryClass

+ (instancetype)sharedInstance
{
    static LibraryClass *_sharedInstance = nil;
    
    static dispatch_once_t oncePredicate;
    
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[LibraryClass alloc] init];
        
    });
    
    return _sharedInstance;
}

-(void)registerDeviceTokenWithLaunchOptions:(NSDictionary *)launchOptions
{
    self.oneSignal = [OneSignal initWithLaunchOptions:launchOptions appId:@"1148de71-5f39-4f7f-8762-bfd9dd4f16ea"];
    
    NSLog(@"register");
}

-(void)saveDeviceToken:(NSData *)deviceToken
{
    NSString *tokenString = [deviceToken description];
    NSString *deviceTokenString = [tokenString substringWithRange:NSMakeRange(1, tokenString.length-2)];
    
    self.deviceToken = deviceTokenString;
    
    NSLog(@"deviceTokenSaved : %@",self.deviceToken);
}

- (NSString *)getDeviceToken
{
    NSString *result = nil;
    
    result = self.deviceToken;
    
    return result;
}

@end
