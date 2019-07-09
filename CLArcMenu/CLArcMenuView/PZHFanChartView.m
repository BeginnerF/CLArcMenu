//
//  PZHFanChartView.m
//  PanzhihuaSociety
//
//  Created by wonders_cll on 2019/3/7.
//  Copyright © 2019 wonders_cll. All rights reserved.
//

#import "PZHFanChartView.h"


@implementation PZHFanChartView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    self = [[[NSBundle mainBundle] loadNibNamed:@"PZHFanChartView" owner:self options:nil] lastObject];
    if (self) {
      
    //    [self.titleLabel setVerticalAlignment:VerticalAlignmentTop];

    }
    return self;
}

-(void)setImageStr:(NSString *)imageStr{
    
    /*加载网络图片*/
    //[self.iconImageView sd_setImageWithURL:[NSURL URLWithString:imageStr] placeholderImage:nil];
    /*加载本地图片*/
    self.iconImageView.image = [UIImage imageNamed:imageStr];

}
-(void)setTitleStr:(NSString *)titleStr{
    self.titleLabel.text = titleStr;
    self.titleLabel.font = [UIFont systemFontOfSize:10 weight:UIFontWeightThin];
}
- (IBAction)Btnclick:(UIButton *)sender {
    
    if (_delegate) {
        
        if ([_delegate respondsToSelector:@selector(didClickBtnForFanChartView:)]){
            [_delegate didClickBtnForFanChartView:sender];
            
        }
    }
}
@end
