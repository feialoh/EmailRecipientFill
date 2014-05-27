//
//  RecipientFillScrollView.h
//  MightYouLike
//
//  Created by feialoh on 05/05/14.
//  Copyright (c) 2014 Cabot. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PopOverViewController.h"

@interface RecipientFillScrollView : UIScrollView<UIScrollViewDelegate,UIPopoverControllerDelegate,UIGestureRecognizerDelegate>


-(void)setRecipients:(NSArray *)rList withBorderColor:(UIColor *)brColor withBackgroundColor:(UIColor *)bgColor;

@property (retain, nonatomic)  NSMutableArray *recipientArray;

@property (nonatomic, retain) IBOutlet UIPopoverController *poc;

@end
