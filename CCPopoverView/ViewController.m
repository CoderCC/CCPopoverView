//
//  ViewController.m
//  CCPopoverView
//
//  Created by 魏朋 on 2019/8/5.
//  Copyright © 2019 魏朋. All rights reserved.
//

#import "ViewController.h"
#import "CCCardInfoView.h"
#import "CCPopoverView.h"
#import "CCLineFromBottomView.h"
#import "CCCardPickerView.h"
#import "CCAlertView.h"
#import "CCCardInfoView.h"


@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, strong) NSArray *items;
@property (nonatomic, weak) UISegmentedControl *segmentedControl;
@property (nonatomic, strong) id customView;
@property (nonatomic, assign) CCCardInfoType cardInfoType;

@end

@implementation ViewController

- (void)setupSubviews{
    self.cardInfoType = CCCardInfoTypeAlpha;
    self.items = @[@{@"title" : @"左上进入/底部消失", @"style" : @6},
                   @{@"title" : @"右上进入/底部消失", @"style" : @7},
                   @{@"title" : @"左上进入/顶部消失", @"style" : @8},
                   @{@"title" : @"Spring顶部进入/顶部消失", @"style" : @2},
                   @{@"title" : @"Spring底部进入/底部消失", @"style" : @3},
                   @{@"title" : @"Spring左侧进入/左侧消失", @"style" : @4},
                   @{@"title" : @"Spring右侧进入/右侧消失", @"style" : @5},
                   @{@"title" : @"ActionSheet", @"style" : @9},
                   @{@"title" : @"缩放", @"style" : @1},
                   @{@"title" : @"无动画", @"style" : @0}];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    [self.view addSubview:tableView];
    self.tableView = tableView;
    self.tableView.separatorInset = UIEdgeInsetsZero;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    
     //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(statusBarOrientationDidChanged:) name:UIApplicationDidChangeStatusBarOrientationNotification object:nil];
}






#pragma mark - UITableView DataSource & Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"CCTableViewCellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    if (indexPath.row >= 0 && indexPath.row < self.items.count) {
        NSDictionary *dict = self.items[indexPath.row];
        cell.textLabel.text = dict[@"title"];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40.0f;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row >= 0 && indexPath.row < self.items.count) {
        NSDictionary *dict = self.items[indexPath.row];
        NSInteger style = ((NSNumber *)dict[@"style"]).integerValue;
        [self showPopoverViewWithAnimationStyle:style];
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 40.f)];
    if (!self.segmentedControl) {
        UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"ScrollPicker", @"Alert", @"Dialog"]];
        segmentedControl.frame = CGRectMake(15, 0, backgroundView.frame.size.width - 30.f , 32.0f);
        [backgroundView addSubview:segmentedControl];
        self.segmentedControl = segmentedControl;
        self.segmentedControl.selectedSegmentIndex = 0;
        self.segmentedControl.apportionsSegmentWidthsByContent = YES;
        [self.segmentedControl addTarget:self action:@selector(segmentedControlDidClicked:) forControlEvents:UIControlEventValueChanged];
        [self segmentedControlDidClicked:self.segmentedControl];
    }
    
    return backgroundView;
}

#pragma mark 选项卡监听
- (void)segmentedControlDidClicked:(UISegmentedControl *)segmentedControl{
    if (0 == segmentedControl.selectedSegmentIndex) {
        self.customView = [CCCardPickerView xib];
        if (self.cardInfoType != CCCardInfoTypeAlpha) {
            [self.customView updatePage:(self.cardInfoType -1)];
        }
    } else if(1 == self.segmentedControl.selectedSegmentIndex){
        self.customView = [CCCardInfoView xibWithCardInfoType:self.cardInfoType];
    } else if (2 == self.segmentedControl.selectedSegmentIndex){
        self.customView = [CCAlertView xib];
    }
}

- (void)showPopoverViewWithAnimationStyle:(NSInteger)style{
    CCPopoverStyle popStyle = (CCPopoverStyle)style;
    CCAnimationDismissStyle dismissStyle = (CCAnimationDismissStyle)style;
    if (8 == style) {
        popStyle = CCPopoverStyleCardDropFromLeft;
        dismissStyle = CCAnimationDismissStyleCardDropToTop;
    } else if (9 == style){
        popStyle = CCPopoverStyleLineFromBottom;
        self.customView = [CCLineFromBottomView xib];
    }
    
    if ([self.customView isKindOfClass:[CCLineFromBottomView class]] && style != 9) {
        self.customView = nil;
        [self segmentedControlDidClicked:self.segmentedControl];
    }
    
    CCPopoverView *popoverView = [[CCPopoverView alloc] initWithCustomView:self.customView
                                                                  popStyle:popStyle
                                                              dismissStyle:dismissStyle];
    
    popoverView.isClickBGDismiss = ![self.customView isKindOfClass:[CCCardPickerView class]];
    
    popoverView.popBGAlpha = .5f;
    popoverView.isObserverOrientationChange = YES;
    
    popoverView.popComplete = ^{
        // callback
    };
    
    popoverView.dismissComplete = ^{
        // callback
    };
    
    [self handleCustomActionEvent:popoverView];
    
    [popoverView pop];
    
    
}

- (void)handleCustomActionEvent:(CCPopoverView *)popoverView{
    // 在监听自定义视图的block操作事件时，要使用弱对象来避免循环引用
    __weak typeof(popoverView) weakPopView = popoverView;
    __weak typeof(self.segmentedControl) weakSegCtrl = self.segmentedControl;
    if ([_customView isKindOfClass:[CCCardPickerView class]]) {
        CCCardPickerView *cardView = self.customView;
        cardView.selectActionBlock = ^(NSUInteger currentPage) {
            self.cardInfoType = (CCCardInfoType)(currentPage + 1);
            NSString *segTitle = (self.cardInfoType == CCCardInfoTypeAlpha) ? @"标题1" : ((self.cardInfoType == CCCardInfoTypeBeta) ? @"标题2" : @"标题3");
            [weakSegCtrl setTitle:[NSString stringWithFormat:@"Alert-%@", segTitle] forSegmentAtIndex:1];
            weakSegCtrl.apportionsSegmentWidthsByContent = YES;
            
            [weakPopView dismiss];
        };
    } else if ([_customView isKindOfClass:[CCCardInfoView class]]) {
        CCCardInfoView *infoPopView = self.customView;
        infoPopView.closeActionBlock = ^{
            [weakPopView dismiss];
        };
    } else if ([_customView isKindOfClass:[CCLineFromBottomView class]]) {
        CCLineFromBottomView *lineFromBottomView = self.customView;
        lineFromBottomView.doneActionBlock = ^{
            [weakPopView dismiss];
        };
    } else if ([_customView isKindOfClass:[CCAlertView class]]) {
        CCAlertView *alertView = self.customView;
        alertView.canceSureActionBlock = ^(BOOL isSure) {
            [weakPopView dismiss];
            //NSLog(@"点击了%@", isSure ? @"确定" : @"取消");
        };
    }
}

#pragma mark 设备方向改变
- (void)statusBarOrientationChange:(NSNotification *)notification
{
    self.tableView.frame = self.view.bounds;
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupSubviews];
}


@end
