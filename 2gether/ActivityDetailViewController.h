//
//  ActivityDetailViewController.h
//  2gether
//
//  Created by suncihai on 15/12/2.
//  Copyright (c) 2015年 suncihai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FLAnimatedImage.h"
#import "FLAnimatedImageView.h"


@interface ActivityDetailViewController : UIViewController

@property (nonatomic,strong) NSString *DetailRoomName;
@property (nonatomic,strong) NSString *DetailNumbers;
@property (nonatomic,strong) IBOutlet UILabel *DetailNumbersLabel;
@property (nonatomic,strong) NSString *DetailAddress;
@property (nonatomic,strong) IBOutlet UITextView *DetailAddressTextView;
@property (nonatomic,strong) NSString *DetailTime;
@property (nonatomic,strong) IBOutlet UILabel *DetailTimeLabel;
@property (nonatomic,strong) NSString *DetailComment;
@property (nonatomic,strong) NSString *DetailImage;
@property (nonatomic,strong) IBOutlet UITextView *DetailCommentTextView;
@property (weak, nonatomic) IBOutlet UIButton *LikeActivitybtn;
@property (nonatomic,strong) NSString *DetailActivityType;

@property (weak,nonatomic) IBOutlet FLAnimatedImageView *DetailImageView;

@end
