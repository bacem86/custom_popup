//
//  SWPopUpTableView.h
//  SWUIKit
//
//  Created by Bacem on 16/02/2015.
//  Copyright (c) 2015 FR. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol BFPopUpViewDelegate;

@interface BFPopUpView : UIView

@property (nonatomic,weak) id <BFPopUpViewDelegate> delegate;
@property (nonatomic,strong) UITableView * tableView;
@property (nonatomic,strong) UIViewController * parentViewController;
@property (nonatomic,strong) NSString * title;
@property (nonatomic,strong) NSString * subTitle;
@property (nonatomic,strong) UILabel * titleLabel;
@property (nonatomic,strong) UILabel * subTitleLabel;
@property (nonatomic,strong) NSArray * dataSource;
-(id)initWithParentViewController:(UIViewController*)parentViewController;
-(void)show;
-(void)reloadData;
-(void)setTableViewDataSourceDelegate:(id<UITableViewDataSource>)delegate;
-(void)setTableViewDelegate:(id<UITableViewDelegate>)delegate;
@end


@protocol BFPopUpViewDelegate <NSObject>

@optional
- (void)popUpViewDismised:(BFPopUpView*)popUpView;
@end