//
//  ViewController.h
//  EmailRecipientFill
//
//  Created by feialoh on 27/05/14.
//  Copyright (c) 2014 Cabot. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomSharePopUp.h"

@interface ViewController : UIViewController<CustomSharePopUpDelegate>

- (IBAction)showPop:(UIButton *)sender;
@end
