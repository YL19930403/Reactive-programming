//
//  NSObject+KVO.m
//  Reactive programming
//
//  Created by 余亮 on 16/6/23.
//  Copyright © 2016年 余亮. All rights reserved.
//

#import "NSObject+KVO.h"
#import "YLKVONotifi_Person.h"
#import <objc/runtime.h>

@implementation NSObject (KVO)

- (void)yl_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context{
    //1.动态创建YLKVONotifi_Person（YLKVONotifi_Person是Person的子类）做KVO
    //2.修改当前对象isa指针 -> YLKVONotifi_Person
    //3.只要调用对象的set方法，就会调用YLKVONotifi_Person的set方法
    //4.重写YLKVONotifi_Person的set方法， 1.[super set:] 2.通知观察者,告诉你属性改变

    //修改isa，本质就是修改当前对象的类名
    object_setClass(self, [YLKVONotifi_Person class]) ;
    
    // 把观察者保存到当前对象里
    /**
        添加关联：
      //1.id   object : 给哪个对象添加关联属性
     //2.key ： 属性名
     //value : 关联值
     */
    objc_setAssociatedObject(self , @"observer", observer, OBJC_ASSOCIATION_RETAIN_NONATOMIC) ;
    
    
    
}
@end















