 //
//  SearchResultsCollectionViewController.m
//  Sample-UISearchController
//
//  Created by suncihai on 15/12/3.
//  Copyright (c) 2015年 suncihai. All rights reserved.
//

#import "SearchResultsCollectionViewController.h"
#import "SearchResultCollectionViewCell.h"
#import "ActivityDetailViewController.h"
#import "Activity.h"

@interface SearchResultsCollectionViewController ()

@end

@implementation SearchResultsCollectionViewController

static NSString * const reuseIdentifier = @"SearchResultCell";


- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.contentInset = UIEdgeInsetsMake(44.0, 0.0, 0.0, 0.0);
    self.collectionView.scrollIndicatorInsets = UIEdgeInsetsMake(44.0, 0.0, 0.0, 0.0);
}

- (void)willMoveToParentViewController:(UIViewController *)parent {
    [super willMoveToParentViewController:parent];
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

#pragma mark <UICollectionViewDataSource>


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.searchResults count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    SearchResultCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    Activity *activity = [self.searchResults objectAtIndex:indexPath.row];
    cell.titleLabel.text = activity.RoomName;
    cell.titleImageView.image=[UIImage imageNamed:activity.Image];
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    Activity *activity = [self.searchResults objectAtIndex:indexPath.row];
    ActivityDetailViewController *dest = [[self storyboard] instantiateViewControllerWithIdentifier:@"ActivityDetailViewController"];
    self.presentingViewController.navigationItem.title = @"Search";
    dest.DetailRoomName=activity.RoomName;
    dest.DetailNumbers=activity.Numbers;
    dest.DetailAddress=activity.Location;
    dest.DetailComment=activity.Comment;
    dest.DetailImage=activity.Image;
    [self.presentingViewController.navigationController pushViewController:dest animated:YES];
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
	return YES;
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

@end
