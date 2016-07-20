//
//  ActivitiesRoomTableViewController.m
//  2gether
//
//  Created by suncihai on 15/10/5.
//  Copyright (c) 2015年 suncihai. All rights reserved.
//

#import "ActivitiesRoomTableViewController.h"
#import "Activity.h"
#import "ActivityCell.h"
#import "ActivityDetailViewController.h"
#import "SearchResultsCollectionViewController.h"
#import "MyActivityViewController.h"

@interface ActivitiesRoomTableViewController ()

@property (nonatomic,strong) UISearchController *searchController;
@property (nonatomic,strong) NSMutableArray *searchResults;

-(IBAction)cancel:(UIStoryboardSegue *)segue;
-(IBAction)done:(UIStoryboardSegue *)segue;

@end

@implementation ActivitiesRoomTableViewController

@synthesize ActivityArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Activity *activity1=[Activity new];
    activity1.RoomName=@"Drinking";
    activity1.Location=@"Dirty Bar, 6th Ave & 43th St.";
    activity1.Numbers=@"7";
    activity1.Time=@"2015/Oct/10";
    activity1.Image=@"Drinking.jpg";
    activity1.ActivityType=@"Drinking";
    activity1.Comment=@"8pm, we are looking forwart to meeting u! Let's have fun!";

    
    Activity *activity2=[Activity new];
    activity2.RoomName=@"Sushi";
    activity2.Location=@"SakuraYa, 7th Ave & 39th St.";
    activity2.Numbers=@"5";
    activity2.Time=@"2015/Oct/12";
    activity2.Image=@"Sushi.jpg";
    activity2.ActivityType=@"Sushi";
    activity2.Comment=@"6pm, anyone who likes eating sushi please join us! We can talk about our favorite sushi!";
    
    Activity *activity3=[Activity new];
    activity3.RoomName=@"Shopping";
    activity3.Location=@"FairFax";
    activity3.Numbers=@"4";
    activity3.Time=@"2015/Oct/30";
    activity3.Image=@"Shopping.jpg";
    activity3.ActivityType=@"Shopping";
    activity3.Comment=@"around 4pm, looking for girls to go shopping and have a good time together";
    
    Activity *activity4=[Activity new];
    activity4.RoomName=@"BoardGame";
    activity4.Location=@"Crystal Tower";
    activity4.Numbers=@"9";
    activity4.Time=@"2015/Nov/01";
    activity4.Image=@"BoardGame.jpg";
    activity4.ActivityType=@"BoardGame";
    activity4.Comment=@"We will play Big Bang this week, anyone who is good at or be interested please feel free to come to join us!";
    
    Activity *activity5=[Activity new];
    activity5.RoomName=@"Desert";
    activity5.Location=@"36th St.,Alexndria";
    activity5.Numbers=@"3";
    activity5.Time=@"2015/Dec/01";
    activity5.Image=@"Desert.jpg";
    activity5.ActivityType=@"Desert";
    activity5.Comment=@"Sweet Cakes are waiting for us!";
    
    ActivityArray= [NSMutableArray arrayWithObjects:activity1,activity2,activity3,activity4,activity5,nil];
    
    self.searchResults=[NSMutableArray arrayWithCapacity:[ActivityArray count]];
    
    UINavigationController *searchResultsController=[[self storyboard] instantiateViewControllerWithIdentifier:@"CollectionSearchResultsNavController"];
    
    self.searchController=[[UISearchController alloc]initWithSearchResultsController:searchResultsController];
    
    self.searchController.searchBar.placeholder=@"Input Key word to search";
    
    self.searchController.searchResultsUpdater=self;
    
    self.searchController.searchBar.frame=CGRectMake(self.searchController.searchBar.frame.origin.x, self.searchController.searchBar.frame.origin.y, self.searchController.searchBar.frame.size.width, 44.0);
    
    self.tableView.tableHeaderView=self.searchController.searchBar;
    
    self.definesPresentationContext=YES;
    
}

-(IBAction)cancel:(UIStoryboardSegue *)segue
{
}

-(IBAction)done:(UIStoryboardSegue *)segue{
    AddRoomViewController *addRoomVC =segue.sourceViewController;
    Activity *activity=[Activity new];
    activity.RoomName=addRoomVC.NewRoomName;
    activity.Location=addRoomVC.NewLocation;
    activity.Numbers=@"1";
    activity.Time=addRoomVC.NewTime;
    activity.Image=addRoomVC.NewImage;
    activity.ActivityType=addRoomVC.NewActivityType;
    activity.Comment=addRoomVC.NewComment;
    
    [ActivityArray addObject:activity];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
       return [ActivityArray count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 240;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier=@"ActivityCell";
    ActivityCell *cell=(ActivityCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
    if(cell==nil){
        NSArray *nib=[[NSBundle mainBundle]loadNibNamed:@"ActivityCell" owner:self options:nil];
        cell=[nib objectAtIndex:0];
    }
    
    Activity *activity=[ActivityArray objectAtIndex:indexPath.row];
    
    cell.ActivityName.text=activity.RoomName;
    cell.ActivityLocation.text=activity.Location;
    cell.ActivityNumbers.text=activity.Numbers;
    cell.ActivityTime.text=activity.Time;
    cell.ActivityImage.image=[UIImage imageNamed:activity.Image];
    
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"ToDetail"]){
    ActivityDetailViewController *dest=segue.destinationViewController;
    NSIndexPath *indexPath=[self.tableView indexPathForSelectedRow];
    Activity *activity=[ActivityArray objectAtIndex:indexPath.row];
    dest.DetailRoomName=activity.RoomName;
    dest.DetailNumbers=activity.Numbers;
    dest.DetailAddress=activity.Location;
    dest.DetailTime=activity.Time;
    dest.DetailComment=activity.Comment;
    dest.DetailActivityType=activity.ActivityType;
    dest.DetailImage=activity.Image;
    }
}

-(void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    
    NSString *searchString = [self.searchController.searchBar text];
    
    [self updateFilteredContentForProjectName:searchString];
    
    if (self.searchController.searchResultsController) {
        UINavigationController *navController = (UINavigationController *)self.searchController.searchResultsController;
        
        SearchResultsCollectionViewController *vc = (SearchResultsCollectionViewController *)navController.topViewController;
        vc.searchResults = self.searchResults;
        [vc.collectionView reloadData];
    }
    
}

- (void)updateFilteredContentForProjectName:(NSString *)ActivityName{
    
    // Update the filtered array based on the search text and scope.
    if ((ActivityName == nil)||[ActivityName length] == 0){
        // If there is no search string and the scope is "All".
        self.searchResults = [ActivityArray mutableCopy];
        return;
    }
    
    [self.searchResults removeAllObjects]; // First clear the filtered array.
    
    /*  Search the main list for products whose type matches the scope (if selected) and whose name matches searchText; add items that match to the filtered array.
     */
    for (Activity *activity in ActivityArray) {
        NSUInteger searchOptions = NSCaseInsensitiveSearch | NSDiacriticInsensitiveSearch;
        NSRange activityNameRange = NSMakeRange(0, activity.RoomName.length);
        NSRange foundRange = [activity.RoomName rangeOfString:ActivityName options:searchOptions range:activityNameRange];
        if (foundRange.length > 0) {
            [self.searchResults addObject:activity];
        }
    }
}


@end
