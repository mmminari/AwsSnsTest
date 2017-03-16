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
- (IBAction)touchedShowDeviceToken:(UIButton *)sender
{
    self.textView.text = self.lib.getDeviceToken;
}

@end
