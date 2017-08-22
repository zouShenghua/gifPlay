//
//  UIImageView+gifPlay.h
//  gifPlay_demo
//
//  Created by 维奕 on 2017/8/22.
//  Copyright © 2017年 维奕. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (gifPlay)


/**
 *  imageView播放gif图片
 *
 *  @parma path gif路径
 *  @parma duration 播放持续时间
 *  @parma repeat 是否重复播放
 */
- (void)showGifImageWithGifPath:(NSString *)path duration:(NSTimeInterval)duration repeat:(BOOL)repeat;


@end
