//
//  ViewController.m
//  GuidePage-OC
//
//  Created by 聚财通 on 16/6/2.
//  Copyright © 2016年 付正. All rights reserved.
//

#import "ViewController.h"

#define ScreenWidth self.view.bounds.size.width
#define ScreenHeight self.view.bounds.size.height
// 获取RGB颜色
#define XXColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define XXNewfeatureImageCount 4
#define kRadianToDegrees(radian) (radian* 180.0 )/(M_PI)

@interface ViewController ()<UIScrollViewDelegate>
{
    CGFloat offsetX;
    UIScrollView *pageScrollV;
    
    UIImageView *imageView1;
    UIImageView *pageoneImage1;
    UIImageView *pageoneImage2;
    UIImageView *pageoneImage3;
    UIImageView *pageoneImage4;
    UIImageView *pageoneImage5;
    
    UIImageView *imageView2;
    UIImageView *pagetwoImage1;
    UIImageView *pagetwoImage2;
    UIImageView *pagetwoImage3;
    
    UIImageView *imageView3;
    UIImageView *pagethreeImage1;
    UIImageView *pagethreeImage2;
    UIImageView *pagethreeImage3;
    UIImageView *pagethreeImage4;
    UIImageView *pagethreeImage5;
    
    UIImageView *imageView5;
    UIImageView *pagefiveImage1;
    UIImageView *pagefiveImage2;
    UIImageView *pagefiveImage3;
    UIImageView *pagefiveImage4;
    UIImageView *imgView;
}
@property (nonatomic, weak) UIPageControl *pageControl;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor colorWithWhite:0.152 alpha:1.000];
    
    [self setupScrollView];
    
    [self setupPageControl];
    
    [self createUI];
}

-(void)createUI
{
    //1
    pageoneImage1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 40, ScreenWidth, 30)];
    pageoneImage1.image = [UIImage imageNamed:@"1_01"];
    [imageView1 addSubview:pageoneImage1];
    
    pageoneImage2 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 100, ScreenWidth, ScreenWidth)];
    pageoneImage2.image = [UIImage imageNamed:@"1_02"];
    [imageView1 addSubview:pageoneImage2];
    
    pageoneImage3 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 120, ScreenWidth, ScreenWidth/4)];
    pageoneImage3.image = [UIImage imageNamed:@"1_03"];
    [imageView1 addSubview:pageoneImage3];
    
    pageoneImage4 = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenWidth/6, CGRectGetMaxY(pageoneImage2.frame)+10, ScreenWidth*2/3, 50)];
    pageoneImage4.image = [UIImage imageNamed:@"1_04"];
    [imageView1 addSubview:pageoneImage4];
    
    pageoneImage5 = [[UIImageView alloc]initWithFrame:CGRectMake(40, CGRectGetMaxY(pageoneImage4.frame)+10, ScreenWidth-80, 40)];
    pageoneImage5.image = [UIImage imageNamed:@"1_05"];
    [imageView1 addSubview:pageoneImage5];
    
    //2
    pageoneImage1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 40, ScreenWidth, 30)];
    pageoneImage1.image = [UIImage imageNamed:@"1_01"];
    [imageView2 addSubview:pageoneImage1];
    
    pagetwoImage1 = [[UIImageView alloc]initWithFrame:CGRectMake(-ScreenWidth/2, 100-ScreenWidth/2, ScreenWidth*2, ScreenWidth*2)];
    pagetwoImage1.image = [UIImage imageNamed:@"2_01"];
    [imageView2 addSubview:pagetwoImage1];
    
    pagetwoImage2 = [[UIImageView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(pagetwoImage1.frame)+10, ScreenWidth, 60)];
    pagetwoImage2.image = [UIImage imageNamed:@"2_02"];
    [imageView2 addSubview:pagetwoImage2];
    
    pagetwoImage3 = [[UIImageView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(pagetwoImage2.frame)+10, ScreenWidth, 30)];
    pagetwoImage3.image = [UIImage imageNamed:@"2_03"];
    [imageView2 addSubview:pagetwoImage3];
    
    //3
    pageoneImage1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 40, ScreenWidth, 30)];
    pageoneImage1.image = [UIImage imageNamed:@"1_01"];
    [imageView3 addSubview:pageoneImage1];
    
    pagethreeImage1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 100, ScreenWidth, ScreenWidth*31/36)];
    pagethreeImage1.image = [UIImage imageNamed:@"3_01"];
    [imageView3 addSubview:pagethreeImage1];
    
    pagethreeImage2 = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenWidth, 100, ScreenWidth, ScreenWidth*31/36)];
    pagethreeImage2.image = [UIImage imageNamed:@"3_02"];
    [imageView3 addSubview:pagethreeImage2];
    
    pagethreeImage3 = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenWidth/2, 100, ScreenWidth, ScreenWidth*31/36)];
    pagethreeImage3.image = [UIImage imageNamed:@"3_03"];
    [imageView3 addSubview:pagethreeImage3];
    
    pagethreeImage4 = [[UIImageView alloc]initWithFrame:CGRectMake(10, ScreenHeight, ScreenWidth-20, 60)];
    pagethreeImage4.image = [UIImage imageNamed:@"3_04"];
    pagethreeImage4.alpha = 0;
    [imageView3 addSubview:pagethreeImage4];
    
    pagethreeImage5 = [[UIImageView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(pagethreeImage4.frame)+15, ScreenWidth, 40)];
    pagethreeImage5.image = [UIImage imageNamed:@"3_05"];
    pagethreeImage5.alpha = 0;
    [imageView3 addSubview:pagethreeImage5];
    
    //5
    pagefiveImage1 = [[UIImageView alloc]initWithFrame:CGRectMake(15, 50-300, ScreenWidth-30, 70)];
    pagefiveImage1.image = [UIImage imageNamed:@"5_01"];
    [imageView5 addSubview:pagefiveImage1];
    
    pagefiveImage2 = [[UIImageView alloc]initWithFrame:CGRectMake(55, CGRectGetMaxY(pagefiveImage1.frame)+10-300, ScreenWidth-110, 10)];
    pagefiveImage2.image = [UIImage imageNamed:@"5_02"];
    pagefiveImage2.alpha = 0;
    [imageView5 addSubview:pagefiveImage2];
    
    pagefiveImage3 = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenWidth/4, ScreenHeight-ScreenWidth/2-60+300, ScreenWidth/2, ScreenWidth/4)];
    pagefiveImage3.image = [UIImage imageNamed:@"5_03"];
    pagefiveImage3.alpha = 0;
    [imageView5 addSubview:pagefiveImage3];
    
    pagefiveImage4 = [[UIImageView alloc]initWithFrame:CGRectMake(-ScreenWidth/2, ScreenHeight-ScreenWidth*5/4, ScreenWidth*4, ScreenWidth*4)];
    pagefiveImage4.image = [UIImage imageNamed:@"5_05"];
    pagefiveImage4.alpha = 0;
    [self rotate360DegreeWithImageView:pagefiveImage4];
    [imageView5 addSubview:pagefiveImage4];
    
    imgView = [[UIImageView alloc]initWithFrame:CGRectMake(50, ScreenHeight-ScreenWidth*4/5, 30-30, 30-30)];
    [self tomAnimationWithName:@"run" count:9];
    imgView.alpha = 0;
    [imageView5 addSubview:imgView];
}

/**
 *  初始化scrollView
 */
- (void)setupScrollView
{
    // 添加scrollView
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.frame = self.view.bounds;
    CGFloat contentW = scrollView.bounds.size.width * XXNewfeatureImageCount;
    [self.view addSubview:scrollView];
    
    scrollView.contentSize = CGSizeMake(contentW, 0);
    scrollView.pagingEnabled = YES;
    scrollView.bounces = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.delegate = self;
    
    // 添加图片
    CGFloat imageW = scrollView.bounds.size.width;
    CGFloat imageH = scrollView.bounds.size.height;
    
    imageView1 = [[UIImageView alloc] init];
    imageView1.frame = CGRectMake(0 * imageW, 0, imageW, imageH);
    [scrollView addSubview:imageView1];
    
    imageView2 = [[UIImageView alloc] init];
    imageView2.frame = CGRectMake(1 * imageW, 0, imageW, imageH);
    imageView2.alpha = 0;
    [scrollView addSubview:imageView2];
    
    imageView3 = [[UIImageView alloc] init];
    imageView3.frame = CGRectMake(2 * imageW, 0, imageW, imageH);
    [scrollView addSubview:imageView3];
    
    imageView5 = [[UIImageView alloc] init];
    imageView5.frame = CGRectMake(3 * imageW, 0, imageW, imageH);
    imageView5.userInteractionEnabled = YES;
    imageView5.alpha = 0;
    [scrollView addSubview:imageView5];
    
    // 添加跳转按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 150, 30);
    [button setTitle:@"进入APP" forState:UIControlStateNormal];
    button.layer.borderWidth = 1.0;
    button.layer.borderColor = [UIColor colorWithWhite:0.915 alpha:1.000].CGColor;
    button.titleLabel.font = [UIFont systemFontOfSize:14.0];
    [button addTarget:self action:@selector(getstart) forControlEvents:UIControlEventTouchUpInside];
    CGFloat centerX = imageView5.bounds.size.width * 0.5;
    CGFloat centerY = imageView5.bounds.size.height - 88;
    button.center = CGPointMake(centerX, centerY);
    [imageView5 addSubview:button];
}

/**
 *  跳转控制器
 */
- (void)getstart
{
    UIAlertView *altV = [[UIAlertView alloc]initWithTitle:@"进入应用" message:@"进入应用" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [altV show];
}

/**
 *  初始化pageControl
 */
- (void)setupPageControl
{
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    pageControl.numberOfPages = XXNewfeatureImageCount;
    pageControl.pageIndicatorTintColor = XXColor(189, 189, 189);
    pageControl.currentPageIndicatorTintColor = XXColor(241, 99, 43);
    
    CGFloat centerX = self.view.bounds.size.width * 0.5;
    CGFloat centerY = self.view.bounds.size.height - 20;
    pageControl.center = CGPointMake(centerX, centerY);
    pageControl.bounds = CGRectMake(0, 0, 100, 30);
    [self.view addSubview:pageControl];
    self.pageControl = pageControl;
}

#pragma mark - UIScrollViewDelegate method
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    offsetX = scrollView.contentOffset.x;
    NSLog(@"%f",offsetX);
    int page = offsetX / scrollView.bounds.size.width + 0.5;
    
#pragma mark --- 此处写动画
    if (offsetX <= ScreenWidth/2) {
        [self firstPage];
    }
    else if (offsetX > ScreenWidth/2 && offsetX <= ScreenWidth+ScreenWidth/2) {
        [self secondPage];
    }
    else if (offsetX > ScreenWidth+ScreenWidth/2 && offsetX <= ScreenWidth*2+ScreenWidth/2) {
        [self thirdPage];
    }
    else if (offsetX > ScreenWidth*2+ScreenWidth/2 && offsetX <= ScreenWidth*3+ScreenWidth/2) {
        [self lastPage];
    }
    
    self.pageControl.currentPage = page;
}

-(void)firstPage
{
    NSLog(@"1");
    imageView1.alpha = 1;
    imageView2.alpha = 0;
    
    pageoneImage2.alpha = (ScreenWidth/2-offsetX)/(ScreenWidth/2);
    
    pageoneImage3.frame = CGRectMake(0+ScreenWidth*offsetX/ScreenWidth, 120+ScreenWidth/2*offsetX/ScreenWidth, ScreenWidth-ScreenWidth*offsetX/(ScreenWidth/2), ScreenWidth/4-ScreenWidth/4*offsetX/(ScreenWidth/2));
    pageoneImage3.alpha = (ScreenWidth/2-offsetX)/(ScreenWidth/2);
    
    pageoneImage4.frame = CGRectMake(ScreenWidth/6+ScreenWidth*offsetX/ScreenWidth, CGRectGetMaxY(pageoneImage2.frame)+10+ScreenHeight/2*offsetX/ScreenWidth, ScreenWidth*2/3, 50);
    pageoneImage4.alpha = (ScreenWidth/2-offsetX)/(ScreenWidth/2);
    
    pageoneImage5.frame = CGRectMake(40+ScreenWidth*offsetX/ScreenWidth, CGRectGetMaxY(pageoneImage4.frame)+10+10*offsetX/ScreenWidth, ScreenWidth-80, 40);
    pageoneImage5.alpha = (ScreenWidth/2-offsetX)/(ScreenWidth/2);
}

-(void)secondPage
{
    NSLog(@"2");
    imageView1.alpha = 0;
    imageView2.alpha = (offsetX-ScreenWidth/2)/(ScreenWidth/2);
    
    if (offsetX <= ScreenWidth) {
        pagetwoImage1.frame = CGRectMake(-ScreenWidth/2+ScreenWidth/2*offsetX/ScreenWidth, 100-ScreenWidth/2+ScreenWidth/2*offsetX/ScreenWidth, ScreenWidth*2-ScreenWidth*offsetX/ScreenWidth, ScreenWidth*2-ScreenWidth*offsetX/ScreenWidth);
        pagetwoImage2.frame = CGRectMake(0, CGRectGetMaxY(pagetwoImage1.frame)+10, ScreenWidth, 60);
        pagetwoImage3.frame = CGRectMake(0, CGRectGetMaxY(pagetwoImage2.frame)+10, ScreenWidth, 30);
    }
    else{
        pagetwoImage1.frame = CGRectMake(
                                         ScreenWidth*(offsetX-ScreenWidth)/ScreenWidth+(ScreenWidth/4+13)*(offsetX-ScreenWidth)/ScreenWidth,
                                         
                                         100+ScreenWidth/10*(offsetX-ScreenWidth)/ScreenWidth,
                                         
                                         ScreenWidth-(ScreenWidth/2+25)*(offsetX-ScreenWidth)/ScreenWidth,
                                         
                                         ScreenWidth-(ScreenWidth/2+25)*(offsetX-ScreenWidth)/ScreenWidth
                                         );
        pagetwoImage2.frame = CGRectMake(0, CGRectGetMaxY(pagetwoImage1.frame)+10, ScreenWidth, 60);
        pagetwoImage2.alpha = 1-(offsetX-ScreenWidth)/(ScreenWidth/2);
        pagetwoImage3.frame = CGRectMake(0, CGRectGetMaxY(pagetwoImage2.frame)+10, ScreenWidth, 30);
        pagetwoImage3.alpha = 1-(offsetX-ScreenWidth)/(ScreenWidth/2);
    }
}

-(void)thirdPage
{
    NSLog(@"3");
    imageView5.alpha = 0;
    
    if (offsetX <= ScreenWidth*2) {
        pagetwoImage1.frame = CGRectMake(ScreenWidth*(offsetX-ScreenWidth)/ScreenWidth+(ScreenWidth/4+13)*(offsetX-ScreenWidth)/ScreenWidth, 100+ScreenWidth/10*(offsetX-ScreenWidth)/ScreenWidth, ScreenWidth-(ScreenWidth/2+25)*(offsetX-ScreenWidth)/ScreenWidth, ScreenWidth-(ScreenWidth/2+25)*(offsetX-ScreenWidth)/ScreenWidth);
        
        pagethreeImage2.frame = CGRectMake(ScreenWidth-offsetX+ScreenWidth, 100, ScreenWidth, ScreenWidth*31/36);
        
        pagethreeImage3.frame = CGRectMake(ScreenWidth-offsetX+ScreenWidth, 100, ScreenWidth, ScreenWidth*31/36);
        
        pagethreeImage4.frame = CGRectMake(10, ScreenHeight-200*(offsetX-ScreenWidth)/ScreenWidth, ScreenWidth-20, 60);
        pagethreeImage4.alpha = (offsetX-ScreenWidth*3/2)/(ScreenWidth/2);
        
        pagethreeImage5.frame = CGRectMake(0, CGRectGetMaxY(pagethreeImage4.frame)+15, ScreenWidth, 40);
        pagethreeImage5.alpha = (offsetX-ScreenWidth*3/2)/(ScreenWidth/2);
    }
    else{
        pagetwoImage1.frame = CGRectMake(
                                         (offsetX-ScreenWidth)+(ScreenWidth/4+13)*(offsetX-ScreenWidth)/ScreenWidth,
                                         
                                         100+ScreenWidth/10*(offsetX-ScreenWidth)/ScreenWidth,
                                         
                                         ScreenWidth-(ScreenWidth/2+25)*(offsetX-ScreenWidth)/ScreenWidth,
                                         
                                         ScreenWidth-(ScreenWidth/2+25)*(offsetX-ScreenWidth)/ScreenWidth
                                         );
        pagetwoImage1.alpha = 1-(offsetX-ScreenWidth*2)/(ScreenWidth/2);
        
        pagethreeImage1.frame = CGRectMake((offsetX-ScreenWidth*2)+(ScreenWidth/2)*(offsetX-ScreenWidth*2)/ScreenWidth, 100+(ScreenWidth/4+13)*(offsetX-ScreenWidth*2)/ScreenHeight, ScreenWidth*(1-(offsetX-ScreenWidth*2)/ScreenWidth), ScreenWidth*31/36*(1-(offsetX-ScreenWidth*2)/ScreenWidth));
        
        pagethreeImage2.frame = CGRectMake((offsetX-ScreenWidth*2)+(ScreenWidth/2)*(offsetX-ScreenWidth*2)/ScreenWidth, 100+(ScreenWidth/4+13)*(offsetX-ScreenWidth*2)/ScreenHeight, ScreenWidth*(1-(offsetX-ScreenWidth*2)/ScreenWidth), ScreenWidth*31/36*(1-(offsetX-ScreenWidth*2)/ScreenWidth));
        
        pagethreeImage3.frame = CGRectMake((offsetX-ScreenWidth*2)+(ScreenWidth/2)*(offsetX-ScreenWidth*2)/ScreenWidth, 100+(ScreenWidth/4+13)*(offsetX-ScreenWidth*2)/ScreenHeight, ScreenWidth*(1-(offsetX-ScreenWidth*2)/ScreenWidth), ScreenWidth*31/36*(1-(offsetX-ScreenWidth*2)/ScreenWidth));
        
        pagethreeImage4.frame = CGRectMake(10+(offsetX-ScreenWidth*2)+(ScreenWidth/2)*(offsetX-ScreenWidth*2)/ScreenWidth, ScreenHeight-200+(ScreenWidth/4+13)*(offsetX-ScreenWidth*2)/ScreenHeight, (ScreenWidth-20)*(1-(offsetX-ScreenWidth*2)/ScreenWidth), 60*(1-(offsetX-ScreenWidth*2)/ScreenWidth));
        
        pagethreeImage5.frame = CGRectMake((offsetX-ScreenWidth*2)+(ScreenWidth/2)*(offsetX-ScreenWidth*2)/ScreenWidth, CGRectGetMaxY(pagethreeImage4.frame)+15, ScreenWidth*(1-(offsetX-ScreenWidth*2)/ScreenWidth), 40*(1-(offsetX-ScreenWidth*2)/ScreenWidth));
        
        imageView3.alpha = 1-(offsetX-ScreenWidth*2)/(ScreenWidth/2);
    }
}

-(void)lastPage
{
    NSLog(@"5");
    imageView3.alpha = 0;
    imageView5.alpha = 1;
    
    pagefiveImage1.frame = CGRectMake(15+ScreenWidth*(offsetX-ScreenWidth*3)/ScreenWidth, 50-300*(ScreenWidth*3-offsetX)/ScreenWidth, ScreenWidth-30, 70);
    pagefiveImage1.alpha = (offsetX-ScreenWidth*2-ScreenWidth/2)/(ScreenWidth/2);
    
    pagefiveImage2.frame = CGRectMake(55+ScreenWidth*(offsetX-ScreenWidth*3)/ScreenWidth, CGRectGetMaxY(pagefiveImage1.frame)+10-10*(ScreenWidth*3-offsetX)/ScreenWidth, ScreenWidth-110, 10);
    pagefiveImage2.alpha = (offsetX-ScreenWidth*2-ScreenWidth/2)/(ScreenWidth/2);
    
    pagefiveImage3.frame = CGRectMake(ScreenWidth/4+ScreenWidth*(offsetX-ScreenWidth*3)/ScreenWidth, ScreenHeight-ScreenWidth/2-60-300*(offsetX-ScreenWidth*3)/ScreenWidth, ScreenWidth/2, ScreenWidth/4);
    pagefiveImage3.alpha = (offsetX-ScreenWidth*2-ScreenWidth/2)/(ScreenWidth/2);
    
    pagefiveImage4.frame = CGRectMake(-ScreenWidth/2+ScreenWidth*2*(offsetX-ScreenWidth*3)/ScreenWidth, ScreenHeight-ScreenWidth*5/4, ScreenWidth*4-ScreenWidth*2*(offsetX-ScreenWidth*2)/ScreenWidth, ScreenWidth*4-ScreenWidth*2*(offsetX-ScreenWidth*2)/ScreenWidth);
    pagefiveImage4.alpha = (offsetX-ScreenWidth*2-ScreenWidth/2)/(ScreenWidth/2);
    
    imgView.frame = CGRectMake(50+(offsetX-ScreenWidth*3), ScreenHeight-ScreenWidth*4/5, 30+30*(offsetX-ScreenWidth*3)/ScreenWidth, 30+30*(offsetX-ScreenWidth*3)/ScreenWidth);
    imgView.alpha = (offsetX-ScreenWidth*2-ScreenWidth/2)/(ScreenWidth/2);
}

#pragma mark --- UIImageView显示gif动画
- (void)tomAnimationWithName:(NSString *)name count:(NSInteger)count
{
    // 如果正在动画，直接退出
    if ([imgView isAnimating]) return;
    // 动画图片的数组
    NSMutableArray *arrayM = [NSMutableArray array];
    // 添加动画播放的图片
    for (int i = 0; i < count; i++) {
        // 图像名称
        NSString *imageName = [NSString stringWithFormat:@"%@%d.png", name, i+1];
        // ContentsOfFile需要全路径
        NSString *path = [[NSBundle mainBundle] pathForResource:imageName ofType:nil];
        UIImage *image = [UIImage imageWithContentsOfFile:path];
        [arrayM addObject:image];
    }
    // 设置动画数组
    imgView.animationImages = arrayM;
    // 重复1次
    imgView.animationRepeatCount = 0;
    // 动画时长
    imgView.animationDuration = imgView.animationImages.count * 0.05;
    // 开始动画
    [imgView startAnimating];
}

#pragma mark --- 旋转动画
- (void)rotate360DegreeWithImageView:(UIImageView *)imageView
{
    CABasicAnimation *animation = [ CABasicAnimation
                                   animationWithKeyPath: @"transform" ];
    animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    //围绕Z轴旋转，垂直与屏幕
    animation.toValue = [ NSValue valueWithCATransform3D:
                         CATransform3DMakeRotation(M_PI, 0.0, 0.0, 1.0) ];
    animation.duration = 5;
    //旋转效果累计，先转180度，接着再旋转180度，从而实现360旋转
    animation.cumulative = YES;
    animation.repeatCount = MAXFLOAT;
    //在图片边缘添加一个像素的透明区域，去图片锯齿
    CGRect imageRrect = CGRectMake(0, 0,imageView.frame.size.width, imageView.frame.size.height);
    UIGraphicsBeginImageContext(imageRrect.size);
    [imageView.image drawInRect:CGRectMake(1,1,imageView.frame.size.width-2,imageView.frame.size.height-2)];
    imageView.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    [imageView.layer addAnimation:animation forKey:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
