//
//  LoginViewController.m
//  FBU_Instagram
//
//  Created by Maize Booker on 6/27/22.
//

#import "LoginViewController.h"

@interface LoginViewController ()
@property (strong, nonatomic) IBOutlet UITextField *usernameField;
@property (strong, nonatomic) IBOutlet UITextField *passwordField;
- (IBAction)loginUser:(id)sender;
- (IBAction)registerUser:(id)sender;

@end

@implementation LoginViewController

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

- (IBAction)registerUser:(id)sender {
    [self registerUser];
}

- (IBAction)loginUser:(id)sender {
    [self loginUser];
}


- (void)registerUser {
    // initialize a user object
    PFUser *newUser = [PFUser user];
    
    // set user properties
    newUser.username = self.usernameField.text;
//    newUser.email = self.emailField.text;
    newUser.password = self.passwordField.text;
    
    if ([self.usernameField.text isEqual:@""]) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Enter Username to Register" message:@"Username field can not be empty when signing up." preferredStyle:(UIAlertControllerStyleAlert)];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                                                                 // handle response here.
}];
        // add the OK action to the alert controller
        [alert addAction:okAction];
        [self presentViewController:alert animated:YES completion:^{
            // optional code for what happens after the alert controller has finished presenting
        }];
    }
    else if ([self.passwordField.text isEqual:@""]) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Enter Password to Register" message:@"Password field can not be empty when signing up." preferredStyle:(UIAlertControllerStyleAlert)];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                                                                 // handle response here.
}];
        // add the OK action to the alert controller
        [alert addAction:okAction];
        [self presentViewController:alert animated:YES completion:^{
            // optional code for what happens after the alert controller has finished presenting
        }];
    }
    
    // call sign up function on the object
    [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError * error) {
        if (error != nil) {
            NSLog(@"Error: %@", error.localizedDescription);
        } else {
            // makes segue to ChatViewController
            [self performSegueWithIdentifier:@"loginSegue" sender:nil];
            NSLog(@"User registered successfully");
            
        }
    }];
}

- (void)loginUser {
    NSString *username = self.usernameField.text;
    NSString *password = self.passwordField.text;
    
    if ([self.usernameField.text isEqual:@""]) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Enter Username to Login" message:@"Username field can not be empty when logging in." preferredStyle:(UIAlertControllerStyleAlert)];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                                                                 // handle response here.
}];
        // add the OK action to the alert controller
        [alert addAction:okAction];
        [self presentViewController:alert animated:YES completion:^{
            // optional code for what happens after the alert controller has finished presenting
        }];
    }
    else if ([self.passwordField.text isEqual:@""]) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Enter Password to Login" message:@"Password field can not be empty when logging in." preferredStyle:(UIAlertControllerStyleAlert)];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                                                                 // handle response here.
}];
        // add the OK action to the alert controller
        [alert addAction:okAction];
        [self presentViewController:alert animated:YES completion:^{
            // optional code for what happens after the alert controller has finished presenting
        }];
    }
    
    [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser * user, NSError *  error) {
        if (error != nil) {
            NSLog(@"User log in failed: %@", error.localizedDescription);
        } else {
            // makes segue to ChatViewController
            [self performSegueWithIdentifier:@"loginSegue" sender:nil];
            NSLog(@"User logged in successfully");
            
            // display view controller that needs to shown after successful login
        }
    }];
}


@end
