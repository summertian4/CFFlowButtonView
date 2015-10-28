//
//  ViewController.m
//  CFFlowButtonView
//
//  Created by 周凌宇 on 15/10/27.
//  Copyright © 2015年 周凌宇. All rights reserved.
//

#import "ViewController.h"
#import "CFFlowButtonView.h"
#import "Masonry.h"

@interface ViewController ()

@property (nonatomic, weak) CFFlowButtonView *flowButtonView;
@property (nonatomic, strong) NSMutableArray *buttonList;

@end

@implementation ViewController


#pragma mark - =======================懒加载=======================
- (NSMutableArray *)buttonList {
    if (_buttonList == nil) {
        _buttonList = [NSMutableArray array];
        for (int i = 0; i < 18; i++) {
            UIButton *button = [[[NSBundle mainBundle] loadNibNamed:@"MyButton" owner:self options:nil] lastObject];
            [button setTitle:[NSString stringWithFormat:@"按钮%d", i] forState:UIControlStateNormal];
            // 模拟一些不同宽度和颜色，我很懒。。。就不写随机函数了
            if (i == 0 || i == 10) {
                button.width = 75;
                button.backgroundColor = [UIColor colorWithRed:102/255.0 green:180/255.0 blue:180/255.0 alpha:1];
            }
            if (i == 15 || i == 9 || i == 6) {
                button.width = 100;
                 button.backgroundColor = [UIColor colorWithRed:255/255.0 green:196/255.0 blue:102/255.0 alpha:1];
            }
            [_buttonList addObject:button];
        }
    }
    return _buttonList;
}

#pragma mark - =======================viewDidLoad=======================
- (void)viewDidLoad {
    [super viewDidLoad];
    [self addFlowButtonView];
}


/**
 *  设置FlowButtonView
 */
- (void)addFlowButtonView {

    // 实例化一个CFFlowButtonView对象
    CFFlowButtonView *flowButtonView = [[CFFlowButtonView alloc] initWithButtonList:self.buttonList];
    [self.view addSubview:flowButtonView];
    self.flowButtonView = flowButtonView;
    
    // 设置约束，不需要设置高度相关的约束
    [self.flowButtonView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(100);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
    }];

    self.flowButtonView.backgroundColor = [UIColor lightGrayColor];
}


@end
