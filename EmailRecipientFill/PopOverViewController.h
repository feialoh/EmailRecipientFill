//
//  PopOverViewController.h
//
//  Created by feialoh on 06/05/14.
//

#import <UIKit/UIKit.h>

@interface PopOverViewController : UIViewController<UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITextView *fullNameTxtView;

@property (weak,nonatomic) NSString *textName;

-(void)setTextView:(NSString *)fullName;
@end
