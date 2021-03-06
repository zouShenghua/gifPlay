
//
//  UIImageView+gifPlay.m
//  gifPlay_demo
//
//  Created by 维奕 on 2017/8/22.
//  Copyright © 2017年 维奕. All rights reserved.
//

#import "UIImageView+gifPlay.h"


#import <ImageIO/ImageIO.h>



@implementation UIImageView (gifPlay)

- (void)showGifImageWithGifPath:(NSString *)path duration:(NSTimeInterval)duration repeat:(BOOL)repeat
{
    // 1 将gif转化成一帧一帧的图片
    NSData *gifData = [NSData dataWithContentsOfFile:path];
    CFDataRef cfGifData = CFBridgingRetain(gifData);
    struct CGImageSource *gifDataSource = CGImageSourceCreateWithData(cfGifData, nil);
    NSInteger gifDataCount = CGImageSourceGetCount(gifDataSource);
    
    NSMutableArray *imageArray = [NSMutableArray array];
    for (NSInteger i = 0; i < gifDataCount; i++) {
        CGImageRef imageRef =  CGImageSourceCreateImageAtIndex(gifDataSource, i, nil);
        UIImage *image = [UIImage imageWithCGImage:imageRef];
        [imageArray addObject:image];
        //将图片写入本地
        NSData *imageData = UIImagePNGRepresentation(image);
        NSArray *array = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *imagePath = [NSString stringWithFormat:@"%@%ld.png",[array firstObject],(long)i];
        [imageData writeToURL:[NSURL URLWithString:imagePath] atomically:YES];
    }
    
    // 2 播放帧图片
    self.animationImages = imageArray;
    self.animationDuration = duration;
    if (repeat) {
        self.animationRepeatCount = 0;
    } else {
        self.animationRepeatCount = 1;
    }
    [self startAnimating];
    
    
}
@end

