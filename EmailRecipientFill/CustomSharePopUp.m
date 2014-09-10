//
//  CustomSharePopUp.m
//
//  Created by feialoh on 28/04/14.
//

#import "CustomSharePopUp.h"


@interface CustomSharePopUp()
{
    float popX,popY;
    UIButton *deletedButton;
    NSMutableArray *recipientArray;
}

@end
@implementation CustomSharePopUp

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(id)initWithdelegate:(id)parent AccountType:(NSString*)accType withFriendList:(NSArray *)friendList
{
    
    if (self = [super initWithFrame:CGRectMake(0, 0, 300, 300)])
    {
        // Initialization code
        self=(CustomSharePopUp*)[[[NSBundle mainBundle] loadNibNamed:@"CustomSharePopUp" owner:nil options:nil] lastObject] ;
        
        self.delegate=parent;
        [((UIViewController*)parent).view addSubview:self];
        self.hidden=YES;
        popX=_socialSharePopView.frame.origin.x;
        popY=_socialSharePopView.frame.origin.y;
        if ([[UIScreen mainScreen] bounds].size.height<568.0f)
        {
            _socialSharePopView.frame=CGRectMake(_socialSharePopView.frame.origin.x, _socialSharePopView.frame.origin.y-50, _socialSharePopView.frame.size.width, _socialSharePopView.frame.size.height);
        }
        //[self addSubview:view];
        
        [self.scrollView setContentSize:CGSizeMake(_scrollView.frame.size.width,_scrollView.frame.size.height)];
        
        if ([accType isEqualToString:@"Email"])
        {
            _shareModel.text=@"Email Share";

            [_shareButton setBackgroundImage:[UIImage imageNamed:@"normal_btn.png"] forState:UIControlStateNormal];
            [_shareButton setBackgroundImage:[UIImage imageNamed:@"pressed_btn.png"] forState:UIControlStateHighlighted];
            [_cancelButton setBackgroundImage:[UIImage imageNamed:@"normal_btn.png"] forState:UIControlStateNormal];
            [_cancelButton setBackgroundImage:[UIImage imageNamed:@"pressed_btn.png"] forState:UIControlStateHighlighted];
            
            [self createRecipientList:friendList];
        }
    }
    
    return self;
}


/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */


- (IBAction)shareButtonAction:(UIButton *)sender
{
    
    [self.delegate customShareButtonPressed:self withArray:_scrollView.recipientArray];
    [self hide];
}

- (IBAction)shareCancelBtnAction:(UIButton *)sender
{
    [self.delegate customShareCancelButtonPressed:self];
    [self hide];
}


-(void)show
{
    [[(UIViewController*)self.delegate navigationController] setNavigationBarHidden:YES];
    self.hidden=NO;
    [self.socialSharePopView setTransform:CGAffineTransformMakeScale(0.1,0.1)];
    [UIView animateWithDuration:0.5
                          delay:0.0
                        options:UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         [self.socialSharePopView setTransform:CGAffineTransformMakeScale(1.0,1.0)];
                     }
                     completion:nil
     ];
}

-(void)hide
{
    self.hidden=YES;
    [[(UIViewController*)self.delegate navigationController] setNavigationBarHidden:NO];
    [self.socialSharePopView setTransform:CGAffineTransformMakeScale(1.0,1.0)];
    [UIView animateWithDuration:0.5
                          delay:0.0
                        options:UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         [self.socialSharePopView setTransform:CGAffineTransformMakeScale(0.1,0.1)];
                     }
                     completion:^(BOOL finished)
     {
         
         [self removeFromSuperview];
         
     }
     ];
}


-(void)createRecipientList:(NSArray *) fList
{
    
    _scrollView.layer.borderColor=[[UIColor grayColor] CGColor];
    _scrollView.layer.borderWidth=1.0;
    _scrollView.layer.cornerRadius=5.0;
    
    _shareText.layer.borderColor=[[UIColor grayColor] CGColor];
    _shareText.layer.borderWidth=1.0;
    _shareText.layer.cornerRadius=5.0;
    
    [_scrollView setRecipients:fList withBorderColor:[UIColor orangeColor] withBackgroundColor:[UIColor colorWithRed:.8 green:.85 blue:.8 alpha:1.0]];

//    RecipientFillScrollView *label=[[RecipientFillScrollView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) andTitle:@"myemail@gmail.com"];
//    [self.scrollView addSubview:label];
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.socialSharePopView endEditing:YES];
    _socialSharePopView.frame=CGRectMake(popX, popY-50, _socialSharePopView.frame.size.width, _socialSharePopView.frame.size.height);
}

#pragma mark -
#pragma mark - Text Field delegate Actions

- (BOOL) textView: (UITextView*) textView
shouldChangeTextInRange: (NSRange) range
  replacementText: (NSString*) text
{
    if ([text isEqualToString:@"\n"])
    {
        [textView resignFirstResponder];
        _socialSharePopView.frame=CGRectMake(popX, popY, _socialSharePopView.frame.size.width, _socialSharePopView.frame.size.height);
        return NO;
    }
    return YES;
}

-(void)textViewDidBeginEditing:(UITextView *)textView
{
    if ([[UIScreen mainScreen] bounds].size.height<568.0f)
    {
        _socialSharePopView.frame=CGRectMake(popX, popY-100, _socialSharePopView.frame.size.width, _socialSharePopView.frame.size.height);
    }
    else
    {
        _socialSharePopView.frame=CGRectMake(popX, popY-50, _socialSharePopView.frame.size.width, _socialSharePopView.frame.size.height);
    }
    
}

@end
