# DrawView
### 1、效果图：
![](http://upload-images.jianshu.io/upload_images/6722970-d91c89e0bc6eaa41.gif?imageMogr2/auto-orient/strip%7CimageView2/2/w/372)
### 2、简单使用：
```
    //可以通过代码创建或者绑定到storyboard上的UIView
    DrawView *drawView=[[DrawView alloc] init];
    drawView.frame=CGRectMake(0, 100, self.view.bounds.size.width, 300);
    [self.view addSubview:drawView];
    //设置画板背景颜色
    drawView.backgroundColor=[UIColor blackColor];
    //设置画笔宽度
    drawView.lineWidth=5;
    //设置画笔颜色
    drawView.lineColor=[UIColor redColor];
```
### 3、博客地址：
http://www.jianshu.com/u/233cde23b90c
