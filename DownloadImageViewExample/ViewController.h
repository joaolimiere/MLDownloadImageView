//
//  ViewController.h
//  DownloadImageViewExample
//
//  Created by Marcos Lacerda on 30/05/15.
//  Copyright (c) 2015 Marcos Lacerda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MLDownloadImageView.h"

@interface ViewController : UIViewController<UITextFieldDelegate> {
    IBOutlet MLDownloadImageView *imageView;
    IBOutlet UITextField *urlField;
    IBOutlet UISwitch *roundedCorners;
}

@end
