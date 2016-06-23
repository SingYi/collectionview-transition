//
//  ViewController.m
//  Collection_transition
//
//  Created by 石燚 on 16/6/23.
//  Copyright © 2016年 SingYi. All rights reserved.
//

#import "ViewController.h"
#import "MyCollectionViewCell.h"

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic, strong) UICollectionView *collectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.collectionView];
    self.title = @"点击cell跳转页面返回可重复观看";
}

#pragma mark - events
- (void)refreshView {
    [self.collectionView removeFromSuperview];
    [self.view addSubview:self.collectionView];
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSArray<MyCollectionViewCell *> *cells = [self.collectionView visibleCells];
    [cells enumerateObjectsUsingBlock:^(MyCollectionViewCell * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj viewTransform];
        [obj viewReduction];
    }];
    
}

#pragma mark - delegateAndDatasource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 8;
}

- (MyCollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"interesting" forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor redColor];
    

    
    [cell viewReduction];
    
    return cell;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *test = [UIViewController new];
    test.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:test animated:YES];
}

#pragma mark - getter
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.itemSize = CGSizeMake(120, 120);
        
        layout.minimumLineSpacing = 10;
        layout.minimumInteritemSpacing = 10;
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        
        
        _collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        
        [_collectionView registerClass:[MyCollectionViewCell class] forCellWithReuseIdentifier:@"interesting"];
    }
    return _collectionView;
}








@end
