//
//  ViewController.m
//  画板
//
//  Created by zyj on 2017/12/13.
//  Copyright © 2017年 ittest. All rights reserved.
//

#import "ViewController.h"
#import "DrawView.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet DrawView *drawView;
@property (weak, nonatomic) IBOutlet UIButton *btn1;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    DrawView *drawView=[[DrawView alloc] init];
    drawView.frame=CGRectMake(0, 100, self.view.bounds.size.width, 300);
    [self.view addSubview:drawView];
    self.drawView=drawView;
    //设置画板背景颜色
    self.drawView.backgroundColor=[UIColor blackColor];
    //设置画笔宽度
    self.drawView.lineWidth=5;
    //设置画笔颜色
    self.drawView.lineColor=self.btn1.backgroundColor;
}

- (IBAction)clean:(id)sender {
    [self.drawView clean];
}

- (IBAction)undo:(id)sender {
    [self.drawView undo];
}
- (IBAction)eraser:(id)sender {
    [self.drawView eraser];
}

- (IBAction)save:(id)sender {
    [self.drawView save];
}

- (IBAction)valueChange:(UISlider *)sender {
    self.drawView.lineWidth=sender.value;
}

- (IBAction)btn1Click:(UIButton *)sender {
    self.drawView.lineColor=sender.backgroundColor;
}

- (IBAction)btn2Click:(UIButton *)sender {
    self.drawView.lineColor=sender.backgroundColor;
}

- (IBAction)btn3Click:(UIButton *)sender {
    self.drawView.lineColor=sender.backgroundColor;
}

- (IBAction)btn4Click:(UIButton *)sender {
    self.drawView.lineColor=sender.backgroundColor;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
