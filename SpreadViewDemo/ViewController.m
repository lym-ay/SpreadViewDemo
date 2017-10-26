//
//  ViewController.m
//  SpreadViewDemo
//
//  Created by olami on 2017/10/26.
//  Copyright © 2017年 VIA Technologies, Inc. & OLAMI Team. All rights reserved.
//

#import "ViewController.h"

#define kWidth [ UIScreen mainScreen ].bounds.size.width
#define kHeight [ UIScreen mainScreen ].bounds.size.height

@interface ViewController () {
     BOOL touchStatus;
}
@property (nonatomic,strong)UIView *myStongView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _myStongView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWidth-40,kHeight-2*64)];
    _myStongView.hidden = YES;
    _myStongView.layer.position = CGPointMake(kWidth-20, 64);
    _myStongView.layer.anchorPoint = CGPointMake(1,0);
    _myStongView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:_myStongView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event
{
    if (!touchStatus) {
        _myStongView.hidden = NO;
        _myStongView.alpha = 0.8;
        [self animationSpread:_myStongView];
        touchStatus = YES;
    }else{
        
        [self animationBack:_myStongView];
        touchStatus = NO;
    }
    
}

- (void)animationSpread:(UIView*)view {
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];
    scaleAnimation.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(0, 0, 1)];
    scaleAnimation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(1, 1, 1)];
    scaleAnimation.duration = 1.5;
    scaleAnimation.cumulative = NO;
    scaleAnimation.repeatCount = 1;
    [scaleAnimation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault]];
    view.layer.transform = CATransform3DMakeScale(1, 1, 1);//当动画完成后，保持现状
    [view.layer addAnimation: scaleAnimation forKey:@"myScale"];
}

- (void)animationBack:(UIView*)view {
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];
    scaleAnimation.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(1, 1, 1)];
    scaleAnimation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(0, 0, 1)];
    scaleAnimation.duration = 1.5;
    scaleAnimation.cumulative = NO;
    scaleAnimation.repeatCount = 1;
    [scaleAnimation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault]];
    view.layer.transform = CATransform3DMakeScale(0, 0, 1);
    [view.layer addAnimation: scaleAnimation forKey:@"myScale"];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
