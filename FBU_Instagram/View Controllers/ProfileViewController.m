//
//  ProfileViewController.m
//  FBU_Instagram
//
//  Created by Maize Booker on 6/30/22.
//

#import "ProfileViewController.h"
#import "HomeFeedCell.h"
#import "UIImageView+AFNetworking.h"
#import "PFObject.h"
#import "Post.h"


@interface ProfileViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    PFUser *user = PFUser.currentUser;
    PFFileObject *avatarfileObject = user[@"profilePicture"];
    [avatarfileObject getDataInBackgroundWithBlock:^(NSData * _Nullable data, NSError * _Nullable error) {
            self.userProfilePicture.image = [UIImage imageWithData:data];
    }];
    
    self.userUsername.text = user.username;
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    // Get the image captured by the UIImagePickerController
    UIImage *originalImage = info[UIImagePickerControllerOriginalImage];
//    UIImage *editedImage = info[UIImagePickerControllerEditedImage];
    // Do something with the images (based on your use case)
    _userProfilePicture.image = originalImage;
    PFUser.currentUser[@"profilePicture"] = [Post getPFFileFromImage:originalImage];
    [PFUser.currentUser saveInBackground];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)didTapProfilePicture:(id)sender {
    UIImagePickerController *imagePickerVC = [UIImagePickerController new];
    imagePickerVC.delegate = self;
    imagePickerVC.allowsEditing = YES;
    

    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Upload Image"
                                   message:@""
                                   preferredStyle:UIAlertControllerStyleAlert];
     
    UIAlertAction* useCamera = [UIAlertAction actionWithTitle:@"Camera" style:UIAlertActionStyleDefault
        handler:^(UIAlertAction * action){
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            imagePickerVC.sourceType = UIImagePickerControllerSourceTypeCamera;
            }
        else {
            imagePickerVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        }
        [self presentViewController:imagePickerVC animated:YES completion:nil];
    }];
    
    UIAlertAction* usePhotoLibrary = [UIAlertAction actionWithTitle:@"Photo Library" style:UIAlertActionStyleDefault
        handler:^(UIAlertAction * action){
        imagePickerVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:imagePickerVC animated:YES completion:nil];
    }];
    
    
    [alert addAction:useCamera];
    [alert addAction:usePhotoLibrary];
    [self presentViewController:alert animated:YES completion:nil];
    
}


@end
