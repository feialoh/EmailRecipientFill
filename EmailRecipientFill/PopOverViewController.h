//
//  PopOverViewController.h
//  MightYouLike
//
//  Created by feialoh on 06/05/14.
//  Copyright (c) 2014 Cabot. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PopOverViewController : UIViewController<UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITextView *fullNameTxtView;

@property (weak,nonatomic) NSString *textName;

-(void)setTextView:(NSString *)fullName;
@end
