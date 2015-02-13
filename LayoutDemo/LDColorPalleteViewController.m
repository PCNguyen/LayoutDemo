//
//  LDColorPalleteViewController.m
//  LayoutDemo
//
//  Created by PC on 2/12/15.
//  Copyright (c) 2015 PC. All rights reserved.
//

#import "LDColorPalleteViewController.h"

@interface LDColorPalleteViewController ()

@property (strong, nonatomic) UITextField *redTextField;
@property (strong, nonatomic) UITextField *greenTextField;
@property (strong, nonatomic) UITextField *blueTextField;

@end

@implementation LDColorPalleteViewController

- (void)loadView
{
  [super loadView];
  
  self.view.backgroundColor = [UIColor whiteColor];
  self.extendedLayoutIncludesOpaqueBars = NO;
  self.edgesForExtendedLayout = UIRectEdgeNone;
  
  [self.view addSubview:self.redTextField];
  [self.view addSubview:self.greenTextField];
  [self.view addSubview:self.blueTextField];
  
  self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(handleDoneButtonTapped:)];
}

- (void)viewWillLayoutSubviews
{
  [super viewWillLayoutSubviews];
  
  self.greenTextField.frame = CGRectOffset(self.redTextField.frame, 0.0f, CGRectGetHeight(self.redTextField.frame) + 5.0f);
  self.blueTextField.frame = CGRectOffset(self.greenTextField.frame, 0.0f, CGRectGetHeight(self.greenTextField.frame) + 5.0f);
}

#pragma mark - Text Field

- (UITextField *)textFieldTemplate
{
  UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(10.0f, 0.0f, 160.0f, 50.0f)];
  textField.borderStyle = UITextBorderStyleLine;
  textField.layer.borderColor = [[UIColor lightGrayColor] CGColor];
  textField.layer.cornerRadius = 3.0f;
  textField.layer.borderWidth = 1.0f;
  textField.textAlignment = NSTextAlignmentLeft;
  
  return textField;
}

- (UITextField *)redTextField
{
  if (!_redTextField) {
    _redTextField = [self textFieldTemplate];
    _redTextField.placeholder = NSLocalizedString(@"Red", nil);
  }
  
  return _redTextField;
}

- (UITextField *)blueTextField
{
  if (!_blueTextField) {
    _blueTextField = [self textFieldTemplate];
    _blueTextField.placeholder = NSLocalizedString(@"Blue", nil);
  }
  
  return _blueTextField;
}

- (UITextField *)greenTextField
{
  if (!_greenTextField) {
    _greenTextField = [self textFieldTemplate];
    _greenTextField.placeholder = NSLocalizedString(@"Green", nil);
  }
  
  return _greenTextField;
}

#pragma mark - Action

- (void)handleDoneButtonTapped:(id)sender
{

}

@end
