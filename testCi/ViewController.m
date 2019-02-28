//
//  ViewController.m
//  testCi
//
//  Created by xzming on 2019/2/9.
//  Copyright © 2019年 HZMC. All rights reserved.
//

#import "ViewController.h"
#import <Masonry/Masonry.h>
#import "TestCview.h"
#import <AVKit/AVKit.h>
#import <pthread.h>
#import "testCi-Swift.h"

@interface ViewController ()

@property (nonatomic, strong) NSMapTable *maptest;
@property (nonatomic, strong) UIView *leftV;
@property (nonatomic, strong) UIView *rightV;
@property (nonatomic, strong) TestCview *testCv;
@end

@implementation ViewController

void testAdd(int * p1, int * p2, int * inc){
    *p1 += *inc;
    *p2 += *inc;
}

void* test(void * pam){
    NSLog(@"testThread go");
    int a = 1, b = 2;
    int c = a; //address of a and c is not same.
    testAdd(&a, &b, &c);
    NSLog(@"res: a: %d, b: %d, inc: %d", a, b, c);
    NSLog(@"pointer: a: %p, b: %p, c: %p", &a, &b, &c);
    pthread_exit(0);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSData *testData = [@"testD" dataUsingEncoding:NSUTF8StringEncoding];
    NSPurgeableData *pd = [[NSPurgeableData alloc] initWithData:testData];
    if([pd beginContentAccess]){
        
        
        [pd endContentAccess];
        [pd discardContentIfPossible];
    }
    
    [[NSData alloc] initWithContentsOfFile:@"" options:NSDataReadingMappedAlways error:nil];
    
    _maptest = [[NSMapTable alloc] initWithKeyOptions:NSPointerFunctionsStrongMemory valueOptions:NSMapTableWeakMemory capacity:0];
//    [self testMap];
    
    [self testCode];

    [self testPthread];
}

- (void)testPthread{
    pthread_mutex_t tm;
    pthread_mutex_init(&tm, NULL);
    pthread_mutex_destroy(&tm);
    
    pthread_t threadt;
    pthread_attr_t ac ;
    pthread_create(&threadt, NULL, (void *)test, NULL);
}

- (void)testMap{
    NSLog(@"tapped !!");
    [[[testSwiftObA alloc] initWithParm:0] testfa];
    _testCv.backgroundColor = [UIColor brownColor];
    
    [self testAnimation];
    
    return;
    NSData *data = [@"test" dataUsingEncoding:NSUTF8StringEncoding];
    
    __block int testRound = 0;
    __weak typeof (ViewController) *_ws = self;
    [NSTimer scheduledTimerWithTimeInterval:5 repeats:YES block:^(NSTimer * _Nonnull timer) {
        if (testRound++ == 10) {
            [timer invalidate];
            return ;
        }
        __strong typeof (ViewController) *ws = _ws;
        if (!ws) {
            return;
        }
//        NSString *testv = @"abcd";
        int gap = 100000;
        for (int i = testRound*gap ; i < (testRound + 1) * gap; i++) {
            [ws.maptest setObject:data forKey:@(i)];
        }
        
    }];
    
    
}

- (void)testAnimation{
    [self testLayerBasicAnim];
    return;
    
    self.leftV.transform = CGAffineTransformIdentity;
    [UIView animateKeyframesWithDuration:2 delay:0 options:UIViewKeyframeAnimationOptionCalculationModeLinear animations:^{
        
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0.2 animations:^{
            self.leftV.transform = CGAffineTransformMakeRotation(45);
        }];
        
        [UIView addKeyframeWithRelativeStartTime:0.2 relativeDuration:0.5 animations:^{
            self.leftV.transform = CGAffineTransformScale( CGAffineTransformMakeRotation(45), .5, .5);
//            self.leftV.transform = CGAffineTransformMakeScale(.5, .5);
        }];
        
        [UIView addKeyframeWithRelativeStartTime:0.7 relativeDuration:0.3 animations:^{
            
            self.leftV.transform = CGAffineTransformIdentity;

        }];
        
        
    } completion:^(BOOL finished) {
        [self testViewTrans];
    }];
    
}

- (void)testViewTrans{
    [UIView transitionWithView:self.view duration:2 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
        
    } completion:^(BOOL finished) {
        [UIView transitionFromView:self.rightV toView:self.leftV duration:1 options:UIViewAnimationOptionTransitionCrossDissolve completion:^(BOOL finished) {
            NSLog(@"testl :%@", self.leftV);
        }];
        
    }];
    
    
}

- (void)testAudioVideo{
    
}

- (void)testViewPropertyAnimator{
    
    if (@available(iOS 10.0, *)) {
        UIViewPropertyAnimator *vpa = [[UIViewPropertyAnimator alloc] initWithDuration:1 curve:UIViewAnimationCurveLinear animations:^{
            self.leftV.backgroundColor = UIColor.grayColor;
            
        }];
        [vpa startAnimation];

    } else {
        // Fallback on earlier versions
    }
    
}

- (void)testLayerBasicAnim{
    NSDictionary *dict = @{@"a" : @"b"};
    NSData *data = [NSJSONSerialization dataWithJSONObject:dict options:kNilOptions error:nil];
    NSError *err = nil;
    id info = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&err];
    
    
//    [self testViewPropertyAnimator];
//    return;
    
//    CATransition *trans = [CATransition animation];
//    trans.startProgress = 0;
//    trans.endProgress = 1;
//    trans.type = kCATransitionMoveIn;
//    trans.subtype = kCATransitionFromLeft;
//    trans.duration = 2;
//    [_leftV.layer addAnimation:trans forKey:nil];

    CFTimeInterval duration = 2;
    
    [CATransaction begin];
//    [CATransaction setAnimationDuration:duration];
    [CATransaction setCompletionBlock:^{
        NSLog(@"end animate");
    }];
    

    CABasicAnimation *animbg = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    animbg.fromValue = (id)UIColor.redColor.CGColor;
    animbg.toValue = (id)UIColor.greenColor.CGColor;
    animbg.duration = duration;
    [_leftV.layer addAnimation:animbg forKey:nil];
    
    
    [CATransaction commit];
    
    return;
    
    CAKeyframeAnimation *kanim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    kanim.values = @[@(CGPointMake(80, 80)), @(CGPointMake(180, 100)), @(CGPointMake(80, 80)), @(CGPointMake(80, 200))];
//    kanim.duration = 1;
    kanim.calculationMode = kCAAnimationLinear;
    [kanim setKeyTimes:@[@(0), @(0.5), @(0.75), @(1)]];
    
    CABasicAnimation *anim2 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    anim2.fromValue = @(0.5);
    anim2.toValue = @(1.5);
    
    CABasicAnimation *anima3 = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    anima3.toValue = @(M_PI * 2);
    
    CAAnimationGroup *ag = [CAAnimationGroup animation];
    ag.animations = @[kanim, anim2, anima3];
    ag.duration = 3;
    
    [_leftV.layer addAnimation:ag forKey:nil];
    
//    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"position"];
//    anim.fromValue = [NSValue valueWithCGPoint:CGPointMake(40, 40)];
//    anim.toValue = [NSValue valueWithCGPoint:CGPointMake(100, 100)];
//    anim.duration = 1;
//    anim.fillMode = kCAFillModeForwards;
//    anim.removedOnCompletion = NO;
//    [_leftV.layer addAnimation:anim forKey:nil];
}

- (void)testCode{
    UIView *lv = [UIView new];
    _leftV = lv;
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
        make.centerX.equalTo(pv.mas_centerX).dividedBy(2).mas_offset(0);
        make.centerY.equalTo(pv);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
    
    UIView *rv = [UIView new];
    _rightV = rv;
    rv.backgroundColor = [UIColor greenColor];
    [pv addSubview:rv];
    [rv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(pv.mas_centerX).multipliedBy(1.5);
        make.centerY.equalTo(pv);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
    
    TestCview *cv = [[[testSwiftOb alloc] initWithTest:1] createTestView];
    _testCv = cv;
    cv.layer.shouldRasterize = YES;
    cv.layer.rasterizationScale = [UIScreen mainScreen].scale;
    cv.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:cv];
    [cv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lv.mas_bottom).offset(20);
        make.centerX.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(50, 50));
    }];
    
    UIButton *testbtn = [UIButton buttonWithType:UIButtonTypeSystem];
    testbtn.backgroundColor = [UIColor purpleColor];
    [testbtn setTitle:@"testMap" forState:UIControlStateNormal];
    [testbtn addTarget:self action:@selector(testMap) forControlEvents:UIControlEventTouchUpInside];
    [cv addSubview:testbtn];
    [testbtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(cv);
        make.size.mas_equalTo(CGSizeMake(100, 40));
    }];
    
}


@end
