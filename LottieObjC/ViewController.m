//
//  ViewController.m
//  LottieObjC
//
//  Created by 米画师 on 2024/4/16.
//

#import "ViewController.h"
#import "LottieObjC-Swift.h"

@interface ViewController ()

@property (nonatomic, strong) LottieView *lottieView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.lottieView = ({
        CGFloat width = CGRectGetWidth(self.view.bounds);
        LottieView *lottieView = [[LottieView alloc] initWithFrame:CGRectMake(0, 0, width, width)];
        lottieView.loop = YES;
        [lottieView loadAnimationWithName:@"dog_car_ride"];
        [self.view addSubview:lottieView];
        lottieView;
    });
}

- (void)viewDidLayoutSubviews  {
    [super viewDidLayoutSubviews];
    
    self.lottieView.center = self.view.center;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self.lottieView play];
}

@end
