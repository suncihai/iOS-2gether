//
//  MyActivityViewController.h
//  2gether
//
//  Created by suncihai on 15/12/2.
//  Copyright (c) 2015年 suncihai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyActivityViewController : UITableViewController

@property NSMutableArray *MyActivityArray;
@property (nonatomic,strong) NSString *MyActivityRoomName;
@property (nonatomic,strong) NSString *MyActivityNumbers;
@property (nonatomic,strong) NSString *MyActivityLocation;
@property (nonatomic,strong) NSString *MyActivityTime;
@property (nonatomic,strong) NSString *MyActivityImage;
@property (nonatomic,strong) NSString *MyActivityComment;


@end
