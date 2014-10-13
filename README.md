## Custom-Email-pop-up-with-recipient-fill
## 

This is a custom email pop-up which takes in array of emails and shows the email similar to gmail emails format with delete
button and also has a textview that takes in the email content. It also shows a popover similar to ipad popover when double
tapped on email.

The pop-up is fully customizable. Works on iOS 6.0+ , currently done for iPhone only but same code can be reused for iPad as
well.

## HOW TO USE
## 

1. Just copy the Popover category, Recipient Fill with popover, Custom Pop Up and Images folder in your project. 2. Import
`CustomSharePopUp.h` in your view controller where you want to use it, add delegate
UIViewController<CustomSharePopUpDelegate> 3. Initialize `CustomSharePopUp` object and call. Thats all!

eg:

```obj-c 
- (IBAction)showPop:(UIButton *)sender { NSArray *fList = [[NSArray alloc] initWithObjects:@"test@gmail.com",
@"test2@gmail.com",@"test3@gmail.com", @"test4@gmail.com", nil]; CustomSharePopUp *customPop= [[CustomSharePopUp alloc]
initWithdelegate:self AccountType:@"Email" withFriendList:fList]; [customPop show];
}
```

To customize the Pop-up edit the files and Xibs in Custom Pop Up folder


![Alt][screenshot1]   |  ![Alt][screenshot2]

[screenshot1]:https://github.com/feialoh/EmailRecipientFill/blob/master/Screenshot2.png
[screenshot2]:https://github.com/feialoh/EmailRecipientFill/blob/master/Screenshot1.png


## Licence
## 

Copyright (c) 2014 Feialoh Francis <feialohfrancis@gmail.com>


Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy,
modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the
Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.