//
//  StringHelper.m
//  idea95
//
//  Created by zhang chi on 13-5-16.
//  Copyright (c) 2013年 idea95. All rights reserved.
//

#import "StringHelper.h"
#import <CommonCrypto/CommonDigest.h>

#define DEFAULT_DATE_FORMAT @"yyyy-MM-dd HH:mm:ss"

@implementation StringHelper

+(BOOL)isNilOrEmpty:(NSString*)value
{
    if(value != nil && ![value isKindOfClass:[NSNull class]])
        
    {
        if ([value isKindOfClass:[NSNumber class]]) {
            return [NSString stringWithFormat:@"%@",value].length == 0;
        }else{
            
            return value.length == 0;
        }
    }

    return YES;
}

@end

@implementation NSString(Extend)

- (NSString*)trim{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

- (BOOL)contains:(NSString*)subString
{
    if([StringHelper isNilOrEmpty:subString]) return NO;
    
    NSRange range = [self rangeOfString:subString];
    
    return range.location != NSNotFound;
}

- (BOOL)isUrl{
    return [self hasPrefix:@"http://"] || [self hasPrefix:@"https://"] || [self hasPrefix:@"local:"];
}

- (int)bytesCount{
    if([StringHelper isNilOrEmpty:self]) return 0;
    
    int count = 0;
    char *p = (char*)[self cStringUsingEncoding:NSUnicodeStringEncoding];
    for (int i=0 ; i<[self lengthOfBytesUsingEncoding:NSUnicodeStringEncoding] ;i++) {
        if (*p) count++;
        
        p++;
    }
    return count;
}

- (NSDate*)dateWithFormat:(NSString*)format
{
    if([StringHelper isNilOrEmpty:format]) format = DEFAULT_DATE_FORMAT;
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeZone:[NSTimeZone localTimeZone]];
    [formatter setDateFormat:format];
    
    return [formatter dateFromString:self];
}

- (NSString*)md5String{
    const char *cStr = [self UTF8String];
    unsigned char result[16];
    CC_MD5( cStr, strlen(cStr), result );
    NSMutableString *md5String = [NSMutableString string];
    for(int i = 0; i < 16; i++)
    {
        [md5String appendFormat:@"%X2",result[i]];
    }
    
    return md5String;
}

- (BOOL)isNumber
{
    NSString *numberRegex = @"^[0-9]*$";
    NSPredicate *numberTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",numberRegex];
    return  [numberTest evaluateWithObject:self];
}


- (NSString*)removeLineBreak
{
    int x = self.length;
    NSRange range;
    range.location = x-1;
    range.length = 1;
    NSString *str = [self mutableCopy];
    while ([[str substringWithRange:range] isEqualToString:@"\n"]) {
        str = [str substringToIndex:x - 1];
        x = str.length;
        range.location = x-1;
        range.length = 1;
    }
       return str;
}


@end
