//
//  ZZHomeFirstLayout.h
//  什么值得买
//
//  Created by Wang_ruzhou on 16/8/12.
//  Copyright © 2016年 Wang_ruzhou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZZHomeFirstModel.h"

#define kHomeFirstCellHeadTitleHeight (kScreenW / 750.0 * 50)
#define kHomeFirstCellBannerPicHeight (kScreenW / 750.0 * 260)
#define kHomeFirstCellPicPadding (kScreenW / 750.0 * 2)

#define kHomeFirstCellTitleLabelLeft 20



#define kHomeFirstCellScrollItemHeight 200
#define kHomeFirstCellScrollItemWidth 120
#define kHomeFirstCellScrollItemPicWH 70

#define kHomeHorizontalScrollItemPicTop 25
#define kHomeHorizontalScrollItemLabelTop 10
#define kHomeHorizontalScrollItemCount 10   //最大数
#define kHomeFirstCellBottomPicH (kScreenW / 750.0 * 238)
#define kHomeFirstCellBottomPicW (kScreenW / 750.0 * 186)

#define kHomeFirstCellBottomSeparatorH (kScreenW / 750.0 * 100)
#define kHomeFirstCellBottomSeparatorLineW (kScreenW / 750.0 * 200)
#define kHomeFirstCellBottomSeparatorLineH (kScreenW / 750.0 * 3)
#define kHomeFirstCellBottomSeparatorPadding (kScreenW / 750.0 * 40)

#define kHomeTitleFont 13
#define kHomeFirstCellLineColor ZZColor(225, 225, 225)


@interface ZZHomeFirstLayout : NSObject

- (instancetype)initWithFirstModel:(ZZHomeFirstModel *)firstModel isLastOne:(BOOL)isLastOne;
//计算布局
- (void)layout;

// 以下是数据
@property (nonatomic, strong) ZZHomeFirstModel *firstModel;
@property (nonatomic, assign, readonly) BOOL isLastOne;

@property (nonatomic, strong) YYTextLayout *titleTextLayout; // 标题栏

@property (nonatomic, assign) CGFloat picBannerHeight; //轮播图片高度，0为没图片

@property (nonatomic, assign) CGFloat picFragmentHeight; //(有分割线的四张)图片高度
@property (nonatomic, strong) NSArray *fourRectArray;   //四张图片的frame数组

@property (nonatomic, assign) CGFloat horizontalScrollViewH; //scrollView高度
@property (nonatomic, assign) CGSize horizontalScrollViewContentSize;       //scrollView的contentSize
@property (nonatomic, strong) NSArray<YYTextLayout *> *ycTextLayouts; // 原创数组
@property (nonatomic, strong) NSArray<NSNumber *> *widths;  //文字宽度数组
@property (nonatomic, strong) NSArray<NSMutableAttributedString *> *attributedStrings;
@property (nonatomic, strong) YYTextLayout *bottomSeparatorLayout;      //底部 如"----编辑竞选----"
@property (nonatomic, assign) CGFloat bottomSeparatorHeight;

// cell总高度
@property (nonatomic, assign) CGFloat height;
@end
