//
//  LDPhotoLayout.m
//  LayoutDemo
//
//  Created by PC on 2/12/15.
//  Copyright (c) 2015 PC. All rights reserved.
//

#import "LDPhotoLayout.h"

@interface LDPhotoLayout ()

@property (strong, nonatomic) NSIndexPath *zoomIndexPath;
@property (assign, nonatomic) CGSize zoomSize;

@end

@implementation LDPhotoLayout

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
  NSArray *layoutAttributes = [super layoutAttributesForElementsInRect:rect];
  
  if (self.zoomIndexPath) {
    UICollectionViewLayoutAttributes *attributes = [[layoutAttributes filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"indexPath == %@", self.zoomIndexPath]] firstObject];
    attributes.transform = CGAffineTransformMakeScale(self.zoomSize.width / attributes.size.width, self.zoomSize.height / attributes.size.height);
    attributes.zIndex = 100;
    attributes.center = self.collectionView.center;
  }
  
  return layoutAttributes;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
  UICollectionViewLayoutAttributes *attributes = [super layoutAttributesForItemAtIndexPath:indexPath];

  if ([indexPath isEqual:self.zoomIndexPath]) {
    attributes.transform = CGAffineTransformMakeScale(self.zoomSize.width / attributes.size.width, self.zoomSize.height / attributes.size.height);
    attributes.zIndex = 100;
    attributes.center = self.collectionView.center;
  }
  return attributes;
}

- (void)zoomItemAtIndexPath:(NSIndexPath *)indexPath size:(CGSize)size
{
  self.zoomIndexPath = indexPath;
  self.zoomSize = size;
  [UIView animateWithDuration:5.0f animations:^{
    [self invalidateLayout];
  }];
}

- (void)reset
{
  self.zoomIndexPath = nil;
  self.zoomSize = CGSizeZero;
  
  [UIView animateWithDuration:5.0f animations:^{
    [self invalidateLayout];
  }];
}

@end
