//
//  CLArcMenuView.m
//  CLArcMenu
//
//  Created by wonders_cll on 2019/6/21.
//  Copyright © 2019 wonders_cll. All rights reserved.
//

#import "CLArcMenuView.h"
#import "PZHFanChartView.h"

//圆弧线条宽度
#define LineWidth 50
//圆弧半径
#define OutRadius 100

//角度
#define Angle 180/8

@interface CLArcMenuView()<PZHFanChartViewDelegate>
@property (nonatomic,weak)  PZHFanChartView *buttonView;
@end

@implementation CLArcMenuView

-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if(self) {
        
    }
    return self;
}

#pragma mark -- 添加子视图
///圆弧内小图标数组
-(void)addIconSubView:(NSArray *)array{
    
    for (int i = 0; i < array.count; i++) {
        
        UIButton *iconBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 22, 22)];
        
        [iconBtn setImage:[UIImage imageNamed:array[i]] forState:UIControlStateNormal];
        iconBtn.tag=100+i;
        
        
        CGPoint point = [self calcCircleCoordinateWithCenter:CGPointMake(self.bounds.size.width/2, self.bounds.size.height) andWithAngle:Angle*(i+1) andWithRadius: OutRadius];
        
        iconBtn.center = point;
        
        iconBtn.alpha = 0;
        
        [self addSubview:iconBtn];
        
        //动画，连续出现
        [UIView animateWithDuration:0.5 delay:i*0.1 options:UIViewAnimationOptionCurveLinear animations:^{
            
            iconBtn.alpha = 1;
        } completion:^(BOOL finished) {
            
        }];
    }
    
}
///外部按钮数组
- (void)addBtnSubView:(NSArray *)array titleArray:(NSArray *)titleArray{
    
    
    CGFloat outsideRadio;
    
  
    outsideRadio = OutRadius + 60;
   
    
    for (int i = 0; i < array.count; i++) {
        
        
        PZHFanChartView *buttonView = [[PZHFanChartView alloc] initWithFrame:CGRectMake(0, 0, 80, 70)];
        buttonView.imageStr = array[i];
        buttonView.titleStr = titleArray[i];
        buttonView.delegate = self;
        buttonView.tag = i;
        buttonView.selectBtn.tag = i;
        
        CGPoint point = [self calcCircleCoordinateWithCenter:CGPointMake(self.bounds.size.width/2, self.bounds.size.height) andWithAngle:Angle*(i+1) andWithRadius: outsideRadio];
        
        buttonView.center = point;
        buttonView.alpha = 0;
        
        [self addSubview:buttonView];
        
        
        //动画，连续出现
        [UIView animateWithDuration:0.5 delay:i*0.1 options:UIViewAnimationOptionCurveLinear animations:^{
            
            buttonView.alpha = 1;
        } completion:^(BOOL finished) {
            
        }];
    }
}
#pragma mark 计算圆圈上点在IOS系统中的坐标
/*
 center中心点坐标 angle 角度 ，radius半径
 */
-(CGPoint) calcCircleCoordinateWithCenter:(CGPoint) center  andWithAngle : (CGFloat) angle andWithRadius: (CGFloat) radiusNumber{
    
    CGFloat x2 = radiusNumber*cosf(angle*M_PI/180);
    CGFloat y2 = radiusNumber*sinf(angle*M_PI/180);
    return CGPointMake(center.x-x2, center.y-y2);
}

-(void)didClickBtnForFanChartView:(UIButton *)sender{
    
    if (_delegate) {
        if ([_delegate respondsToSelector:@selector(didClickBtnForArcView:)]){
            [_delegate didClickBtnForArcView:sender];
            
        }
    }
}
#pragma mark -- 绘制圆弧
- (void)drawRect:(CGRect)rect {
   
    //一个不透明类型的Quartz 2D绘画环境,相当于一个画布,你可以在上面任意绘画
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //void CGContextAddArc(CGContextRef c,CGFloat x, CGFloat y,CGFloat radius,CGFloat startAngle,CGFloat endAngle, int clockwise)
    //1弧度＝180°/π （≈57.3°） 度＝弧度×180°/π 360°＝360×π/180 ＝2π 弧度
    //x,y为圆点坐标，radius半径，startAngle为开始的弧度，endAngle为 结束的弧度，clockwise 0为顺时针，1为逆时针。
    
    /*--------绘制底层圆弧--------*/
    //画线笔颜色
    CGContextSetStrokeColorWithColor(context, [UIColor colorWithRed:224/255.0 green:246/255.0 blue:243/255.0 alpha:1].CGColor);
    //线的宽度
    CGContextSetLineWidth(context, LineWidth);
    //添加一个圆（弧)
    CGContextAddArc(context, self.bounds.size.width/2, self.bounds.size.height, OutRadius, -M_PI, 0, 0);
    //绘制路径
    CGContextDrawPath(context, kCGPathStroke);
    
    /*--------绘制外层圆弧--------*/

    CGContextSetStrokeColorWithColor(context, [UIColor colorWithRed:0/255.0 green:201/255.0 blue:171/255.0 alpha:1.0].CGColor);
    //设置圆弧的端点形状 (圆角)
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetLineWidth(context, LineWidth);
    CGContextAddArc(context, self.bounds.size.width/2, self.bounds.size.height, OutRadius, -M_PI, -M_2_PI, 0);
    CGContextDrawPath(context, kCGPathStroke);

}


@end
