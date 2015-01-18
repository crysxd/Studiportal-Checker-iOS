//
//  DialogHost.h
//  HFU Studiportal
//
//  Created by Christian Würthner on 17.01.15.
//  Copyright (c) 2015 Hochschule Furtwangen University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface DialogHostViewController : UIViewController

@property MBProgressHUD* progressView;

-(void) showIndeterminateProgressDialogWithTitle:(NSString*)title andText:(NSString*)text;
-(void) cancelProgressDialog;
-(void) showErrorDialogWithMessage:(NSString*)message;
-(void) showDialogWithTitle:(NSString*)title andText:(NSString*)text;

@end