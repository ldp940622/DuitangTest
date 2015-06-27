//
//  ImageList.h
//  DuitangTest
//
//  Created by 李大鹏 on 15/6/27.
//  Copyright (c) 2015年 Ldp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Image.h"

@interface ImageList : NSObject
@property (strong, nonatomic) Image *image;
@property (strong, nonatomic) NSMutableArray *imageArr;

- (NSArray *)getImageList;

@end
