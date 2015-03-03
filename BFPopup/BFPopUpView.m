//
//  SWPopUpTableView.m
//  SWUIKit
//
//  Created by Bacem on 16/02/2015.
//  Copyright (c) 2015 FR. All rights reserved.
//

#import "BFPopUpView.h"

#define defaultMargin 5.0
#define WidthCoef 0.8
#define HeightCoef 0.6
@interface BFPopUpView (){
    
}

@property (nonatomic,strong) UIButton * backgroundButton;
@property (nonatomic,strong) UIButton * doneButton;
@property (nonatomic,strong) UIView * container;
@property (nonatomic,strong) UIView * topView;
@property (nonatomic,strong) UIView * middleView;
@property (nonatomic,strong) UIView * topSeparator;
@property (nonatomic,strong) UIView * bottomSeparator;
@property (nonatomic,assign) CGRect containerFrame;

@end
@implementation BFPopUpView
@synthesize doneButton;
@synthesize titleLabel;
@synthesize tableView;
@synthesize backgroundButton;

-(id)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if(self){
        
    }
    
    return self;
}

-(id)initWithParentViewController:(UIViewController *)parentViewController
{
    self = [super initWithFrame:parentViewController.view.frame];
    
    if(self){
        
        [self setContainerFrame:CGRectMake(0, 0, parentViewController.view.frame.size.height*HeightCoef, parentViewController.view.frame.size.height*WidthCoef)];
        [self setParentViewController:parentViewController];
        [self configureViews];
    }
    return self;
}


-(void)setTitle:(NSString *)title{
    _title = title;
    self.titleLabel.text = _title;
}
-(void)setSubTitle:(NSString *)subTitle{
    _subTitle = subTitle;
    self.subTitleLabel.text = _subTitle;
}

-(void)setTableViewDataSourceDelegate:(id<UITableViewDataSource>)delegate{
    [self.tableView setDataSource:delegate];
}
-(void)setTableViewDelegate:(id<UITableViewDelegate>)delegate{
    [self.tableView setDelegate:delegate];
}
-(void)reloadData{
    if(self.tableView){
        [self.tableView reloadData];
    }
}
-(void)configureViews{
    
    self.backgroundButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.backgroundButton addTarget:self action:@selector(dimiss) forControlEvents:UIControlEventTouchUpInside];
    self.backgroundButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.backgroundButton setBackgroundColor:[UIColor clearColor]];
    [self addSubview:self.backgroundButton];
    
    NSString * backgroundButtonH = [NSString stringWithFormat:@"H:|[backgroundButton]|"];
    NSString * backgroundButtonV = [NSString stringWithFormat:@"V:|[backgroundButton]|"];
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:backgroundButtonH
                                                                 options:0
                                                                 metrics:nil
                                                                   views:NSDictionaryOfVariableBindings(backgroundButton)]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:backgroundButtonV
                                                                 options:0
                                                                 metrics:nil
                                                                   views:NSDictionaryOfVariableBindings(backgroundButton)]];
    
    
    self.container = [[UIView alloc] init];
    self.container.center = self.center;
    [self.container.layer setCornerRadius:10.0];
    [self.container.layer setMasksToBounds:YES];
    [self setBackgroundColor:[UIColor blackColor]];
    [self setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.5]];
    self.container.translatesAutoresizingMaskIntoConstraints = NO;
    self.container.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.container];
    
    
    
    self.topView = [[UIView alloc] init];
    self.topView.translatesAutoresizingMaskIntoConstraints=NO;
    [self.container addSubview:self.topView];
    
    
    self.middleView = [[UIView alloc] init];
    self.middleView.translatesAutoresizingMaskIntoConstraints=NO;
    [self.container addSubview:self.middleView];
    
    self.tableView = [[UITableView alloc] init];
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.middleView addSubview:self.tableView];
    
    
    
    
    self.doneButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.doneButton addTarget:self action:@selector(dimiss) forControlEvents:UIControlEventTouchUpInside];
    self.doneButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.doneButton setTitle:@"OK" forState:UIControlStateNormal];
    [self.doneButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.doneButton setBackgroundColor:[UIColor colorWithRed:242.0/255.0 green:242.0/255.0 blue:242.0/255.0 alpha:1.0]];
    [self.container addSubview:self.doneButton];
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.titleLabel.numberOfLines = 0;
    [self.titleLabel setFont:[UIFont boldSystemFontOfSize:16.0]];
    self.titleLabel.backgroundColor = [UIColor whiteColor];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.titleLabel setText:self.title];
    [self.topView addSubview:self.titleLabel];
    
    self.subTitleLabel = [[UILabel alloc] init];
    [self.subTitleLabel setFont:[UIFont boldSystemFontOfSize:14.0]];
    self.subTitleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.subTitleLabel.numberOfLines = 0;
    self.subTitleLabel.backgroundColor = [UIColor whiteColor];
    self.subTitleLabel.textAlignment = NSTextAlignmentCenter;
    [self.subTitleLabel setText:self.subTitle];
    [self.topView addSubview:self.subTitleLabel];
    
    
    
    self.topSeparator = [[UIView alloc] init];
    self.topSeparator.translatesAutoresizingMaskIntoConstraints=NO;
    [self.container addSubview:self.topSeparator];
    self.topSeparator.backgroundColor=[UIColor grayColor];
    self.bottomSeparator = [[UIView alloc] init];
    self.bottomSeparator.translatesAutoresizingMaskIntoConstraints=NO;
    [self.container addSubview:self.bottomSeparator];
    self.bottomSeparator.backgroundColor=[UIColor grayColor];
    
    
    [self configureContainer];
    [self configureTopView];
    [self configureTitleLabel];
    [self configureSubTitleLabel];
    [self configureTableView];
    [self configureDoneButton];
    //#error cell actoion not work
    //    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dimiss) ];
    //    UITapGestureRecognizer *emptyRecognizer= [[UITapGestureRecognizer alloc] initWithTarget:self action:nil];
    //    [self.container addGestureRecognizer:emptyRecognizer];
    //    [tapRecognizer requireGestureRecognizerToFail:emptyRecognizer];
    //    [self addGestureRecognizer:tapRecognizer];
    //
    //    self.container.backgroundColor = [UIColor whiteColor];
}

-(void)configureContainer{
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.container
                                                     attribute:NSLayoutAttributeCenterX
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.container.superview
                                                     attribute:NSLayoutAttributeCenterX
                                                    multiplier:1.0
                                                      constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.container
                                                     attribute:NSLayoutAttributeCenterY
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.container.superview
                                                     attribute:NSLayoutAttributeCenterY
                                                    multiplier:1.0
                                                      constant:0]];
    
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.container
                                                     attribute:NSLayoutAttributeHeight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.container.superview
                                                     attribute:NSLayoutAttributeHeight
                                                    multiplier:HeightCoef
                                                      constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.container
                                                     attribute:NSLayoutAttributeWidth
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.container.superview
                                                     attribute:NSLayoutAttributeWidth
                                                    multiplier:WidthCoef
                                                      constant:0]];
}
-(void)configureTopView{
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.topView
                                                     attribute:NSLayoutAttributeHeight
                                                     relatedBy:NSLayoutRelationGreaterThanOrEqual
                                                        toItem:self.topView.superview
                                                     attribute:NSLayoutAttributeHeight
                                                    multiplier:0.15
                                                      constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.topView
                                                     attribute:NSLayoutAttributeTop
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.topView.superview
                                                     attribute:NSLayoutAttributeTop
                                                    multiplier:1.0
                                                      constant:defaultMargin]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.topView
                                                     attribute:NSLayoutAttributeLeft
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.topView.superview
                                                     attribute:NSLayoutAttributeLeft
                                                    multiplier:1.0
                                                      constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.topView
                                                     attribute:NSLayoutAttributeRight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.topView.superview
                                                     attribute:NSLayoutAttributeRight
                                                    multiplier:1.0
                                                      constant:0]];
}
-(void)configureTitleLabel{
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.titleLabel
                                                     attribute:NSLayoutAttributeTop
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.titleLabel.superview
                                                     attribute:NSLayoutAttributeTop
                                                    multiplier:1.0
                                                      constant:defaultMargin*2]];
    
    
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.titleLabel
                                                     attribute:NSLayoutAttributeLeft
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.titleLabel.superview
                                                     attribute:NSLayoutAttributeLeft
                                                    multiplier:1.0
                                                      constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.titleLabel
                                                     attribute:NSLayoutAttributeRight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.titleLabel.superview
                                                     attribute:NSLayoutAttributeRight
                                                    multiplier:1.0
                                                      constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.titleLabel
                                                     attribute:NSLayoutAttributeBottom
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.titleLabel.superview
                                                     attribute:NSLayoutAttributeCenterY
                                                    multiplier:1.0
                                                      constant:0]];
}


-(void)configureSubTitleLabel{
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.subTitleLabel
                                                     attribute:NSLayoutAttributeBottom
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.subTitleLabel.superview
                                                     attribute:NSLayoutAttributeBottom
                                                    multiplier:1.0
                                                      constant:-defaultMargin]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.subTitleLabel
                                                     attribute:NSLayoutAttributeTop
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.titleLabel
                                                     attribute:NSLayoutAttributeBottom
                                                    multiplier:1.0
                                                      constant:defaultMargin]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.subTitleLabel
                                                     attribute:NSLayoutAttributeLeft
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.subTitleLabel.superview
                                                     attribute:NSLayoutAttributeLeft
                                                    multiplier:1.0
                                                      constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.subTitleLabel
                                                     attribute:NSLayoutAttributeRight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.subTitleLabel.superview
                                                     attribute:NSLayoutAttributeRight
                                                    multiplier:1.0
                                                      constant:0]];
    
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.topSeparator
                                                     attribute:NSLayoutAttributeTop
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.topView
                                                     attribute:NSLayoutAttributeBottom
                                                    multiplier:1.0
                                                      constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.topSeparator
                                                     attribute:NSLayoutAttributeHeight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.topSeparator.superview
                                                     attribute:NSLayoutAttributeHeight
                                                    multiplier:0
                                                      constant:0.5]];
    
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.topSeparator
                                                     attribute:NSLayoutAttributeLeft
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.topSeparator.superview
                                                     attribute:NSLayoutAttributeLeft
                                                    multiplier:1.0
                                                      constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.topSeparator
                                                     attribute:NSLayoutAttributeRight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.topSeparator.superview
                                                     attribute:NSLayoutAttributeRight
                                                    multiplier:1.0
                                                      constant:0]];
    
}


-(void)configureTableView{
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.middleView
                                                     attribute:NSLayoutAttributeTop
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.topSeparator
                                                     attribute:NSLayoutAttributeBottom
                                                    multiplier:1.0
                                                      constant:defaultMargin]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.middleView
                                                     attribute:NSLayoutAttributeBottom
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.bottomSeparator
                                                     attribute:NSLayoutAttributeTop
                                                    multiplier:1.0
                                                      constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.middleView
                                                     attribute:NSLayoutAttributeLeft
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.middleView.superview
                                                     attribute:NSLayoutAttributeLeft
                                                    multiplier:1.0
                                                      constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.middleView
                                                     attribute:NSLayoutAttributeRight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.middleView.superview
                                                     attribute:NSLayoutAttributeRight
                                                    multiplier:1.0
                                                      constant:0]];
    
    //tableview
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.tableView
                                                     attribute:NSLayoutAttributeTop
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.tableView.superview
                                                     attribute:NSLayoutAttributeTop
                                                    multiplier:1.0
                                                      constant:0.0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.tableView
                                                     attribute:NSLayoutAttributeBottom
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.tableView.superview
                                                     attribute:NSLayoutAttributeBottom
                                                    multiplier:1.0
                                                      constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.tableView
                                                     attribute:NSLayoutAttributeLeft
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.tableView.superview
                                                     attribute:NSLayoutAttributeLeft
                                                    multiplier:1.0
                                                      constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.tableView
                                                     attribute:NSLayoutAttributeRight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.tableView.superview
                                                     attribute:NSLayoutAttributeRight
                                                    multiplier:1.0
                                                      constant:0]];
    
}

-(void)configureDoneButton{
    
    
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.bottomSeparator
                                                     attribute:NSLayoutAttributeBottom
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.doneButton
                                                     attribute:NSLayoutAttributeTop
                                                    multiplier:1.0
                                                      constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.bottomSeparator
                                                     attribute:NSLayoutAttributeHeight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.bottomSeparator.superview
                                                     attribute:NSLayoutAttributeHeight
                                                    multiplier:0
                                                      constant:0.5]];
    
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.bottomSeparator
                                                     attribute:NSLayoutAttributeLeft
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.bottomSeparator.superview
                                                     attribute:NSLayoutAttributeLeft
                                                    multiplier:1.0
                                                      constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.bottomSeparator
                                                     attribute:NSLayoutAttributeRight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.bottomSeparator.superview
                                                     attribute:NSLayoutAttributeRight
                                                    multiplier:1.0
                                                      constant:0]];
    
    //done button
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.doneButton
                                                     attribute:NSLayoutAttributeHeight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.doneButton.superview
                                                     attribute:NSLayoutAttributeHeight
                                                    multiplier:0.12
                                                      constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.doneButton
                                                     attribute:NSLayoutAttributeBottom
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.doneButton.superview
                                                     attribute:NSLayoutAttributeBottom
                                                    multiplier:1.0
                                                      constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.doneButton
                                                     attribute:NSLayoutAttributeLeft
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.doneButton.superview
                                                     attribute:NSLayoutAttributeLeft
                                                    multiplier:1.0
                                                      constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.doneButton
                                                     attribute:NSLayoutAttributeRight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.doneButton.superview
                                                     attribute:NSLayoutAttributeRight
                                                    multiplier:1.0
                                                      constant:0]];
}

-(void)show{
    if(!self.superview){
        
        self.center = self.parentViewController.view.center;
        [self.parentViewController.view addSubview:self];
        [self showAnimation];
        
    }
}

-(void)dimiss{
    if(self.superview){
        [self hideAnimation];
        
    }
}

-(void)showAnimation{
    
    self.container.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.001, 0.001);
    
    [UIView animateWithDuration:0.25 animations:^{
        self.container.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.1 animations:^{
            self.container.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.1 animations:^{
                self.container.transform = CGAffineTransformIdentity;
            } completion:^(BOOL finished) {
                // CGPoint center = self.parentViewController.view.center;
                // self.center = center;
            }];
        }];
    }];
    
}

-(void)hideAnimation{
    
    // self.container.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.001, 0.001);
    
    [UIView animateWithDuration:0.25 animations:^{
        self.container.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.1 animations:^{
            self.container.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.01, 0.01);
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
            if([self.delegate respondsToSelector:@selector(popUpViewDismised:)]){
                [self.delegate popUpViewDismised:self];
            }
        }];
    }];
    
}

-(void)layoutSubviews{
    [super layoutSubviews];
    if(self.frame.size.height < self.tableView.contentSize.height){
        
    }
}
@end
