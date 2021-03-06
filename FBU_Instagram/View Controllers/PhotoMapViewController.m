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
   
}



- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    UIImage *originalImage = info[UIImagePickerControllerOriginalImage];
    _imageToPost.image = originalImage;
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
