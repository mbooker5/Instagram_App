//
//  PhotoMapViewController.h
//  FBU_Instagram
//
//  Created by Maize Booker on 6/28/22.
//

#import <UIKit/UIKit.h>
#import "Parse/Parse.h"
#import "Post.h"
NS_ASSUME_NONNULL_BEGIN

@interface PhotoMapViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (strong, nonatomic) IBOutlet UIImageView *imageToPost;
@property (strong, nonatomic) IBOutlet UITextField *captionToPost;
//- (void) ima
@end

NS_ASSUME_NONNULL_END
