## Custom-Email-pop-up-with-recipient-fill
##

This is a custom email pop-up which takes in array of emails and shows
the email similar to gmail emails format with delete button and also has
a textview that takes in the email content. It also shows a popover similar to ipad popover when double tapped on email. 

The pop-up is fully customizable. Works on iOS 6.0+ , currently done for iPhone only but same code can be reused for iPad as well. 

## HOW TO USE
##

1. Just copy the Popover category, Recipient Fill with popover, Custom Pop Up and Images folder in your project.
2. Import `CustomSharePopUp.h` in your view controller where you want to use it, add delegate UIViewController<CustomSharePopUpDelegate>
3. Initialize `CustomSharePopUp` object and call. Thats all!

eg: 

```obj-c
- (IBAction)showPop:(UIButton *)sender
{
    NSArray *fList = [[NSArray alloc] initWithObjects:@"test@gmail.com", @"test2@gmail.com",@"test3@gmail.com", @"test4@gmail.com", nil];
    CustomSharePopUp *customPop= [[CustomSharePopUp alloc] initWithdelegate:self AccountType:@"Email" withFriendList:fList];
    [customPop show];
}
```

To customize the Pop-up edit the files and Xibs in Custom Pop Up folder

[![Alt][screenshot1_thumb]][screenshot1]    [![Alt][screenshot2_thumb]][screenshot2]

[screenshot1_thumb]: https://github.com/feialoh/EmailRecipientFill/blob/master/ Screenshot2.png [screenshot1]:
https://github.com/feialoh/EmailRecipientFill/blob/master/ Screenshot2.png [screenshot2_thumb]:
https://github.com/feialoh/EmailRecipientFill/blob/master/ Screenshot1.png [screenshot2]:
https://github.com/feialoh/EmailRecipientFill/blob/master/ Screenshot1.png
