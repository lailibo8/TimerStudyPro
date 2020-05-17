//
//  TwoSubViewController.m
//  TimeStudyPro
//
//  Created by lailibo on 2020/5/17.
//  Copyright © 2020 lailibo. All rights reserved.
//

#import "TwoSubViewController.h"
#import "WeakProxy.h"

@interface TwoSubViewController ()
@property (nonatomic, strong) NSTimer *timerSub;
@property (nonatomic, strong) WeakProxy *weakTarget;

@end

@implementation TwoSubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    //通过消息转发的方式进行方法的
    //把对self的引用通过消息转发转移别的对象出去
    _weakTarget = [WeakProxy alloc];
    _weakTarget.target = self;
    
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 200, 100)];
    
    [backButton setBackgroundColor:[UIColor orangeColor]];
    [self.view addSubview:backButton];
    
    
    [backButton addTarget:self action:@selector(clickButton) forControlEvents:UIControlEventTouchUpInside];
    

    _timerSub =  [NSTimer timerWithTimeInterval:1 target:_weakTarget selector:@selector(timerClick) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_timerSub forMode:NSDefaultRunLoopMode];
    
    
    
}

-(void)clickButton
{
    
    
    
    [self dismissViewControllerAnimated:NO completion:nil];
    
}



- (void)dealloc
{
    [_timerSub invalidate];
    _timerSub = nil;
}


-(void)timerClick
{
    
    NSLog(@"timeClick---");
    
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
