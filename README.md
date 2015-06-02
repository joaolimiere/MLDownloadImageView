# MLDownloadImageView

Component to download images for iOS.

Features:

- Images from a URL Download
- Rounded edges
- Error PlaceHolder
- Progress to download
- Cache images

[![](http://imagizer.imageshack.us/v2/640x480q90/538/FY2De3.png)](http://imagizer.imageshack.us/v2/640x480q90/538/FY2De3.png)
[![](http://imagizer.imageshack.us/v2/640x480q90/905/QCIWYv.png)](http://imagizer.imageshack.us/v2/640x480q90/905/QCIWYv.png)

## Requirements

N/A

## Adding MLDownloadImageView to your project

### Cocoapods

[CocoaPods](http://cocoapods.org) is the recommended way to add MLDownloadImageView to your project.

1. Add a pod entry for MLDownloadImageView to your Podfile `pod 'MLDownloadImageView', '~> 1.0'`
2. Install the pod(s) by running `pod install`.
3. Include MLDownloadImageView wherever you need it with `#import <MLDownloadImageView/MLDownloadImageView.h>`.

### Source files

Alternatively you can directly add the `MLDownloadImageView.h` and `MLDownloadImageView.m` source files to your project.

1. Download the [latest code version](https://github.com/marcoslacerda/MLDownloadImageView/archive/master.zip) or add the repository as a git submodule to your git-tracked project. 
2. Open your project in Xcode, then drag and drop `MLDownloadImageView.h` and `MLDownloadImageView.m` onto your project (use the "Product Navigator view"). Make sure to select Copy items when asked if you extracted the code archive outside of your project. 
3. Include MLDownloadImageView wherever you need it with `#import "MLDownloadImageView.h"`.

## Usage

To use MLDownloadImageView simply create an object and make the call of methods as following example:

```objective-c
MLDownloadImageView *imageView = [[MLDownloadImageView alloc] initWithFrame:CGRectMake(0, 0, 204, 204)];

[self.view addSubview:imageView];

// Configure MLDownloadImageView
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

## LICENSE

This project use MIT License.