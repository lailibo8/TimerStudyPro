//
//  WeakProxy.h
//  TimeStudyPro
//
//  Created by lailibo on 2020/5/17.
//  Copyright © 2020 lailibo. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WeakProxy : NSProxy
@property (nonatomic, weak) id target;

@end

NS_ASSUME_NONNULL_END
