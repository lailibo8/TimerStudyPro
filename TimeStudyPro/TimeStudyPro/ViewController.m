//
//  ViewController.m
//  TimeStudyPro
//
//  Created by lailibo on 2020/5/17.
//  Copyright © 2020 lailibo. All rights reserved.
//

#import "ViewController.h"
#import "OneSubViewController.h"
#import "TwoSubViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 200, 100)];
    
    [backButton setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:backButton];
    
    
    [backButton addTarget:self action:@selector(clickButton) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *backTwoButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 400, 200, 100)];
    
    [backTwoButton setBackgroundColor:[UIColor purpleColor]];
    [self.view addSubview:backTwoButton];
    
    
    [backTwoButton addTarget:self action:@selector(clickBackTwoButton) forControlEvents:UIControlEventTouchUpInside];
    
    
    
}


-(void)clickBackTwoButton
{
    
    OneSubViewController *subVC = [[OneSubViewController alloc] init];
   
    [self presentViewController:subVC animated:NO completion:nil];
    
}


-(void)clickButton
{
    
    TwoSubViewController *subVC = [[TwoSubViewController alloc] init];
    
    [self presentViewController:subVC animated:NO completion:nil];
    
}


@end
