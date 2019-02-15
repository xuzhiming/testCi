//
//  ViewController.m
//  testCi
//
//  Created by xzming on 2019/2/9.
//  Copyright © 2019年 HZMC. All rights reserved.
//

#import "ViewController.h"
#import <Masonry/Masonry.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self testCode];
}

-(void)testCode{
    UIView *lv = [UIView new];
    lv.backgroundColor = [UIColor redColor];
    UIView *pv = [UIView new];
    pv.backgroundColor = [UIColor blueColor];
    [self.view addSubview:pv];
    [pv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    [self.view layoutIfNeeded];
    [pv addSubview:lv];
    [lv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(pv.mas_centerX).dividedBy(2);
        make.centerY.equalTo(pv);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
    
    UIView *rv = [UIView new];
    rv.backgroundColor = [UIColor greenColor];
    [pv addSubview:rv];
    [rv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(pv.mas_centerX).multipliedBy(1.5);
        make.centerY.equalTo(pv);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
    
    
}


@end
