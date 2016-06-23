//
//  MyCollectionViewCell.m
//  Collection_transition
//
//  Created by 石燚 on 16/6/23.
//  Copyright © 2016年 SingYi. All rights reserved.
//

#import "MyCollectionViewCell.h"

@implementation MyCollectionViewCell

- (void)viewTransform {
    CGFloat kScreen_w = [UIScreen mainScreen].bounds.size.width;
    CGFloat kScreen_h = [UIScreen mainScreen].bounds.size.height;
    //记录原始中心位置
    _oriCenter = self.center;
    //将cell放到屏幕中心
    self.center = CGPointMake(kScreen_w / 2, kScreen_h / 2);
    NSInteger rotation = arc4random() % 5 + 1;
    //设置随机旋转角度
    self.transform = CGAffineTransformMakeRotation(M_PI * rotation);
    self.alpha = 0;
    
}

- (void)viewReduction {
    [UIView animateWithDuration:2 animations:^{
        //复原位置
        self.center = self.oriCenter;
        self.transform = CGAffineTransformIdentity;
        self.alpha = 0.7;
    }];
}


- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes {
    [super applyLayoutAttributes:layoutAttributes];
    
    [self viewTransform];
}

@end
