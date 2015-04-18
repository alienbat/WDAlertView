# WDAlertView
A simple alert view class for block style operations on iOS UIAlertView.

# Usage:

````
 
     [WDAlertView showAlertViewWithTitle:NSLocalizedString(@"Please Confirm", nil)
                                message:NSLocalizedString(@"You sure you want to do this?", nil)
                           dismissBlock:^(UIAlertView *alert_view, NSInteger button_index) {
                               
                               if (button_index) {
                                   
                                   //Do whatever you need to do after the user confirms. 
                                   
                                   }];
                               }
                               
                           } cancelButtonTitle:NSLocalizedString(@"Yes, please", nil)
                      otherButtonTitles:NSLocalizedString(@"No, thanks", nil), nil];


````
