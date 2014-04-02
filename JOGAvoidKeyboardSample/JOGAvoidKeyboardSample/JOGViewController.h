//
//  JOGViewController.h
//  JOGAvoidKeyboardSample
//
//  Created by conilus on 4/3/14.
//  Copyright (c) 2014 debussynetwork. All rights reserved.
//

#import "JOGAvoidKeyboardViewController.h"

@interface JOGViewController : JOGAvoidKeyboardViewController < UITextFieldDelegate >

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UITextField *textField1;
@property (weak, nonatomic) IBOutlet UITextField *textField2;

@end
