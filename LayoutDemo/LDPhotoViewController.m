//
//  ViewController.m
//  LayoutDemo
//
//  Created by PC on 2/12/15.
//  Copyright (c) 2015 PC. All rights reserved.
//

#import "LDPhotoViewController.h"

/********************************
 LDPhotoCell
 *******************************/

@interface LDPhotoCell : UICollectionViewCell

@end

@implementation LDPhotoCell

- (instancetype)initWithFrame:(CGRect)frame
{
  if (self = [super initWithFrame:frame]) {
    self.contentView.backgroundColor = [UIColor lightGrayColor];
  }
  
  return self;
}

@end

/*******************************
 LDPhotoViewController
 *******************************/

#define LDPhotoViewControllerCellSize       CGSizeMake(50.0f, 50.0f)

static NSString *const LDPhotoViewControllerCellIdentifier = @"LDPhotoViewControllerCellIdentifier";
static NSInteger const LDPhotoViewControllerItemCount = 120;

@interface LDPhotoViewController () <UICollectionViewDelegateFlowLayout, UICollectionViewDataSource>

@property (strong, nonatomic) UICollectionView *photoCollectionView;

@end

@implementation LDPhotoViewController

#pragma mark - View Life Cycle

- (void)loadView
{
  [super loadView];
  
  [self.view addSubview:self.photoCollectionView];
}

- (void)viewWillLayoutSubviews
{
  [super viewWillLayoutSubviews];
  self.photoCollectionView.frame = self.view.bounds;
}

#pragma mark - Collection View

- (UICollectionView *)photoCollectionView
{
  if (!_photoCollectionView) {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = LDPhotoViewControllerCellSize;
    
    _photoCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    _photoCollectionView.delegate = self;
    _photoCollectionView.dataSource = self;
    _photoCollectionView.backgroundColor = [UIColor clearColor];
    [_photoCollectionView registerClass:[LDPhotoCell class] forCellWithReuseIdentifier:LDPhotoViewControllerCellIdentifier];
  }
  
  return _photoCollectionView;
}

#pragma mark - Collection View Delegate / DataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
  return LDPhotoViewControllerItemCount;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
  LDPhotoCell *photoCell = [collectionView dequeueReusableCellWithReuseIdentifier:LDPhotoViewControllerCellIdentifier forIndexPath:indexPath];
  
  return photoCell;
}

@end
