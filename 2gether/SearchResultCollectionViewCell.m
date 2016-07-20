//
//  SearchResultCollectionViewCell.m
//  Sample-UISearchController
//
//  Created by suncihai on 15/12/3.
//  Copyright (c) 2015年 suncihai. All rights reserved.
//

#import "SearchResultCollectionViewCell.h"

@implementation SearchResultCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];

    self.selectedBackgroundView = [[UIView alloc] init];
    self.selectedBackgroundView.backgroundColor = [UIColor colorWithRed:0.85 green:0.85 blue:0.85 alpha:1.0];

    self.layer.borderColor = [[UIColor blackColor] CGColor];
    self.layer.borderWidth = 1.0;
    self.layer.cornerRadius = 10.0;

}
@end
