//
//  ViewController.m
//  Reactive programming
//
//  Created by 余亮 on 16/6/23.
//  Copyright © 2016年 余亮. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "NSObject+KVO.h"


@interface  ViewController ()
@property(nonatomic,strong)Person * p ;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Person * p = [[Person alloc] init];
    _p = p ;
    
    //添加观察者
    [p yl_addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew context:nil];
    //1.只要p的age属性发生改变，就会调用观察者的observeValueForKeyPath
    
   
    
}


// 监听的属性只要一改变就调用
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    NSLog(@"%d",_p.age);
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
        _p.age++;
    
    ///注意：如果不调用Person对象的set方法，则不会产生事件流
//        _p->_age ++;
}

@end










































