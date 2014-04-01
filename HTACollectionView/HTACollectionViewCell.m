//
//  HTACollectionViewCell.m
//  HTACollectionView
//
//  Created by Malolan on 3/21/14.
//  Copyright (c) 2014 Haptrix. All rights reserved.
//

#import "HTACollectionViewCell.h"

@interface HTACollectionViewCell ()

@property (strong, nonatomic) UIView *bottomBorder;
@property (strong, nonatomic) UILabel *expandLabel;

@end

@implementation HTACollectionViewCell

- (void)awakeFromNib {
    
    CGRect bounds = self.bounds;
    CGRect bottomBarFrame = CGRectMake(0, bounds.size.height - 1.0f, bounds.size.width, 1.0f);
    self.bottomBorder = [[UIView alloc] initWithFrame:bottomBarFrame];
    self.bottomBorder.backgroundColor = [UIColor darkGrayColor];
    [self.contentView addSubview:self.bottomBorder];
    
    CGRect expandLabelFrame = CGRectMake(20.0f, bounds.size.height, bounds.size.width, bounds.size.height);
    self.expandLabel = [[UILabel alloc] initWithFrame:expandLabelFrame];
    self.expandLabel.text = @"Additional Text in Expanded View";
    [self.contentView addSubview:self.expandLabel];
    self.expandLabel.alpha = 0.0;
}

- (void)setTextForLabel:(NSString *)aString {
	self.textLabel.text = aString;
}

- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes {
    [super applyLayoutAttributes:layoutAttributes];
    self.bottomBorder.center = CGPointMake(CGRectGetWidth(self.contentView.bounds) / 2.0f, CGRectGetHeight(self.contentView.bounds) - 0.5f);
    
    if (CGRectGetHeight(self.contentView.frame) == 132.0f) {
        self.expandLabel.alpha = 1.0;
    } else {
        self.expandLabel.alpha = 0.0;
    }
}

- (void)prepareForReuse {
    [super prepareForReuse];
    CGRect bounds = self.bounds;
    CGRect bottomBarFrame = CGRectMake(0, bounds.size.height - 1.0f, bounds.size.width, 1.0f);
    self.bottomBorder.frame = bottomBarFrame;
}

@end
