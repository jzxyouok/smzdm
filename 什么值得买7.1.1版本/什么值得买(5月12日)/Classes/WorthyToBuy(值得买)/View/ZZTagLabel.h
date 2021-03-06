//
//  ZZTagLabel.h
//  什么值得买(5月12日)
//
//  Created by Wang_ruzhou on 16/5/12.
//  Copyright © 2016年 Wang_ruzhou. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ZZTagLabelBlock)();

@interface ZZTagLabel : UILabel

/** scale */
@property (nonatomic, assign)CGFloat scale;

/** block回调 */
@property (nonatomic, copy) ZZTagLabelBlock block;

+ (instancetype)labelWithString:(NSString *)title;


@end
