//
//  LDPhotoLayout.h
//  LayoutDemo
//
//  Created by PC on 2/12/15.
//  Copyright (c) 2015 PC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LDPhotoLayout : UICollectionViewFlowLayout

- (void)zoomItemAtIndexPath:(NSIndexPath *)indexPath size:(CGSize)size;
- (void)resetItemSize;

@end
