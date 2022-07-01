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

- (IBAction)registerUser:(id)sender {
    [self registerUser];
}

- (IBAction)loginUser:(id)sender {
    [self loginUser];
}


- (void)registerUser {
    PFUser *newUser = [PFUser user];
    newUser.username = self.usernameField.text;
    newUser.password = self.passwordField.text;
    
    if ([self.usernameField.text isEqual:@""]) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Enter Username to Register" message:@"Username field can not be empty when signing up." preferredStyle:(UIAlertControllerStyleAlert)];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                        
}];

        [alert addAction:okAction];
        [self presentViewController:alert animated:YES completion:^{

        }];
    }
    else if ([self.passwordField.text isEqual:@""]) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Enter Password to Register" message:@"Password field can not be empty when signing up." preferredStyle:(UIAlertControllerStyleAlert)];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                                                
}];
        [alert addAction:okAction];
        [self presentViewController:alert animated:YES completion:^{
        }];
    }
    

    [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError * error) {
        if (error != nil) {
            NSLog(@"Error: %@", error.localizedDescription);
        } else {

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
                                                              
}];

        [alert addAction:okAction];
        [self presentViewController:alert animated:YES completion:^{
  
        }];
    }
    else if ([self.passwordField.text isEqual:@""]) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Enter Password to Login" message:@"Password field can not be empty when logging in." preferredStyle:(UIAlertControllerStyleAlert)];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                                                            
}];
  
        [alert addAction:okAction];
        [self presentViewController:alert animated:YES completion:^{

        }];
    }
    
    [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser * user, NSError *  error) {
        if (error != nil) {
            NSLog(@"User log in failed: %@", error.localizedDescription);
        } else {
            // makes segue to ChatViewController
            [self performSegueWithIdentifier:@"loginSegue" sender:nil];
            NSLog(@"User logged in successfully");
            

        }
    }];
}


@end
