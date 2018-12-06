//
//  ViewController.m
//  HLKeychainTool
//
//  Created by cainiu on 2018/12/6.
//  Copyright © 2018 HL. All rights reserved.
//

#import "ViewController.h"
#import "HLKeychainTool.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.titleLabel.font = [UIFont systemFontOfSize:15];
    button.backgroundColor = [UIColor grayColor];
    [button setTitle:@"Show DeviceId" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(showDeviceIdAction) forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(120, 300, 150, 30);
    [self.view addSubview:button];
}

- (void)showDeviceIdAction{
    NSString *deviceId = [HLKeychainTool getDeviceIdentifierString];
    NSLog(@"deviceId:%@",deviceId);
    
    UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:@"deviceId" message:deviceId preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    }];
    [alertVc addAction:action];
    [self presentViewController:alertVc animated:YES completion:nil];
}

@end
