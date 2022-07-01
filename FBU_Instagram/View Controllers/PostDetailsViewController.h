//
//  PostDetailsViewController.h
//  FBU_Instagram
//
//  Created by Maize Booker on 6/30/22.
//

#import <UIKit/UIKit.h>
#import "HomeFeedViewController.h"
#import "DateTools.h"
NS_ASSUME_NONNULL_BEGIN

@interface PostDetailsViewController : UIViewController
@property (strong, nonatomic) Post *post;
@property (strong, nonatomic) IBOutlet UIImageView *detailsImage;
@property (strong, nonatomic) IBOutlet UILabel *detailsCaption;
@property (strong, nonatomic) IBOutlet UILabel *detailsUsername;
@property (strong, nonatomic) IBOutlet UILabel *detailsDate;
@end

NS_ASSUME_NONNULL_END
