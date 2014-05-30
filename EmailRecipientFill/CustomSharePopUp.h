//
//  CustomSharePopUp.h
//
//  Created by feialoh on 28/04/14.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "RecipientFillScrollView.h"

@protocol CustomSharePopUpDelegate<NSObject>

@optional

-(void) customShareButtonPressed:(id)popView withArray:(NSArray *)recipientList;

-(void) customShareCancelButtonPressed:(id)popView;

@end


@interface CustomSharePopUp : UIView<UITextViewDelegate,UIScrollViewDelegate>

@property (nonatomic,assign) id <CustomSharePopUpDelegate> delegate;
@property (weak, nonatomic) IBOutlet UIView *socialSharePopView;

- (IBAction)shareButtonAction:(UIButton *)sender;

- (IBAction)shareCancelBtnAction:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UIButton *shareButton;

@property (weak, nonatomic) IBOutlet UIButton *cancelButton;


@property (weak, nonatomic) IBOutlet UIView *userNameBgView;

@property (weak, nonatomic) IBOutlet UITextView *shareText;

@property (weak, nonatomic) IBOutlet UILabel *shareModel;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollViews;

@property (weak, nonatomic) IBOutlet RecipientFillScrollView *scrollView;

-(id)initWithdelegate:(id)parent AccountType:(NSString*)accType withFriendList:(NSArray *)friendList;

-(void) show;

@end
