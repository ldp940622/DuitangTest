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
		NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"ImageArray" ofType:@"plist"];
		NSArray *dataArr = [[NSArray alloc] initWithContentsOfFile:plistPath];
		self.imageArr = [[NSMutableArray alloc] init];
		for (NSDictionary *dic in dataArr) {
			Image *image = [[Image alloc] init];
			image.imageUrl = [NSURL URLWithString:[dic objectForKey:@"imageUrl"]];
			image.imageDescription = [dic objectForKey:@"imageDescription"];
			image.imageType = [dic objectForKey:@"imageType"];
			[self.imageArr addObject:image];
		}
	}
	return self;
}

- (NSArray *)getImageList {
	return [self sortByDescription:self.imageArr];
}

// 排序
- (NSArray *)sortByDescription:(NSArray *)imageArr {
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"_imageDescription.length" ascending:YES];
    NSArray *arr = [imageArr sortedArrayUsingDescriptors:[NSArray arrayWithObject:sortDescriptor]];
    return arr;
}

@end
