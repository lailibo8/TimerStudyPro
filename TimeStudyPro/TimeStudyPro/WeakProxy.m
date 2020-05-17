//
//  WeakProxy.m
//  TimeStudyPro
//
//  Created by lailibo on 2020/5/17.
//  Copyright © 2020 lailibo. All rights reserved.
//

#import "WeakProxy.h"

@implementation WeakProxy

//方法的签名
//查询该方法的签名
- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel
{
    return [self.target methodSignatureForSelector:sel];
}

- (void)forwardInvocation:(NSInvocation *)invocation
{
//    要转发消息给其他对象，forwardInvocation:方法所必须做的有：
//    1.决定将消息转发给谁。而且
//    2.将消息和原来的參数一块转发出去
//    消息能够通过invokeWithTarget:方法来转发：
    
    
        [invocation invokeWithTarget:self.target];

}

@end
