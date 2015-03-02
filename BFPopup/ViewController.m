//
//  ViewController.m
//  SWUIKit
//
//  Created by Bacem on 16/02/2015.
//  Copyright (c) 2015 FR. All rights reserved.
//

#import "ViewController.h"
#import "BFPopUpView.h"

@interface ViewController () <BFPopUpViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"show" forState:UIControlStateNormal];
    button.translatesAutoresizingMaskIntoConstraints = NO;
    [button addTarget:self action:@selector(showPooUp:) forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:button];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:button
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:button.superview
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:button
                                                          attribute:NSLayoutAttributeCenterY
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:button.superview
                                                          attribute:NSLayoutAttributeCenterY
                                                         multiplier:1.0
                                                           constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:button
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:button.superview
                                                          attribute:NSLayoutAttributeWidth
                                                         multiplier:0.0
                                                           constant:100]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:button
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:button.superview
                                                          attribute:NSLayoutAttributeHeight
                                                         multiplier:0.0
                                                           constant:50]];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)showPooUp:(id)sender{
    
    BFPopUpView * p = [[BFPopUpView alloc] initWithParentViewController:self];
    p.delegate = self;
    //p.tableView.delegate = self;
    [p show];
}

-(void)popUpViewDismised:(BFPopUpView *)popUpView{
    
}
@end
