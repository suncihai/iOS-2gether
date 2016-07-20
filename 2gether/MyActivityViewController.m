//
//  MyActivityViewController.m
//  2gether
//
//  Created by suncihai on 15/12/2.
//  Copyright (c) 2015年 suncihai. All rights reserved.
//

#import "MyActivityViewController.h"
#import "Activity.h"
#import "MyActivityCell.h"
#import "ActivityDetailViewController.h"

@interface MyActivityViewController ()

//-(IBAction)JoinActivity:(UIStoryboardSegue *)segue;

@end

@implementation MyActivityViewController


@synthesize MyActivityComment;
@synthesize MyActivityImage;
@synthesize MyActivityLocation;
@synthesize MyActivityNumbers;
@synthesize MyActivityRoomName;
@synthesize MyActivityTime;

@synthesize MyActivityArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Activity *activity1=[Activity new];
    activity1.RoomName=@"";
    activity1.Location=@"";
    activity1.Numbers=@"";
    activity1.Time=@"";
    activity1.Image=@"";
    activity1.Comment=@"";
    
    MyActivityArray=[NSMutableArray arrayWithObjects:activity1,nil];
    
    self.title=@"My Favourite Activity";
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [MyActivityArray count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 240;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier=@"MyActivityCell";
    MyActivityCell *cell=(MyActivityCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
    if(cell==nil){
        NSArray *nib=[[NSBundle mainBundle]loadNibNamed:@"MyActivityCell" owner:self options:nil];
        cell=[nib objectAtIndex:0];
    }
    
    cell.MyActivityRoomNameLabel.text=MyActivityRoomName;
    cell.MyActivityLocationLabel.text=MyActivityLocation;
    cell.MyActivityNumbersLabel.text=MyActivityNumbers;
    cell.MyActivityTimeLabel.text=MyActivityTime;
    cell.MyActivityImageView.image=[UIImage imageNamed:MyActivityImage];
    
    return cell;
}


@end
