//
//  CLArcMenuView.h
//  CLArcMenu
//
//  Created by wonders_cll on 2019/6/21.
//  Copyright © 2019 wonders_cll. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol CLArcMenuViewDelegate <NSObject>
-(void)didClickBtnForArcView:(UIButton *)sender;
@end

@interface CLArcMenuView : UIView
@property(nonatomic,weak) id<CLArcMenuViewDelegate> delegate;


/**
 添加子视图
 
 @param array 内圈数组
 */
-(void)addIconSubView:(NSArray *)array;

/**
 添加子视图
 
 @param imageArray 外圈图片数组
 @param titleArray 外圈文字数组
 */
-(void)addBtnSubView:(NSArray *)imageArray titleArray:(NSArray *)titleArray;
@end

NS_ASSUME_NONNULL_END
