//
//  ViewController.m
//  DuitangTest
//
//  Created by 李大鹏 on 15/6/27.
//  Copyright (c) 2015年 Ldp. All rights reserved.
//
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize scrollView, pageView;

- (void)viewDidLoad {
	[super viewDidLoad];
	// ScrollView Init
	scrollView = [[ScrollView alloc] initWithFrame:self.view.frame];
	scrollView.delegate = self;

	// Get ImageArr
	self.imageArray = [[[ImageList alloc] init] getImageList];
    
	// 循环add image
	for (int i = 0; i < self.imageArray.count; i++) {
		Image *image = self.imageArray[i];

		// PageView Init
		pageView = [[PageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width * i, 0, self.view.frame.size.width, scrollView.frame.size.height)];
		[pageView.imageView sd_setImageWithURL:image.imageUrl completed: ^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
		    NSLog(@"第%d张加载成功\n", i + 1);
		}];
		pageView.descriptionLabel.text = image.imageDescription;
		[scrollView addSubview:pageView];
	}
	[self.view addSubview:scrollView];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
