//
//  TTT.m
//  BuglyHotFixDemo
//
//  Created by Richard on 14/9/2019.
//  Copyright © 2019 a. All rights reserved.
//

#import "TTT.h"
#import <BuglyHotFixDemo-Swift.h>
//#import "ViewController.swift"
typedef void(^result)(BOOL result);

@implementation TTT

- (instancetype)init {
    self = [super init];
    if (self) {
        HTViewController *v = [[HTViewController alloc] init];
        [v testLog];
        [HTViewController testLog];
        [v enumTestWithLanguage:0];
//        [v sayWithHello:<#(NSString * _Nonnull)#>]
        [v callWithName:@"tom" eat:@"apple"];
        [v callWithName:@"Tom" eat:@"Apple" result:^(BOOL res) {
            
        }];
    }
    return self;
}
- (void)callWithName:(NSString*)name eat:(NSString *)fruit result:(result)result{
    result(false);
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
//   ViewController *v = [[ViewController alloc] init];
    
}


@end
