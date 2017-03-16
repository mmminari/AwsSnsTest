//
//  LibraryClass.h
//  AwsSnsTest
//
//  Created by 김민아 on 2017. 3. 16..
//  Copyright © 2017년 김민아. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LibraryClass : NSObject

+ (instancetype)sharedInstance;

- (void)registerDeviceTokenWithLaunchOptions:(NSDictionary *)launchOptions;

- (void)saveDeviceToken:(NSData *)deviceToken;

- (NSString *)getDeviceToken;


@end
