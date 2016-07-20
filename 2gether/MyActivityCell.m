//
//  MyActivityCell.m
//  2gether
//
//  Created by suncihai on 15/12/2.
//  Copyright (c) 2015年 suncihai. All rights reserved.
//

#import "MyActivityCell.h"

@implementation MyActivityCell

@synthesize MyActivityTimeLabel;
@synthesize MyActivityNumbersLabel;
@synthesize MyActivityLocationLabel;
@synthesize MyActivityImageView;
@synthesize MyActivityRoomNameLabel;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
