//
//  YLKVONotifi_Person.m
//  Reactive programming
//
//  Created by 余亮 on 16/6/23.
//  Copyright © 2016年 余亮. All rights reserved.
//

#import "YLKVONotifi_Person.h"
#import <objc/runtime.h>

@implementation YLKVONotifi_Person

- (void) setAge:(int)age{
    [super setAge:age];
    NSMutableDictionary * dict = [[NSMutableDictionary alloc] initWithObjectsAndKeys:NSKeyValueChangeNewKey,@"observer", nil];
    //通知观察者属性发生了改变
    id observer = objc_getAssociatedObject(self , @"observer");
    [observer observeValueForKeyPath:@"age" ofObject:self  change:dict context:nil ];//NSKeyValueObservingOptionNew      NSKeyValueChangeNewKey
    
}

@end
