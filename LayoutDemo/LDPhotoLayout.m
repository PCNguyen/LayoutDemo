//
//  LDPhotoLayout.m
//  LayoutDemo
//
//  Created by PC on 2/12/15.
//  Copyright (c) 2015 PC. All rights reserved.
//

#import "LDPhotoLayout.h"

@interface LDPhotoLayout ()

@end

@implementation LDPhotoLayout

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
  NSArray *layoutAttributes = [super layoutAttributesForElementsInRect:rect];
  return layoutAttributes;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
  UICollectionViewLayoutAttributes *attributes = [super layoutAttributesForItemAtIndexPath:indexPath];
  return attributes;
}

- (void)zoomItemAtIndexPath:(NSIndexPath *)indexPath size:(CGSize)size
{
}

- (void)resetItemSize
{
}

@end
