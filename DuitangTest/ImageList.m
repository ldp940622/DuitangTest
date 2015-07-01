//
//  ImageList.m
//  DuitangTest
//
//  Created by 李大鹏 on 15/6/27.
//  Copyright (c) 2015年 Ldp. All rights reserved.
//

#import "ImageList.h"

@implementation ImageList

- (instancetype)init {
	self = [super init];
	if (self) {
        NSArray *dataArr = [self imageArrOperation];
		self.imageArr = [[NSMutableArray alloc] init];
		for (NSDictionary *dic in dataArr) {
			Image *image = [[Image alloc] init];
			image.imageUrl = [dic objectForKey:@"imageUrl"];
			image.imageDescription = [dic objectForKey:@"imageDescription"];
			[self.imageArr addObject:image];
		}
	}
	return self;
}

- (NSArray *)getImageList {
	[self imageArrOperation];
	return [self sortByDescription:self.imageArr];
}

// 排序
- (NSArray *)sortByDescription:(NSArray *)imageArr {
	NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"_imageDescription.length" ascending:YES];
	NSArray *arr = [imageArr sortedArrayUsingDescriptors:[NSArray arrayWithObject:sortDescriptor]];
	return arr;
}

// 获得相应的Html代码
- (NSArray *)getHtmlCodeArr {
	NSString *htmlCode = [[NSString alloc] initWithContentsOfURL:[NSURL URLWithString:@"http://www.duitang.com/album/58375208/"] encoding:NSUTF8StringEncoding error:NULL];
	NSString *headStr = @"<div class=\"woo-pcont stpics clr \" data-totalunits=\"6\">";
	NSRange range = [htmlCode rangeOfString:headStr];
	NSString *rangeStr = [htmlCode substringFromIndex:range.location + range.length];
	NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"data-rootid.*.height=" options:NSRegularExpressionCaseInsensitive error:NULL];
	NSArray *arr = [regex matchesInString:rangeStr options:0 range:NSMakeRange(0, [rangeStr length])];
	NSMutableArray *htmlArr = [[NSMutableArray alloc] init];
	for (NSTextCheckingResult *result in arr) {
		NSString *str = [rangeStr substringWithRange:result.range];
		[htmlArr addObject:str];
	}
	return htmlArr;
}

// 获得html数组,进行操作
- (NSArray *)imageArrOperation {
	NSArray *htmlArr = [self getHtmlCodeArr];
	NSMutableArray *dataArr = [[NSMutableArray alloc] init];
	for (NSString *str in htmlArr) {
		NSDictionary *dic = @{ @"imageUrl":[self getImageUrlWithStr:str], @"imageDescription":[self getImageDescriptionWithStr:str] };
        [dataArr addObject:dic];
	}
    return dataArr;
}

// 获得URL
- (NSURL *)getImageUrlWithStr:(NSString *)str {
	NSRange httpRange = [str rangeOfString:@"http://"];
	NSRange range = { httpRange.location, [str length] - 9 - httpRange.location };
	NSString *urlStr = [[str substringWithRange:range] stringByReplacingOccurrencesOfString:@".thumb.224_0" withString:@""];
	return [NSURL URLWithString:urlStr];
}

// 获得Description
- (NSString *)getImageDescriptionWithStr:(NSString *)str {
	NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"alt=.*.\"\\sd" options:0 error:NULL];
	NSTextCheckingResult *result = [regex firstMatchInString:str options:0 range:NSMakeRange(0, [str length])];
	NSString *altStr = [str substringWithRange:result.range];
	return [[altStr substringFromIndex:5] substringWithRange:NSMakeRange(0, altStr.length - 5 - 3)];
}

@end
