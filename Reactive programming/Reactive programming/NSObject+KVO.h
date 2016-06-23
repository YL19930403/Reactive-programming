//
//  NSObject+KVO.h
//  Reactive programming
//
//  Created by 余亮 on 16/6/23.
//  Copyright © 2016年 余亮. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (KVO)

- (void)yl_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context;



@end
