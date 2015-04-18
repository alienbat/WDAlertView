//
//
//  Created by Jian Yin Shen on 17/09/12.
//
//

#import <UIKit/UIKit.h>

typedef void(^WDAlertViewButtonClickBlock)(UIAlertView* alert_view, NSInteger button_index);

/*
 * Extension that allows use of alert view in block form
 */
@interface WDAlertView : UIAlertView <UIAlertViewDelegate>


- (id)initWithTitle:(NSString *)title
            message:(NSString *)message
       dismissBlock:(WDAlertViewButtonClickBlock)block
  cancelButtonTitle:(NSString *)cancelButtonTitle
  otherButtonTitles:(NSString *)otherButtonTitles, ...NS_REQUIRES_NIL_TERMINATION;


+ (void)showAlertViewWithTitle:(NSString *)title
                     message:(NSString *)message
                dismissBlock:(WDAlertViewButtonClickBlock)block
           cancelButtonTitle:(NSString *)cancelButtonTitle
           otherButtonTitles:(NSString *)otherButtonTitles, ...NS_REQUIRES_NIL_TERMINATION;

@end
