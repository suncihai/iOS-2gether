//
//  ActivityDetailViewController.m
//  2gether
//
//  Created by suncihai on 15/12/2.
//  Copyright (c) 2015年 suncihai. All rights reserved.
//

#import "ActivityDetailViewController.h"
#import "MyActivityViewController.h"
#import "Activity.h"


@interface ActivityDetailViewController ()

@end

@implementation ActivityDetailViewController


@synthesize DetailRoomName;
@synthesize DetailAddress;
@synthesize DetailAddressTextView;
@synthesize DetailComment;
@synthesize DetailCommentTextView;
@synthesize DetailNumbers;
@synthesize DetailNumbersLabel;
@synthesize DetailTime;
@synthesize DetailTimeLabel;
@synthesize DetailImage;
@synthesize LikeActivitybtn;
@synthesize DetailActivityType;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title=DetailRoomName;
    [DetailNumbersLabel setText:DetailNumbers];
    [DetailAddressTextView setText:DetailAddress];
    [DetailTimeLabel setText:DetailTime];
    [DetailCommentTextView setText:DetailComment];
    
    FLAnimatedImage *TopViewImage = [[FLAnimatedImage alloc] initWithAnimatedGIFData:[NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:DetailActivityType ofType:@"gif"]]];
    
    self.DetailImageView.animatedImage = TopViewImage;
    
    [self.view addSubview:self.DetailImageView];
    
//    [LikeActivitybtn addTarget:self action:@selector(TouchDown) forControlEvents:UIControlEventTouchDown];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"DetailToMyChoice"]){
        MyActivityViewController *dest=segue.destinationViewController;
        dest.MyActivityRoomName=DetailRoomName;
        dest.MyActivityLocation=DetailAddress;
        dest.MyActivityNumbers=DetailNumbers;
        dest.MyActivityTime=DetailTime;
        dest.MyActivityComment=DetailComment;
        dest.MyActivityImage=DetailImage;
    }
}

@end
