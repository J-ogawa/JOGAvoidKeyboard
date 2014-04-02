//
//  JOGViewController.m
//  JOGAvoidKeyboardSample
//
//  Created by conilus on 4/3/14.
//  Copyright (c) 2014 debussynetwork. All rights reserved.
//

#import "JOGViewController.h"

@implementation JOGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.rootScrollView = _scrollView;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITextViewDelegate

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    self.showParts = textField;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    self.showParts = nil;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
