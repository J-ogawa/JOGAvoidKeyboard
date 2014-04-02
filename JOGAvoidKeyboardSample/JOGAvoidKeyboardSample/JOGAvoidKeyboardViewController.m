//
//  JOGAvoidKeyboardViewController.m
//
//  Created by J_ogawa on 2014/04/02.
//  Copyright (c) 2014年 J_ogawa. All rights reserved.
//

#import "JOGAvoidKeyboardViewController.h"

@implementation JOGAvoidKeyboardViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self registerForKeyboardNotifications];
}

- (CGPoint)absPoint:(UIView *)view
{
    CGPoint ret = CGPointMake(view.frame.origin.x, view.frame.origin.y);
    if ([view superview] != nil)
    {
        CGPoint addPoint = [self absPoint:[view superview]];
        ret = CGPointMake(ret.x + addPoint.x, ret.y + addPoint.y);
    }
    return ret;
}

// Call this method somewhere in your view controller setup code.
- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
}

// Called when the UIKeyboardDidShowNotification is sent.
- (void)keyboardWasShown:(NSNotification*)notification
{
    CGSize keyboardSize = [[[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    //UIKeyboardFrameEndUserInfoKey: better when conversion candidates appear
  
    CGPoint partsAbsOrigin = [self absPoint:_showParts];
    CGPoint partsAbsBottomPoint = (CGPoint){ partsAbsOrigin.x, partsAbsOrigin.y + _showParts.frame.size.height };
    
    float overlapValue = partsAbsBottomPoint.y - ([[UIApplication sharedApplication] keyWindow].frame.size.height - keyboardSize.height);
    
    if (overlapValue > 0){
        CGPoint scrollPoint = CGPointMake(0.0, overlapValue);
        [_rootScrollView setContentOffset:scrollPoint animated:YES];
    }
}

// Called when the UIKeyboardWillHideNotification is sent
- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
    [_rootScrollView setContentOffset:CGPointZero animated:YES];
}

@end
