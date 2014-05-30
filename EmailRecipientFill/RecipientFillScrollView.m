//
//  RecipientFillScrollView.m
//
//  Created by feialoh on 05/05/14.
//

#import "RecipientFillScrollView.h"
#define MAX_HEIGHT 25.0
@interface RecipientFillScrollView()

{
    UIButton *deletedButton;UIColor *borderColor, *backgrndColor;
    UITapGestureRecognizer *tapGesture ;
}
@end
@implementation RecipientFillScrollView
@synthesize recipientArray;

- (void) commonInit
{
    self.scrollEnabled=YES;

}

-(id) init
{
	if (self = [super init]){
        // Initialization code
		[self commonInit];
	}
	
	return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        // Initialization code
		[self commonInit];
    }
    return self;
	
}


- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // Initialization code
		[self commonInit];
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


//Add dynamic buttons

-(void)setRecipients:(NSArray *)rList withBorderColor:(UIColor *)brColor withBackgroundColor:(UIColor *)bgColor;
{
    
    recipientArray=[[NSMutableArray alloc]init];
    
    recipientArray=[rList mutableCopy];
  
    borderColor=brColor;
    
    backgrndColor=bgColor;
    
    UIButton *btn;
    float x=5; float y=5; //float frameHeight=self.frame.size.height;
    float widthAdjustFactor=5.0;  float heightAdjustFactor=15.0;  NSString *title=@"";
    float maxWidth=self.frame.size.width * 0.75;
//    NSLog(@"SELF FRAME:%f,%f",self.frame.size.height,self.frame.size.width);
    for(NSUInteger i = 0; i < rList.count; i++)
    {
        btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        //Get button title
        title=[recipientArray objectAtIndex:i];
        
        if (title.length>24)
        {
            title=[NSString stringWithFormat:@"%@...",[title substringWithRange:NSMakeRange(0, 21)]];
        }
        
        //Add a Label
        UILabel *label=[[UILabel alloc] initWithFrame:CGRectMake(x, y, maxWidth, MAX_HEIGHT)];
        label.font=[UIFont systemFontOfSize:12.0];
        label.textColor=[UIColor blackColor];
        label.text=title;
        [label setTag:i];
        if ([title sizeWithFont:[UIFont systemFontOfSize:12.0]].width<maxWidth)
        {
             [label sizeToFit];
        }
       
//        NSLog(@"Title:%@, y pos:%f, height:%f",title,label.frame.origin.y,label.frame.origin.y+label.frame.size.height+heightAdjustFactor);
//        NSLog(@"FRAME TEST:%f==%f, size:%f",label.frame.origin.x+label.frame.size.width+25.0,self.frame.size.width,[title sizeWithFont:[UIFont systemFontOfSize:12.0]].width);
        if ((label.frame.origin.x+label.frame.size.width+25.0+4.0) >self.frame.size.width)
        {
            x=5;y=label.frame.origin.y+label.frame.size.height+heightAdjustFactor;
            
            label.frame = CGRectMake(x, y, label.frame.size.width, label.frame.size.height);
            
        }
        
        [self addSubview:label];
        
        //We will get resized frame after using sizeToFit after setting the text in the label.
        CGRect rect=label.frame;
        
        //Add a button
        [btn setTitle:@"x" forState:UIControlStateNormal];
        btn.titleLabel.font=[UIFont systemFontOfSize:12.0];
        [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
//        btn.titleLabel.textColor=[UIColor blackColor];
//        btn.layer.borderColor=[[UIColor blackColor] CGColor];
//        btn.layer.borderWidth=1.0;
        rect.origin.x=rect.origin.x+rect.size.width+2.0;
        rect.origin.y=label.frame.origin.y-2;
        rect.size=CGSizeMake(25.0, MAX_HEIGHT);
   
        
        [btn addTarget:self action:@selector(btnDeleted:) forControlEvents:UIControlEventTouchUpInside];
        
        btn.frame=rect;
        [btn setTag:i];
//        NSLog(@"yLabel:%f, yBtn:%f",label.frame.origin.y,btn.frame.origin.y);
        [self addSubview:btn];
        //Design your label view
        UIView *lblView=[[UIView alloc] initWithFrame:CGRectMake(x-1, y-1,label.frame.size.width+btn.frame.size.width, MAX_HEIGHT)];
//        lblView.backgroundColor=[UIColor colorWithRed:.8 green:.8 blue:.8 alpha:1.0];
        lblView.backgroundColor=backgrndColor;
//        lblView.backgroundColor=[UIColor lightGrayColor];
        lblView.layer.borderColor=[borderColor CGColor];
        lblView.layer.borderWidth=1.0;
        lblView.layer.cornerRadius=5.0;
        [lblView setTag:i];
        label.center=lblView.center;
        label.frame= CGRectMake(lblView.frame.origin.x+5,lblView.frame.origin.y, lblView.frame.size.width,lblView.frame.size.height) ;
        [self addSubview:lblView];
        [self bringSubviewToFront:btn];
        [self bringSubviewToFront:label];
        tapGesture= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
        tapGesture.numberOfTapsRequired = 2;
        tapGesture.delegate=self;
        [lblView addGestureRecognizer:tapGesture];
        
        x=btn.frame.origin.x+btn.frame.size.width+widthAdjustFactor;
//        y=lblView.frame.origin.y+lblView.frame.size.height+heightAdjustFactor;
    }
    
    self.contentSize =CGSizeMake(self.frame.size.width, btn.frame.origin.y+btn.frame.size.height+10);

}



-(void)btnDeleted:(UIButton *)button
{
//    NSLog(@"Button %ld Clicked",(long int)[button tag]);
    
    deletedButton=button;

    [self removeViews:deletedButton];
    [self setRecipients:recipientArray withBorderColor:borderColor withBackgroundColor:backgrndColor];

}


//To remove selected category buttons from screen and hold the deleted button list
-(void) removeViews:(UIButton*)button
{

    for (id btn in self.subviews)
    {

        [btn removeFromSuperview]; //remove views

        
    }
    
    
    for (NSUInteger i=0;i<recipientArray.count;i++)
    {
        if ([[recipientArray objectAtIndex:i] caseInsensitiveCompare:[recipientArray objectAtIndex:button.tag]]==NSOrderedSame)
        {
            [recipientArray removeObjectAtIndex:i];
            break;
        }
    }
    
}


-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    NSLog(@"ViewClass:%@,%i",touch.view,gestureRecognizer.numberOfTouches);
    
    
    if (self.superview != nil) {
        if ([touch.view isKindOfClass:[UIButton class]]||[touch.view.superview.superview isKindOfClass:[UITableViewCell class]]||[touch.view.superview.superview.superview isKindOfClass:[UITableViewCell class]]||[touch.view.superview isKindOfClass:[UITableViewCell class]])
            // isDescendantOfView:self.scrollView]) {
            // we touched our control surface
        {
            return NO; // ignore the touch
        }
        
    }
    return YES; // handle the touch
    
}


- (void)handleTapGesture:(UITapGestureRecognizer *)sender {
    if (sender.state == UIGestureRecognizerStateRecognized)
    {
        
        [self popView:sender];
        // handling code
    }
}

-(void)popView:(UITapGestureRecognizer *)tapSender
{

    CGPoint touch=[tapSender locationInView:self];
    PopOverViewController *detailsViewController = [[PopOverViewController alloc] initWithNibName:@"PopOverViewController" bundle:nil];
    [detailsViewController setTextView:[recipientArray objectAtIndex:tapSender.view.tag]];
    
    self.poc = [[UIPopoverController alloc] initWithContentViewController:detailsViewController];
    [self.poc setDelegate:self];
    [self.poc presentPopoverFromRect:CGRectMake(touch.x, touch.y, 20, 20) inView:self permittedArrowDirections:UIPopoverArrowDirectionDown animated:YES];

}


@end
