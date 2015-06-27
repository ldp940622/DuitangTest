//
//  PageView.m
//  DuitangTest
//
//  Created by 李大鹏 on 15/6/27.
//  Copyright (c) 2015年 Ldp. All rights reserved.
//

#import "PageView.h"

@implementation PageView

- (instancetype)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
	if (self) {
		// imageView Init
		self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, self.frame.size.height)];
		self.imageView.contentMode = UIViewContentModeScaleAspectFit;

		//增加手势
		UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(savaImage:)];
		[self addGestureRecognizer:tap];

		// description Init
		self.descriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.frame.size.height - 70, [UIScreen mainScreen].bounds.size.width, 70)];
		self.descriptionLabel.backgroundColor = [UIColor blackColor];
		self.descriptionLabel.textColor = [UIColor whiteColor];
		self.descriptionLabel.alpha = 0.7;
		self.descriptionLabel.numberOfLines = 0;

		// add method
		[self addSubview:self.imageView];
		[self addSubview:self.descriptionLabel];
	}
	return self;
}

// 保存图片
- (void)savaImage:(UITapGestureRecognizer *)tap {
	UIImageWriteToSavedPhotosAlbum(self.imageView.image, self, @selector(imageSavedToPhotosAlbum:didFinishSavingWithError:contextInfo:), nil);
}

// 回调
- (void)imageSavedToPhotosAlbum:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
	NSString *msg = [[NSString alloc] init];
	if (!error) {
		msg = @"成功!";
	}
	else {
		msg = [error description];
	}
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"结果" message:msg delegate:self cancelButtonTitle:@"好" otherButtonTitles:nil, nil];
	[alert show];
}

@end
