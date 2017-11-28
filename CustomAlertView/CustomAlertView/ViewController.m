//
//  ViewController.m
//  CustomAlertView
//
//  Created by 胡双飞 on 2017/11/27.
//  Copyright © 2017年 胡双飞. All rights reserved.
//

#import "ViewController.h"
#import "HSFAlertView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [HSFAlertView showContent:@"自定义的AlertView哦"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
