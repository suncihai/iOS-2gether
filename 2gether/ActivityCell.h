//
//  ActivityCell.h
//  2gether
//
//  Created by suncihai on 15/10/5.
//  Copyright (c) 2015年 suncihai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ActivityCell : UITableViewCell

@property (weak,nonatomic) IBOutlet UILabel *ActivityName;
@property (weak,nonatomic) IBOutlet UILabel *ActivityLocation;
@property (weak,nonatomic) IBOutlet UILabel *ActivityNumbers;
@property (weak,nonatomic) IBOutlet UILabel *ActivityTime;
@property (weak,nonatomic) IBOutlet UIImageView *ActivityImage;

@end
