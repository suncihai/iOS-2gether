//
//  ActivitiesRoomTableViewController.h
//  2gether
//
//  Created by suncihai on 15/10/5.
//  Copyright (c) 2015年 suncihai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddRoomViewController.h"

@interface ActivitiesRoomTableViewController : UITableViewController

@property NSMutableArray *ActivityArray;

@property (weak,nonatomic) IBOutlet UIBarButtonItem *siderbarButton;

@end
