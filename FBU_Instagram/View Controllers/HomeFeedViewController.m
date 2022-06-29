//
//  HomeFeedViewController.m
//  FBU_Instagram
//
//  Created by Maize Booker on 6/27/22.
//

#import "HomeFeedViewController.h"
#import "LoginViewController.h"
#import "SceneDelegate.h"

@interface HomeFeedViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *arrayOfPosts;
@end

@implementation HomeFeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    // Do any additional setup after loading the view.
    [self getPosts];
    [self.tableView reloadData];
}

-(void)getPosts{
    // construct PFQuery
    PFQuery *postQuery = [Post query];
    [postQuery orderByDescending:@"createdAt"];
    [postQuery includeKey:@"author"];
    postQuery.limit = 20;

    // fetch data asynchronously
    [postQuery findObjectsInBackgroundWithBlock:^(NSArray<Post *> * _Nullable posts, NSError * _Nullable error) {
        if (posts) {
            // do something with the data fetched
//            self.postUsername = postQuery[author];
//
            self.arrayOfPosts = posts;
        }
        else {
            // handle error
        }
        [self.tableView reloadData];
    }];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
// Returns the number of rows for the table.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section { //required method from UITableViewDataSource
    return self.arrayOfPosts.count; // # of cells
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{ //required method from UITableViewDataSource
    HomeFeedCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"HomeFeedCell" forIndexPath:indexPath]; //class constructor
    
    Post *post = self.arrayOfPosts[indexPath.row];
    cell.post = post;
    [cell setPost];
//    [cell refreshData];
    
    return cell;
}


- (IBAction)didTapLogout:(id)sender {
    SceneDelegate *sceneDelegate = (SceneDelegate *)self.view.window.windowScene.delegate;

    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    LoginViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    sceneDelegate.window.rootViewController = loginViewController;
    
    [PFUser logOutInBackgroundWithBlock:^(NSError * _Nullable error) {
        // PFUser.current() will now be nil
    }];
    NSLog(@"User logged out successfully");
    
}

- (IBAction)didTapPost:(id)sender {
    [self performSegueWithIdentifier:@"postSegue" sender:nil];
}


@end
