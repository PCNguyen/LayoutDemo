//
//  LDColorPalleteViewController.h
//  LayoutDemo
//
//  Created by PC on 2/12/15.
//  Copyright (c) 2015 PC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LDColorPalleteViewController;

@protocol LDColorPalletViewControllerDelegate <NSObject>

//define neccesary delegate method

@end

@interface LDColorPalleteViewController : UIViewController

@property (strong, nonatomic) id<LDColorPalletViewControllerDelegate>delegate;

@end
