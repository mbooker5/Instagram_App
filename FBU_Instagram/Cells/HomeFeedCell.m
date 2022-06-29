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
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setPost{
//    _post = post;
//    NSDictionary *boldAttribute = @{
//         NSFontAttributeName: [UIFont boldSystemFontOfSize:15.0]
//    };
////    NSDictionary *regularAttribute = @{
////        NSFontAttributeName: [UIFont boldSystemFontOfSize:15.0]
////    };
//    // construct PFQuery
//
//    NSString *username = [NSString stringWithFormat:@"%@", self.post.author.username];
//    NSRange range0 = NSMakeRange(0, [self.post.author.username length]);
////    NSRange range1 = NSMakeRange([self.post.author.username length], [self.post.author.username length] + [self.post.caption length]);
//    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:username];
//    [attrString setAttributes:boldAttribute range:range0];
////    [attrString setAttributes:regularAttribute range:range1];
    
    self.postUC.text = [NSString stringWithFormat:@"%@%@%@", self.post.author.username, @" ", self.post.caption];
    self.postUsername.text = self.post.author.username;
    self.postLikeCount.text = [NSString stringWithFormat:@"%@%@", self.post.likeCount, @" likes"];
//    self.postImage.image = self.post.image;
    [self.postImage setImageWithURL:[NSURL URLWithString:self.post.image.url]];
}
@end
