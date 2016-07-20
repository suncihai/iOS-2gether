//
//  FLViewController.h
//
//  Created by suncihai on 15/10/5.
//  Copyright (c) 2015年 suncihai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FLViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet UITextField *messageField;
@property (weak, nonatomic) IBOutlet UIButton *speakBtn;
- (IBAction)voiceBtnClick:(UIButton *)sender;
@end
