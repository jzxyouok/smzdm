//
//  ZZListCell.m
//  什么值得买(5月12日)
//
//  Created by Wang_ruzhou on 16/5/12.
//  Copyright © 2016年 Wang_ruzhou. All rights reserved.
//

#import "ZZListCell.h"
#import "ZZChannelID.h"

@interface ZZListCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *mallAndTimeLabel;
@property (weak, nonatomic) IBOutlet UIButton *commentBtn;
@property (weak, nonatomic) IBOutlet UIButton *zhiBtn;
@property (weak, nonatomic) IBOutlet UIButton *waterBtn;

@end

@implementation ZZListCell

- (void)awakeFromNib{
    [super awakeFromNib];
    
    self.priceLabel.textColor = kGlobalRedColor;
}



- (void)setArticle:(ZZWorthyArticle *)article{
    
    _article = article;
    
    
    //    第二种样式cell字段选取
    //    图片  article_pic
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:article.article_pic]];
    //    标题  article_title
    self.titleLabel.text = article.article_title;
    //    价格  article_price
    self.priceLabel.text = article.article_price;
    //
    //    1. 平台和时间
    //    平台显示:
    //
    //    根据article_channel_id来取key
    //
    //    1或5  取article_mall
    //    11    取article_type_name
    //    其他   取article_rzlx
    //
    //    时间  取 article_format_date
    
    NSInteger channelID = [article.article_channel_id integerValue];
    
    NSString *mallStr;
    if (channelID == 1 || channelID == 5) {
        mallStr = article.article_mall;
    }else if (channelID == 11){
        mallStr = article.article_type_name;
    }else{
        mallStr = article.article_rzlx;
    }
    
    NSString *dateStr = article.article_format_date;
    self.mallAndTimeLabel.text = [NSString stringWithFormat:@"%@ | %@", mallStr, dateStr];
    
    [self.commentBtn setTitle:article.article_comment forState:UIControlStateNormal];
    
    //
    //    2. 是 "点赞" 图标还是 "值" 图标
    //    根据article_channel_id来
    //    1或5    为值 ,值的计算为 (值) / (值 + 不值), 注意需判断分母不为0的情况
    //
    //    其他   为点赞, 赞数取article_favorite字段
    //
    if (channelID == 1 || channelID == 5) {
        [self.zhiBtn setImage:[UIImage imageNamed:@"icon_zhi_list"] forState:UIControlStateNormal];
        NSInteger worthy = [article.article_worthy integerValue];
        NSInteger unWorthy = [article.article_unworthy integerValue];
        
        if (worthy + unWorthy == 0) {
            [self.zhiBtn setTitle:@"0" forState:UIControlStateNormal];
        }else{
            CGFloat ratio = worthy * 1.0 / (worthy + unWorthy);
            //            LxDBAnyVar(ratio);
            [self.zhiBtn setTitle:[NSString stringFromFloat:ratio] forState:UIControlStateNormal];
        }
        
        
    }else{
        [self.zhiBtn setImage:[UIImage imageNamed:@"icon_zan_list"] forState:UIControlStateNormal];
        
        [self.zhiBtn setTitle:article.article_favorite forState:UIControlStateNormal];
    }
    
    //
    //    3.标签图片设置
    //
    //    article.article_channel_id 的值来判断
    //    1   国内    homePage_channelGuoNei
    //    5   海淘    homePage_channelHaiTao
    //    6   资讯    homePage_channelZiXun
    //    8   众测    homePage_channelZhongCe
    //    11  原创    homePage_channelYuanChuang
    //    14  话题    homePage_channelHuaTi
    
    if ([self.homeChannel.type isEqualToString:kHaojiaJingXuan] || [self.type isEqualToString:kHaojiaJingXuan]) {
        ZZChannelID *channel = [ZZChannelID channelWithID:channelID];
        [self.waterBtn setImage:[UIImage imageNamed:channel.waterImageName] forState:UIControlStateNormal];
    }else{
        [self.waterBtn setImage:nil forState:UIControlStateNormal];
    }
    
    
}



@end
