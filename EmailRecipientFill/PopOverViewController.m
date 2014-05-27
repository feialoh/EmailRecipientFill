//
//  PopOverViewController.m
//  MightYouLike
//
//  Created by feialoh on 06/05/14.
//  Copyright (c) 2014 Cabot. All rights reserved.
//

#import "PopOverViewController.h"

@interface PopOverViewController ()

@end

@implementation PopOverViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    CGSize size = CGSizeMake(150, 70); // size of view in popover
    self.preferredContentSize = size;
    _fullNameTxtView.text=_textName;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setTextView:(NSString *)fullName
{
    _textName=fullName;
}
@end
