//
//  HomeFeedCell.m
//  FBU_Instagram
//
//  Created by Maize Booker on 6/29/22.
//

#import "HomeFeedCell.h"
#import "UIImageView+AFNetworking.h"



@implementation HomeFeedCell

- (void)awakeFromNib {
    [super awakeFromNib];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

-(void)setPost{

    self.postUC.text = [NSString stringWithFormat:@"%@%@%@", self.post.author.username, @" ", self.post.caption];
    self.postUsername.text = self.post.author.username;
    self.postLikeCount.text = [NSString stringWithFormat:@"%@%@", self.post.likeCount, @" likes"];
    [self.postImage setImageWithURL:[NSURL URLWithString:self.post.image.url]];
    PFFileObject *userAvatar = self.post.author[@"profilePicture"];
    [self.postProfilePicture setImageWithURL:[NSURL URLWithString:userAvatar.url]];
    
}
@end
