//
//  ProfileViewController.h
//  FBU_Instagram
//
//  Created by Maize Booker on 6/30/22.
//

#import <UIKit/UIKit.h>
#import "Parse/Parse.h"
#import "SceneDelegate.h"
NS_ASSUME_NONNULL_BEGIN

@interface ProfileViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *userProfilePicture;
@property (strong, nonatomic) IBOutlet UILabel *userUsername;

@end

NS_ASSUME_NONNULL_END
