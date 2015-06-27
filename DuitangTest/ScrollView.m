//
//  ScrollView.m
//  DuitangTest
//
//  Created by 李大鹏 on 15/6/27.
//  Copyright (c) 2015年 Ldp. All rights reserved.
//

#import "ScrollView.h"

@implementation ScrollView

- (instancetype)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
	if (self) {
		[self setBackgroundColor:[UIColor clearColor]];
		self.contentSize = CGSizeMake(CGRectGetWidth(self.frame) * 6, CGRectGetHeight(self.frame));
		self.pagingEnabled = YES;
		[self flashScrollIndicators];
		self.directionalLockEnabled = YES;
	}
	return self;
}

@end
