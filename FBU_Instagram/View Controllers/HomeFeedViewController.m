//
//  HomeFeedViewController.m
//  FBU_Instagram
//
//  Created by Maize Booker on 6/27/22.
//

#import "HomeFeedViewController.h"
#import "LoginViewController.h"
#import "SceneDelegate.h"
#import "PostDetailsViewController.h"

@interface HomeFeedViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *arrayOfPosts;
@end

@implementation HomeFeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
 
    [self getPosts];
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(beginRefresh:) forControlEvents:UIControlEventValueChanged];
    [self.tableView insertSubview:refreshControl atIndex:0];
    [self.tableView reloadData];
}

-(void)getPosts{

    PFQuery *postQuery = [Post query];
    [postQuery orderByDescending:@"createdAt"];
    [postQuery includeKey:@"author"];
    postQuery.limit = 20;

  
    [postQuery findObjectsInBackgroundWithBlock:^(NSArray<Post *> * _Nullable posts, NSError * _Nullable error) {
        if (posts) {
            self.arrayOfPosts = posts;
        }
        else {
        }
        [self.tableView reloadData];
    }];
    
}

- (void)beginRefresh:(UIRefreshControl *)refreshControl {
    [self getPosts];
    [refreshControl endRefreshing];
    [self.tableView reloadData];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"details"]){
        NSIndexPath *myIndexPath = [self.tableView indexPathForCell:sender];
        Post *dataToPass = self.arrayOfPosts[myIndexPath.row];
        PostDetailsViewController *vc = [segue destinationViewController];
        vc.post = dataToPass;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrayOfPosts.count; //
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HomeFeedCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"HomeFeedCell" forIndexPath:indexPath]; 
    
    Post *post = self.arrayOfPosts[indexPath.row];
    cell.post = post;
    [cell setPost];

    
    return cell;
}


- (IBAction)didTapLogout:(id)sender {
    SceneDelegate *sceneDelegate = (SceneDelegate *)self.view.window.windowScene.delegate;

    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    LoginViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    sceneDelegate.window.rootViewController = loginViewController;
    
    [PFUser logOutInBackgroundWithBlock:^(NSError * _Nullable error) {

    }];
    NSLog(@"User logged out successfully");
    
}

- (IBAction)didTapPost:(id)sender {
    [self performSegueWithIdentifier:@"postSegue" sender:nil];
}




@end
