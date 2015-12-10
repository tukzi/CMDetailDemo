//
//  MyConfig.h
//  Choumeimeifa
//
//  Created by iMac on 15/4/1.
//  Copyright (c) 2015年 xiaokang. All rights reserved.
//

#ifndef Choumeimeifa_MyConfig_h
#define Choumeimeifa_MyConfig_h



#define CMGenderItemsKey   @"CMGenderItemsKey"

typedef void(^CMVoidBlock)(void);
typedef void(^CMIntegerBlock)(NSInteger value);
typedef void(^CMBoolBlock)(BOOL value);
typedef void(^CMArrayBlock)(NSArray *array);
typedef void(^CMStringBlock)(NSString *string);

//
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= 70000
#define XK_TEXTSIZE(text, font) [text length] > 0 ? [text \
sizeWithAttributes:@{NSFontAttributeName:font}] : CGSizeZero;
#else
#define XK_TEXTSIZE(text, font) [text length] > 0 ? [text sizeWithFont:font] : CGSizeZero;
#endif

#if __IPHONE_OS_VERSION_MIN_REQUIRED >= 70000
#define XK_MULTILINE_TEXTSIZE(text, font, maxSize, mode) [text length] > 0 ? [text \
boundingRectWithSize:maxSize options:(NSStringDrawingUsesLineFragmentOrigin) \
attributes:@{NSFontAttributeName:font} context:nil].size : CGSizeZero;
#else
#define XK_MULTILINE_TEXTSIZE(text, font, maxSize, mode) [text length] > 0 ? [text \
sizeWithFont:font constrainedToSize:maxSize lineBreakMode:mode] : CGSizeZero;
#endif
//
#define requestNumber @"20"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

//颜色
#define Color(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

#define WS(weakSelf) __weak __typeof(&*self)weakSelf = self;

#define HUD(string)  [[JDHUDHelper sharedInstance] tipMessage:string delay:1.0]
#define NetError HUD(@"你的网络好像离家出走了呢~")

#define isNotLogin ([AppDelegate getAppDelegate].CMCurrentUserId.length == 0 ? YES : NO)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)//屏高
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)//屏宽

#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))
#define IS_IPHONE_4_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
#define IS_IPHONE_5 (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE_6 (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE_6P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)

#define Width(w) (SCREEN_WIDTH>320 ? w:w*0.8)
#define Height(h) (SCREEN_WIDTH>320 ? h:h*0.8)


#define BaiduMapKey        @"MtKuWF1yKF4I7Fe7GL2E9WUI"
#define UmengAppkey        @"549cd4e3fd98c5da55000bfc"

#define kWXAppID           @"wx64335d90c8150856"
#define kWXAppSecret       @"d0d78b11b3459622d1e58fee20cba231"

#define QQAppId            @"100732344"
#define QQAppKey           @"b6a3ef3e98403bad1394429860ed0ca2"

#define iosBundle          @"AGXVTSY2W6H5Q8ML"

#define aliPartner @"2088701753684258"
#define aliSeller  @"2088701753684258"
#define aliPrivateKey @"MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAN+CcQOYjPRqLM/i/h7ZN6pyL8eJJW9EhNpqMbLvoq1iocpeH0UZRvjKOpaLX/jYGzRwbI3xnkVHRwYLAkGy0lU1T6/5G3+yONyZ5P7PT1cwigjKMshp/JC8hszrraTfr5MPY0vXKkPQdpUKmVwb7eaE7sID2OHJ5HRYHjTDmFqJAgMBAAECgYA6eouNME246Uq+PZrVgWnSG7wqjdSQjzHfX6ePNKmwibzhEM1Hq/xovaikmOTMW+aKStvsK4qIf8SybRDzFZF4InBDGM6DE/PAru0vlcvgj89Jc/pWQar17KF7YfHV5ee/vKCacpysM0Yt44U8/+RJM4l3MukyJaN8Vdz01sCz8QJBAP1s8I1ZwI7O0SdijpxSnYnLGPZMFgOcctwTkEeMq6GpJNMISTLa0MovIwHpbLTpnFBiR8MES/jGRTX5LT1T3iUCQQDhx7O3CdBrhv+3otfTn8hFsKFWlYzhpZ7j/1KBvg01Cu4HUe6StNcCezRRpZxn986mRf+OHZ7d42f7Bj+t9SOVAkEA3wYfUJX68vKpeDqw/HtsLtawmhhtizIElw8UexMd/EAJqzpwiLOu6S/AZC9TvoaUTN2g/8vpO/7o683k9UK4jQJAf4suzLGwmW2zu2s0fQoAOs4i9iSZZ0cGUUoEs+JG17YK7PutyBZ8d5xd29mwV1M329ojGYdGHZa/QKExC/Y1WQJAGmDs7P8f7Hn4YOXKJNzPsXiWtTqDvmFKDK6eEJ3Nq9N1t6MgmBQnyTRu/EEw3AAmSVkVqwwiiSlL6nhBDb03hQ=="
#define aliSchema @"meifa"


#define DownLoadAppUrl @"http://newapi.choumei.cn/Mcmdown/download"

#define NOT_First_RedPacket @"NOT_First_RedPacket"

#define SYSTERM_DELETE_MSG_ID @"SYSTERM_DELETE_MSG_ID_STR"
#define SYSTERM_ISREAD_MSG_ID @"SYSTERM_ISREAD_MSG_ID_STR"
#define MyHair_Data @"MyHair_Data"
#define Hari_Name @"hairName"
#define Limit_Str_Lenth_Key @"limiStrLenthKey"
#define SEARCH_TIP_KEY  @"SEARCH_TIP_KEY"
#define IOSAppdingY 20
#define SYS_MSG_NOTREAD @"SYS_MSG_READ"
//颜色规范
#define CMBackColor UIColorFromRGB(0xf3eeec)
#define CMThemeColor UIColorFromRGB(0xe83260)  //字体粉色
#define CMLineColor UIColorFromRGB(0xdadada)   //分割线
#define CMTitleWordColor UIColorFromRGB(0x313131) //标题栏字体颜色
#define CMWordDeepColor UIColorFromRGB(0x2c2c2c)//字体深色
#define CMWordGrayColor UIColorFromRGB(0xaaaaaa) //字体灰色
#define CMWordPinkColor UIColorFromRGB(0xe83260)  //字体粉色
#define CMWordYellowColor UIColorFromRGB(0xfff329) //字体黄色
#define CMWordNotUseColor UIColorFromRGB(0xc8c8c8) //字体禁用颜色

#define CMNavTitleColor UIColorFromRGB(0xffd200) //导航栏黄色字体
#define CMNavBGCOLOR RGBCOLOR(21, 17, 30)


//字体大小规范
#define CMBIGFONT_SPECIAL [UIFont systemFontOfSize:21.0]
#define CMBIGFONT [UIFont systemFontOfSize:17.0]
#define CMMEDIUMFONT [UIFont systemFontOfSize:15.0]
#define CMSMALLFONT [UIFont systemFontOfSize:12.0]
#define CMSMALLFONT_SPECIAL [UIFont systemFontOfSize:10.0]

//列表高度
#define CMRowHeight 50.0f
#define CMTitileRowHeight 44.0f

#define CMShopPlaceholderImage  [UIImage imageNamed:@"placeholderImage"]
#define CMUserPlaceholderImage  [UIImage imageNamed:@"gerenziliao_touxiang"]

//自动根据设备尺寸改变数值
#define AutoFit(val) IS_IPHONE_6 ? val : (IS_IPHONE_6P ? (int)(val*414/375) : (int) (val*320/375))
#define AutoFitHeight(val) (IS_IPHONE_6 ? val : (IS_IPHONE_6P ? (int)(val*736/667) :  (IS_IPHONE_5 ? (int) (val*568/667) : (int) (val*480/667))))

//创建动态矩阵
#define DRectMake(x,y,w,h) CGRcctMake(x == 0 ? 0 : AutoFit(x),y == 0 ? 0 : AutoFitHeight(y),w == 0 ? 0 : AutoFit(w),h == 0 ? 0 : AutoFitHeight(h))
//创建动态点与尺寸
#define DpointMake(x,y) CGPointMake (x == 0 ? 0 : AutoFit(x),y == 0 ? 0 : AutoFitHeight(y))
#define DSizeMake(w,h)  CGSizeMake (w == 0 ? 0 : AutoFit(w),h == 0 ? 0 : AutoFitHeight(h))

//notification
#define UpdateTopicStatus @"UpdateTopicStatus"
#define cm_update_unreadCount  @"update_unreadCount"
#define cm_sigle_orderDetal @"cm_sigle_orderDetal"
#define update_ticket_status @"update_ticket_status"
#define update_headView_title @"update_headView_title"
#define ORDER_PAY_NOTIFICATION @"OrderPayNotification"
#define UPDATE_STANDARD_LINE  @"UPDATE_STANDARD_LINE"
#define ChangNickName @"ChangNickName"
#define ChangeSegueNameCollect @"ChangeSegueNameCollect"
#define ChangeStylistCollect @"ChangeStylistCollect"
#define ProjectCollectNotification @"ProjectCollectNotification"
#define ChangeSalonCollect @"ChangeSalonCollect"
#define update_collect_data @"update_collect_data"
#define Reward_CancelTask @"Reward_CancelTask"
#define Reward_CommentSuccess @"Reward_CommentSuccess"
#define Reward_RewardpaySuccess @"Reward_RewardpaySuccess"
#define Environment @"Environment"
#define CMFastCutValue @"CMFastCutValue"
#define SYS_MSG_MARK_REASD @"SYS_MSG_MARK_REASD"


#define startY 64
#define StartY 64

#define SINGLE_LINE_WIDTH           (1 / [UIScreen mainScreen].scale)
#define SINGLE_LINE_ADJUST_OFFSET   ((1 / [UIScreen mainScreen].scale) / 2)

#endif
