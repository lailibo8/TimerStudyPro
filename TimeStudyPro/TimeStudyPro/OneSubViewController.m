//
//  OneSubViewController.m
//  TimeStudyPro
//
//  Created by lailibo on 2020/5/17.
//  Copyright © 2020 lailibo. All rights reserved.
//

#import "OneSubViewController.h"
#import <objc/runtime.h>
@interface OneSubViewController ()
@property (nonatomic, strong) NSTimer *timerSub;
@property (nonatomic, strong) id  target;

@end

@implementation OneSubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 200, 100)];
    
    [backButton setBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:backButton];
    
    
    [backButton addTarget:self action:@selector(clickButton) forControlEvents:UIControlEventTouchUpInside];
    
    
   
    //通过Runtime添加方法，转移IMP指针地址的方式
    
    _target = [NSObject new];

    class_addMethod([_target class], @selector(timerClick), (IMP)fireIMP, "v@:");

    //把对self的引用脱离出去
   _timerSub =  [NSTimer timerWithTimeInterval:1 target:_target selector:@selector(timerClick) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_timerSub forMode:NSDefaultRunLoopMode];
    
}


void fireIMP(id self, SEL _cmd)
{
    NSLog(@"timeClick-222--");

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

//- (void)didMoveToParentViewController:(UIViewController *)parent
//{
//
//    if (nil == parent) {
//        [_timerSub invalidate];
//        _timerSub = nil;
//    }
//
//
//}

-(void)clickButton
{
    
    
    
    [self dismissViewControllerAnimated:NO completion:nil];
    
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
