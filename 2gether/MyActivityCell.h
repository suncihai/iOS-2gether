//
//  MyActivityCell.h
//  2gether
//
//  Created by suncihai on 15/12/2.
//  Copyright (c) 2015年 suncihai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyActivityCell : UITableViewCell

@property (nonatomic,weak) IBOutlet UILabel *MyActivityRoomNameLabel;
@property (nonatomic,weak) IBOutlet UILabel *MyActivityNumbersLabel;
@property (nonatomic,weak) IBOutlet UILabel *MyActivityLocationLabel;
@property (nonatomic,weak) IBOutlet UILabel *MyActivityTimeLabel;
@property (nonatomic,weak) IBOutlet UIImageView *MyActivityImageView;

@end
