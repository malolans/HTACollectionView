//
//  HTAViewController.m
//  HTACollectionView
//
//  Created by Malolan on 3/21/14.
//  Copyright (c) 2014 Haptrix. All rights reserved.
//

#import "HTAViewController.h"
#import "HTACollectionViewCell.h"

@interface HTAViewController ()

@property (nonatomic, strong)NSIndexPath *selectedIndexPath;
@property (assign, nonatomic) CGRect selectedCellDefaultFrame;
@property (assign, nonatomic) CGAffineTransform selectedCellDefaultTransform;

@end

const CGFloat collapseHeight = 44.0f;
const CGFloat collapseWidth  = 320.0f;

const CGFloat expandHeight = 132.0f;

@implementation HTAViewController

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    HTACollectionViewCell *cell = (HTACollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    [cell setTextForLabel:[NSString stringWithFormat:@"Text %d", indexPath.row]];
    
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([indexPath isEqual:self.selectedIndexPath]) {
        return CGSizeMake(collapseWidth, expandHeight);
    } else {
        return CGSizeMake(collapseWidth, collapseHeight);
    }
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [collectionView performBatchUpdates:^{
        if (![indexPath isEqual:self.selectedIndexPath]) {
            self.selectedIndexPath = indexPath;
        } else {
            self.selectedIndexPath = nil;
        }
    } completion:^(BOOL finished) {
        if (self.selectedIndexPath == nil) {
            [collectionView deselectItemAtIndexPath:indexPath animated:NO];
        }
    }];
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    [collectionView performBatchUpdates:^{
        if (![indexPath isEqual:self.selectedIndexPath]) {
            self.selectedIndexPath = nil;
        }
    } completion:^(BOOL finished) {
        
    }];
}

@end
