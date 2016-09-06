//
//  ViewController.m
//  UIScrollView-02九宫格和滚动条
//
//  Created by liuxingchen on 16/9/6.
//  Copyright © 2016年 Liuxingchen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,strong)UIScrollView * sv ;
@property(nonatomic,strong)UIView * gird ;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.sv = [[UIScrollView alloc]initWithFrame:CGRectMake(30, 50, 300, 300)];
    self.sv.backgroundColor = [UIColor grayColor];
    //是否显示垂直滚动条
    self.sv.showsVerticalScrollIndicator = NO;
    //是否显示水平滚动条
    self.sv.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:self.sv];
    self.sv.contentSize = CGSizeMake(0, 500);
    
    for (int i = 0; i< 50; i++) {
        int col =  i % 4;
        int row =  i / 4;
        CGFloat x = col *(50 +30);
        CGFloat y = row *(50 +30);
       self.gird = [self addGridWithX:x y:y];
    }
    /*
     如果想获取ScrollView的九宫格中的最后一个控件，那么可以直接获取到ScrollView子控件的最后一个
     但是ScrollView中有两个滚动条也是属于ScrollView的子控件，这两个滚动条可能干扰到子控件的顺序
     所以想获取ScrollView子控件的最后一个需要关闭垂直滚动条和水平滚动条
     */
    UIView *lastView =[self.sv.subviews lastObject];
    //获取到最后一个view的Y CGRectGetMaxY是获取最大的Y值
    CGFloat contentH = CGRectGetMaxY(lastView.frame);
    self.sv.contentSize = CGSizeMake(0, contentH);
    NSLog(@"%@",self.sv.subviews);
}
-(UIView *)addGridWithX:(CGFloat)x y:(CGFloat)y
{
    UIView *grid = [[UIView alloc]initWithFrame:CGRectMake(x, y, 50, 50)];
    grid.backgroundColor = [UIColor redColor];
    [self.sv addSubview:grid];
    return grid;
}
@end
