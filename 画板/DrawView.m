//
//  DrawView.m
//  画板
//
//  Created by zyj on 2017/12/13.
//  Copyright © 2017年 ittest. All rights reserved.
//

#import "DrawView.h"
#import "MyUIBezierPath.h"
@interface DrawView()
@property(nonatomic,strong) NSMutableArray *paths;//用来管理画板上所有的路径
@end
@implementation DrawView

-(NSArray *)paths{
    if(!_paths){
        _paths=[NSMutableArray array];
    }
    return _paths;
}

- (void)clean{
    [self.paths removeAllObjects];
    //重绘
    [self setNeedsDisplay];
}

- (void)undo{
    [self.paths removeLastObject];
    //重绘
    [self setNeedsDisplay];
}

- (void)eraser{
    _lineColor=self.backgroundColor;
}

- (void)save{
    //开启图片上下文
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, 0);
    //获取上下文
    CGContextRef context=UIGraphicsGetCurrentContext();
    //截屏
    [self.layer renderInContext:context];
    //获取图片
    UIImage *image= UIGraphicsGetImageFromCurrentImageContext();
    //关闭图片上下文
    UIGraphicsEndImageContext();
    //保存到相册
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(imageSavedToPhotosAlbum:didFinishSavingWithError:contextInfo:), nil);
}

//保存图片的回调
- (void)imageSavedToPhotosAlbum:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
    NSString *message = @"";
    if (!error) {
        message = @"成功保存到相册";
    }else{
        message = [error description];
    }
    NSLog(@"message is %@",message);
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    // 获取触摸对象
    UITouch *touch=[touches anyObject];
    // 获取手指的位置
    CGPoint point=[touch locationInView:touch.view];
    //当手指按下的时候就创建一条路径
    MyUIBezierPath *path=[MyUIBezierPath bezierPath];
    //设置画笔宽度
    if(_lineWidth<=0){
        [path setLineWidth:5];
    }else{
        [path setLineWidth:_lineWidth];
    }
    //设置画笔颜色
    [path setLineColor:_lineColor];
    //设置起点
    [path moveToPoint:point];
    // 把每一次新创建的路径 添加到数组当中
    [self.paths addObject:path];
}


-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    // 获取触摸对象
    UITouch *touch=[touches anyObject];
    // 获取手指的位置
    CGPoint point=[touch locationInView:touch.view];
    // 连线的点
    [[self.paths lastObject] addLineToPoint:point];
    // 重绘
    [self setNeedsDisplay];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    for (MyUIBezierPath *path in self.paths) {
        //设置颜色
        [path.lineColor set];
        // 设置连接处的样式
        [path setLineJoinStyle:kCGLineJoinRound];
        // 设置头尾的样式
        [path setLineCapStyle:kCGLineCapRound];
        //渲染
        [path stroke];
    }
}


@end
