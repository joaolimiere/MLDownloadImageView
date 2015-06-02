#import "MLDownloadImageView.h"

@implementation MLDownloadImageView

@synthesize progressColor;

#pragma mark - LifeCycle

-(id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        progress = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        
        [self addSubview:progress];
    }

    return self;
}

-(id)initWithCoder:(NSCoder *)decoder {
    if (self = [super initWithCoder:decoder]) {
        progress = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
        
        [self addSubview:progress];
    }

    return self;
}

-(void)downloadImageWithURL:(NSURL *)url placeHolder:(UIImage *)holder imageError:(UIImage *)error roundedCorners:(BOOL)roundedBounds {
    placeHolder = holder;
    urlToDownload = url;
    roundedCorners = roundedBounds;
    imageError = error;
}

-(void) layoutSubviews {
    [super layoutSubviews];
    progress.center = [self convertPoint:self.center fromView:self.superview];
}

-(void)setProgressColor:(UIColor *)progressColorParam {
    progressColor = [progressColorParam copy];
}

-(void)startDownload {
    self.image = placeHolder;
    
    if (!urlToDownload) {
        self.image = imageError;
    } else {
        if (progressColor) {
            [progress setTintColor:progressColor];
            [progress setColor:progressColor];
        }

        if (!queue) {
            queue = [[NSOperationQueue alloc] init];
        }

        [queue cancelAllOperations];
        [progress startAnimating];
        
        NSInvocationOperation *operation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(downloadImage) object:nil];

        [queue addOperation:operation];
    }
}

#pragma mark - Download Methods

-(void) downloadImage {
    NSString *url = [urlToDownload absoluteString];

    NSString *fileName = [url stringByReplacingOccurrencesOfString:@"/" withString:@"_"];
    
    fileName = [fileName stringByReplacingOccurrencesOfString:@"\\" withString:@"_"];
    fileName = [fileName stringByReplacingOccurrencesOfString:@":" withString:@"_"];
    fileName = [@"/Documents/" stringByAppendingString:fileName];
    fileName = [NSHomeDirectory() stringByAppendingString:[NSString stringWithString:fileName]];

    // If already in cache
    if (_cacheEnable && [[NSFileManager defaultManager] fileExistsAtPath:fileName]) {
        NSData *data = [NSData dataWithContentsOfFile:fileName];

        if (data) {
            UIImage *image = [[UIImage alloc] initWithData:data];

            [self performSelectorOnMainThread:@selector(showImage:) withObject:image waitUntilDone:YES];

            return;
        }
    }

    // If not exists, downloading image
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
    UIImage *image;

    if (data == nil) {
        image = placeHolder;
    } else {
        image = [[UIImage alloc] initWithData:data];
    }

    // Save in cache
    if (_cacheEnable) {
        [data writeToFile:fileName atomically:YES];
    }

    // Update ImageView
    [self performSelectorOnMainThread:@selector(showImage:) withObject:image waitUntilDone:YES];
}

-(void)showImage:(UIImage *)image {
    if (image) {
        self.image = image;
    } else {
        if (imageError) {
            self.image = imageError;
        } else {
            self.image = placeHolder;
        }
    }
    
    [progress stopAnimating];
    
    [self roundedBounds];
    
    self.contentMode = UIViewContentModeScaleToFill;
    self.clipsToBounds = YES;
}

-(void)roundedBounds {
    if (roundedCorners) {
        self.layer.cornerRadius = self.frame.size.width / 2;
        self.layer.masksToBounds = YES;
    }
}

@end