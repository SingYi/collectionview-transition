//
//  MyCollectionViewCell.h
//  Collection_transition
//
//  Created by 石燚 on 16/6/23.
//  Copyright © 2016年 SingYi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCollectionViewCell : UICollectionViewCell

@property (nonatomic, assign) CGPoint oriCenter;


- (void)viewTransform;

- (void)viewReduction;

@end
