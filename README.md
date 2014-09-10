Custom-Email-pop-up-with-recipient-fill
=======================================

This is a custom email pop-up which takes in array of emails and shows
the email similar to gmail emails format with delete button and also has
a textview that takes in the email content. 

The pop-up is fully customizable. 

HOW TO USE
==========
-Just copy the Popover category, Recipient Fille with popover, Custom Pop Up and Images folder in your project.
-Import CustomSharePopUp.h in your view controller where you want to use it, add delegate UIViewController<CustomSharePopUpDelegate>
-Initialize its object and call. Thats all

eg: 

- (IBAction)showPop:(UIButton *)sender
{
    NSArray *fList = [[NSArray alloc] initWithObjects:@"test@gmail.com", @"test2@gmail.com",@"test3@gmail.com", @"test4@gmail.com", nil];
    CustomSharePopUp *customPop= [[CustomSharePopUp alloc] initWithdelegate:self AccountType:@"Email" withFriendList:fList];
    [customPop show];
}

-To customize the Pop-up edit the files and Xibs in Custom Pop Up folder

![alt tag](https://github.com/feialoh/EmailRecipientFill/blob/master/Screenshot2.png)

![alt tag](https://github.com/feialoh/EmailRecipientFill/blob/master/Screenshot1.png)
