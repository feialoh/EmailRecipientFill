//
//  ViewController.m
//  EmailRecipientFill
//
//  Created by feialoh on 27/05/14.
//  Copyright (c) 2014 Cabot. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

{
    CustomSharePopUp *customPop;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)showPop:(UIButton *)sender
{
    NSArray *fList = [[NSArray alloc] initWithObjects:@"test@gmail.com", @"test2@gmail.com",@"test3@gmail.com", @"test4@gmail.com", nil];
    customPop= [[CustomSharePopUp alloc] initWithdelegate:self AccountType:@"Email" withFriendList:fList];
    [customPop show];
}

#pragma mark - Custom pop methods


-(void)customShareButtonPressed:(id)popView withArray:(NSArray *)recipientList
{
    NSLog(@"Recipient list:%@, Email text:%@",recipientList,customPop.shareText.text);
}

-(void)customShareCancelButtonPressed:(id)popView
{
    
}
@end
