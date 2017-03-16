//
//  ViewController.m
//  AwsSnsTest
//
//  Created by 김민아 on 2017. 3. 15..
//  Copyright © 2017년 김민아. All rights reserved.
//

#import "ViewController.h"
#import "LibraryClass.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textView;

@property (weak, nonatomic) LibraryClass *lib;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.lib = [LibraryClass sharedInstance];
    
}

// 토큰 정보가 view가 뜨고 넘어옴
// 버튼을 눌러 토큰정보 화면에 출력
- (IBAction)touchedShowDeviceToken:(UIButton *)sender
{
    self.textView.text = self.lib.getDeviceToken;
}

@end
