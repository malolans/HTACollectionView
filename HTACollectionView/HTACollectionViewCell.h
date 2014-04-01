//
//  HTACollectionViewCell.h
//  HTACollectionView
//
//  Created by Malolan on 3/21/14.
//  Copyright (c) 2014 Haptrix. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HTACollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *textLabel;

- (void)setTextForLabel:(NSString *)aString;

@end
