//
//  HomeFeedCell.h
//  FBU_Instagram
//
//  Created by Maize Booker on 6/29/22.
//

#import <UIKit/UIKit.h>
#import "Parse/Parse.h"
#import "Post.h"
#import "PFObject.h"
#import "Parse/ParseUIConstants.h"


NS_ASSUME_NONNULL_BEGIN

@interface HomeFeedCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *postProfilePicture;
@property (strong, nonatomic) IBOutlet UILabel *postUsername;
@property (strong, nonatomic) IBOutlet UIImageView *postImage;
@property (strong, nonatomic) IBOutlet UIButton *postLikeButton;
@property (strong, nonatomic) IBOutlet UILabel *postLikeCount;
@property (strong, nonatomic) IBOutlet UILabel *postUC; //Username and Caption label
@property (strong, nonatomic) Post *post;
- (void) setPost;

@end

NS_ASSUME_NONNULL_END
