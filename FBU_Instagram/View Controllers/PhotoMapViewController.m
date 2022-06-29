//
//  PhotoMapViewController.m
//  FBU_Instagram
//
//  Created by Maize Booker on 6/28/22.
//

#import "PhotoMapViewController.h"

@interface PhotoMapViewController ()
@property (strong, nonatomic) IBOutlet UIButton *imageSelector;

@end


@implementation PhotoMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    // Get the image captured by the UIImagePickerController
    UIImage *originalImage = info[UIImagePickerControllerOriginalImage];
//    UIImage *editedImage = info[UIImagePickerControllerEditedImage];
    // Do something with the images (based on your use case)
    _imageToPost.image = originalImage;
    // Dismiss UIImagePickerController to go back to your original view controller
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)didTapCancel:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}

- (IBAction)didTapShare:(id)sender {
    [Post postUserImage:_imageToPost.image withCaption:_captionToPost.text withCompletion:^(BOOL succeeded, NSError * _Nullable error){
        [self dismissViewControllerAnimated:YES completion:nil];
        NSLog(@"Post shared successfully!");
    }];
}

- (IBAction)didTapImage:(id)sender {
    
    
    UIImagePickerController *imagePickerVC = [UIImagePickerController new];
    imagePickerVC.delegate = self;
    imagePickerVC.allowsEditing = YES;
    

    // The Xcode simulator does not support taking pictures, so let's first check that the camera is indeed supported on the device before trying to present it.
    
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
