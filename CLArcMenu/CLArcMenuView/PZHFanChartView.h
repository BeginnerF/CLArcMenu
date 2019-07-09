//
//  PZHFanChartView.h
//  PanzhihuaSociety
//
//  Created by wonders_cll on 2019/3/7.
//  Copyright © 2019 wonders_cll. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol PZHFanChartViewDelegate <NSObject>
-(void)didClickBtnForFanChartView:(UIButton *)sender;
@end
@interface PZHFanChartView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UIButton *selectBtn;

@property (copy,nonatomic)NSString *titleStr;
@property (copy,nonatomic)NSString *imageStr;

@property(nonatomic,weak) id<PZHFanChartViewDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
