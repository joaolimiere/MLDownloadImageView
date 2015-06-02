//
//  ViewController.m
//  DownloadImageViewExample
//
//  Created by Marcos Lacerda on 30/05/15.
//  Copyright (c) 2015 Marcos Lacerda. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"MLDownloadImageView Example"];
}

#pragma mark - Actions

-(IBAction)startDownloadClick:(id)sender {
    // Check if download url is present
    if ([[urlField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]isEqualToString:@""]) {
        UIAlertView *dialog = [[UIAlertView alloc] initWithTitle:@"Error" message:@"URL to download is required to continue." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
        [dialog show];
        return;
    }
    
    [urlField endEditing:YES];
    
    // Download Image
    NSURL *urlToDownload = [[NSURL alloc] initWithString:urlField.text];
    UIImage *placeHolder = [UIImage imageNamed:@"placeHolder"];
    UIImage *imageError = [UIImage imageNamed:@"imageError"];
    
    [imageView downloadImageWithURL:urlToDownload placeHolder:placeHolder imageError:imageError roundedCorners:roundedCorners.isOn];
    
    imageView.progressColor = [UIColor blackColor];
    imageView.cacheEnable = YES;
    
    // Start download
    [imageView startDownload];
}

#pragma mark - UITextFieldDelegate

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField endEditing:YES];
    
    return YES;
}

@end