#import <UIKit/UIKit.h>

@interface MLDownloadImageView : UIImageView {
    NSURL *urlToDownload;
    UIImage *placeHolder;
    UIImage *imageError;
    UIActivityIndicatorView *progress;
    NSOperationQueue *queue;
    BOOL roundedCorners;
    UIColor *progressColor;
}

-(id)initWithFrame:(CGRect)frame;
-(id)initWithCoder:(NSCoder *)decoder;
-(void)downloadImageWithURL:(NSURL *)url placeHolder:(UIImage *)placeHolder imageError:(UIImage *)imageError roundedCorners:(BOOL)roundedCorners;
-(void)startDownload;

@property (nonatomic, copy) UIColor *progressColor;
@property (assign, nonatomic) BOOL cacheEnable;

@end