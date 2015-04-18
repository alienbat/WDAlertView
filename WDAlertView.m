//
//  WPAlertView.m
//  Created by Jian Yin Shen on 17/09/12.
//
//

#import "WDAlertView.h"

@interface WDAlertView ()

@property (nonatomic,copy) WDAlertViewButtonClickBlock buttonClickBlock;

@end

@implementation WDAlertView



- (id)initWithTitle:(NSString *)title
            message:(NSString *)message
       dismissBlock:(WDAlertViewButtonClickBlock)block
  cancelButtonTitle:(NSString *)cancelButtonTitle
firstOtherButtonTitle:(NSString*)firstOtherbuttonTitle
 otherButtonVarList:(va_list)args
{
	if (( self = [super initWithTitle:title message:message delegate:self cancelButtonTitle:cancelButtonTitle otherButtonTitles:firstOtherbuttonTitle, nil] ))
	{
		if ( firstOtherbuttonTitle )
		{
			NSString *otherButtonTitle = nil;
			while (( otherButtonTitle = va_arg( args, NSString * )))
				[self addButtonWithTitle:otherButtonTitle];
		}
        self.buttonClickBlock = block;
    }
    return self;
}

- (id)initWithTitle:(NSString *)title
            message:(NSString *)message
       dismissBlock:(WDAlertViewButtonClickBlock)block
  cancelButtonTitle:(NSString *)cancelButtonTitle
  otherButtonTitles:(NSString *)otherButtonTitles, ... {
    
    //create var list
    va_list args;
    va_start(args, otherButtonTitles);
    
    self = [self initWithTitle:title
                       message:message
                  dismissBlock:block
             cancelButtonTitle:cancelButtonTitle
         firstOtherButtonTitle:otherButtonTitles
            otherButtonVarList:args];
    
    va_end(args);
    
    if (self) {
        //all fine
    }
    
    return self;
}


+ (void)showAlertViewWithTitle:(NSString *)title
                     message:(NSString *)message
                dismissBlock:(WDAlertViewButtonClickBlock)block
           cancelButtonTitle:(NSString *)cancelButtonTitle
           otherButtonTitles:(NSString *)otherButtonTitles, ...NS_REQUIRES_NIL_TERMINATION {
    
    va_list args;
    va_start(args, otherButtonTitles);
    
    UIAlertView* alert = [[WDAlertView alloc] initWithTitle:title
                                                    message:message
                                               dismissBlock:block
                                          cancelButtonTitle:cancelButtonTitle
                                      firstOtherButtonTitle:otherButtonTitles
                                         otherButtonVarList:args];
    
    va_end(args);
    
    [alert show];
}

#pragma mark - UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    
    if (self.buttonClickBlock) {
        self.buttonClickBlock(self, buttonIndex);
    }
    
    self.buttonClickBlock = nil;
}

@end
