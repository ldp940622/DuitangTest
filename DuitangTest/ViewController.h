//
//  ViewController.h
//  DuitangTest
//
//  Created by 李大鹏 on 15/6/27.
//  Copyright (c) 2015年 Ldp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import "ImageList.h"
#import "ScrollView.h"
#import "PageView.h"

@interface ViewController : UIViewController <UIScrollViewDelegate>
@property (strong, nonatomic) ScrollView *scrollView;
@property (strong, nonatomic) PageView *pageView;
@property (strong, nonatomic) NSArray *imageArray;

@end
