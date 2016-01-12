//
//  ViewController.m
//  DownloadAnimation
//
//  Created by mini4s215 on 1/12/16.
//  Copyright © 2016 victor. All rights reserved.
//

#import "ViewController.h"
#import "LoadingView.h"

@interface ViewController ()

@property (nonatomic,strong) LoadingView *loadingView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.loadingView = [[LoadingView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    
    [self.view addSubview:self.loadingView];
    [self.loadingView startAnimation];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
