//
//  PostDetailsViewController.m
//  FBU_Instagram
//
//  Created by Maize Booker on 6/30/22.
//

#import "PostDetailsViewController.h"
#import "UIImageView+AFNetworking.h"

@interface PostDetailsViewController ()

@end

@implementation PostDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.detailsCaption.text = self.post.caption;
    self.detailsUsername.text = [NSString stringWithFormat:@"%@%@", @"Posted by ", self.post.author.username];
    self.detailsDate.text = self.post.createdAt.shortTimeAgoSinceNow;
    [self.detailsImage setImageWithURL:[NSURL URLWithString:self.post.image.url]];
}


- (IBAction)didTapBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
//    [self performSegueWithIdentifier:@"backfromdetails" sender:nil];
}

@end
