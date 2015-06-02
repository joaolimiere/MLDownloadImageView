# DownloadImageView

Component to download images for iOS.

Features:

- Images from a URL Download
- Rounded edges
- Error PlaceHolder
- Progress to download
- Cache images

[![](http://imagizer.imageshack.us/v2/640x480q90/540/7656U2.png)](http://imagizer.imageshack.us/v2/640x480q90/540/7656U2.png)
[![](http://imagizer.imageshack.us/v2/640x480q90/537/hj3XAy.png)](http://imagizer.imageshack.us/v2/640x480q90/537/hj3XAy.png)

## Requirements

N/A

## Adding DownloadImageView to your project

### Cocoapods

[CocoaPods](http://cocoapods.org) is the recommended way to add DownloadImageView to your project.

1. Add a pod entry for DownloadImageView to your Podfile `pod 'DownloadImageView', '~> 1.0'`
2. Install the pod(s) by running `pod install`.
3. Include DownloadImageView wherever you need it with `#import <DownloadImageView/DownloadImageView.h>`.

### Source files

Alternatively you can directly add the `DownloadImageView.h` and `DownloadImageView.m` source files to your project.

1. Download the [latest code version](https://github.com/marcoslacerda/DownloadImageView/archive/master.zip) or add the repository as a git submodule to your git-tracked project. 
2. Open your project in Xcode, then drag and drop `DownloadImageView.h` and `DownloadImageView.m` onto your project (use the "Product Navigator view"). Make sure to select Copy items when asked if you extracted the code archive outside of your project. 
3. Include DownloadImageView wherever you need it with `#import "DownloadImageView.h"`.

## Usage

To use DownloadImageView simply create an object and make the call of methods as following example:

```objective-c
DownloadImageView *imageView = [[DownloadImageView alloc] initWithFrame:CGRectMake(0, 0, 204, 204)];

[self.view addSubview:imageView];

// Configure DownloadImageView
NSString *yourURL = @""; // Url download image here
NSURL *urlToDownload = [[NSURL alloc] initWithString:yourURL];

// Place Holders (Is not required)
UIImage *placeHolder = [UIImage imageNamed:@"yourPlaceHolder"];
UIImage *imageError = [UIImage imageNamed:@"yourImageError"];

// Optional settings
BOOL isRounded = NO;
BOOL cacheEnable = YES;

[imageView downloadImageWithURL:urlToDownload placeHolder:placeHolder imageError:imageError roundedCorners:isRounded];

imageView.progressColor = [UIColor blackColor];
imageView.cacheEnable = cacheEnable;

// Start download
[imageView startDownload];
```