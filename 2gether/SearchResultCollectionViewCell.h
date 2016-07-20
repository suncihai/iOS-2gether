//
//  SearchResultCollectionViewCell.h
//  Sample-UISearchController
//
//  Created by suncihai on 15/12/3.
//  Copyright (c) 2015年 suncihai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchResultCollectionViewCell : UICollectionViewCell

@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *titleImageView;

@end
