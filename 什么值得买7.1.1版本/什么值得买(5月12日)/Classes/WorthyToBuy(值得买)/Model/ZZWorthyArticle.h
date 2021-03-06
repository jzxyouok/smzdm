//
//  ZZProductModel.h
//  什么值得买(5月7日)
//
//  Created by Wang_ruzhou on 16/5/8.
//  Copyright © 2016年 Wang_ruzhou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZZRedirectData.h"

@interface ZZWorthyArticle : NSObject

/** 5 */
@property (nonatomic, copy) NSString *article_channel_id;
/** 海淘 */
@property (nonatomic, copy) NSString *article_channel_name;
/** 5 */
@property (nonatomic, copy) NSString *article_type_id;
/** 生活记录对应的type是4 */
@property (nonatomic, copy) NSString *article_type_name;
/** 6330508 */
@property (nonatomic, copy) NSString *article_id;
/** http://haitao.smzdm.com/p/6330508 */
@property (nonatomic, copy) NSString *article_url;
/** ASICS 亚瑟士 Oc Runner 亚瑟士休闲跑鞋 */
@property (nonatomic, copy) NSString *article_title;
/** £20+£9.41含税直邮 */
@property (nonatomic, copy) NSString *article_price;
/** 2016-08-15 23:20:12 */
@property (nonatomic, copy) NSString *article_date;
/** 08-15 */
@property (nonatomic, copy) NSString *article_format_date;
/** false */
@property (nonatomic, assign) BOOL article_anonymous;
/** 图片地址 */
@property (nonatomic, copy) NSString *article_pic;
/** 值 */
@property (nonatomic, copy) NSString *article_worthy;
/** 不值 */
@property (nonatomic, copy) NSString *article_unworthy;
/** 赞数 */
@property (nonatomic, copy) NSString *article_favorite;
/** 是否卖出? */
@property (nonatomic, assign) NSString *article_is_sold_out;
/** 是否超时 */
@property (nonatomic, copy) NSString *article_is_timeout;
/** article_collection */
@property (nonatomic, copy) NSString *article_collection;
/** 评论 */
@property (nonatomic, copy) NSString *article_comment;
/** 英国亚马逊 */
@property (nonatomic, copy) NSString *article_mall;
/** article_top 1为置顶 */
@property (nonatomic, copy) NSString *article_top;
/** article_tag */
@property (nonatomic, copy) NSString *article_tag;
/** 是否推广 */
@property (nonatomic, copy) NSString *promotion_type;
/** article_district */
@property (nonatomic, copy) NSString *article_district;
/** 为"资讯" 等 的时候取这个字段 */
@property (nonatomic, copy) NSString *article_rzlx;

/** time_sort 上拉加载更多时需要此参数 */
@property (nonatomic, copy) NSString *time_sort;

@property (nonatomic, strong) ZZRedirectData *redirect_data;

//原创独有? (发现资讯里边也有)

/** article_region_title */
@property (nonatomic, copy) NSString *article_region_title;
/** probreport_id */
@property (nonatomic, copy) NSString *probreport_id;
/** 总评? */
@property (nonatomic, copy) NSString *sum_collect_comment;
/** 昵称 */
@property (nonatomic, copy) NSString *article_referrals;
/** 头像 */
@property (nonatomic, copy) NSString *article_avatar;
/** user_smzdm_id */
@property (nonatomic, copy) NSString *user_smzdm_id;
/** article_filter_content */
@property (nonatomic, copy) NSString *article_filter_content;
/** article_type */
@property (nonatomic, copy) NSString *article_type; //4
/** article_recommend */
@property (nonatomic, copy) NSString *article_recommend;
/** article_love_count */
@property (nonatomic, copy) NSString *article_love_count;
/** page_timesort */
@property (nonatomic, copy) NSString *page_timesort;
/** 分享文字 */
@property (nonatomic, copy) NSString *share_title;
/** share_title_other */
@property (nonatomic, copy) NSString *share_title_other;
/** share_pic_title */
@property (nonatomic, copy) NSString *share_pic_title;
/** 分享图片? */
@property (nonatomic, copy) NSString *share_pic;
/** b_share_title */
@property (nonatomic, copy) NSString *b_share_title;
/** share_title_separate */
@property (nonatomic, copy) NSString *share_title_separate;
/** share_reward */
@property (nonatomic, copy) NSString *share_reward;
/** #宠狗 */
@property (nonatomic, copy) NSString *tag_name;
/** #宠物家居日用 */
@property (nonatomic, copy) NSString *category_name;
/** #宠物 #宠物家居日用  */
@property (nonatomic, copy) NSString *tag_category;

//推广特有?
@property (nonatomic, copy) NSString *title;
/** 如:推广 */
@property (nonatomic, copy) NSString *tag;
/** 图片 */
@property (nonatomic, copy) NSString *img;
@property (nonatomic, copy) NSString *link;
@property (nonatomic, copy) NSString *channel;

//话题特有?
/** 开始时间 */
@property (nonatomic, copy) NSString *article_start_date;
/** 结束时间 */
@property (nonatomic, copy) NSString *article_end_date;
/** 简介 */
@property (nonatomic, copy) NSString *article_brief;
/** 总共篇数 */
@property (nonatomic, copy) NSString *article_product_count;
@end
