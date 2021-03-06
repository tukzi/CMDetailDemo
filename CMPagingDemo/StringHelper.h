//
//  StringHelper.h
//  idea95
//
//  Created by zhang chi on 13-5-16.
//  Copyright (c) 2013年 idea95. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StringHelper : NSObject

//判断字符串是否为空值(nil和empty)
+(BOOL)isNilOrEmpty:(NSString*)value;

@end



//对NSString类进行扩展
@interface NSString(Extend)

//移除字符串首尾的空白
- (NSString*)trim;

//判断某字符串是否包含在本字符串中
- (BOOL)contains:(NSString*)subString;

//是否为url字符串
- (BOOL)isUrl;

//判断是否为纯数字字符串
- (BOOL)isNumber;

//去除字符串末尾的换行符
- (NSString*)removeLineBreak;

//获取字符串的字节数
- (int)bytesCount;

//转化为日期类型
- (NSDate*)dateWithFormat:(NSString*)format;

//获取本字符串的md5加密结果
- (NSString*)md5String;

@end
