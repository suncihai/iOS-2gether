//
//  AddRoomViewController.h
//  2gether
//
//  Created by suncihai on 15/12/1.
//  Copyright (c) 2015年 suncihai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddRoomViewController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate>
{
    NSArray *ActivityType;
    UIDatePicker *datePicker;
}

@property (nonatomic,strong) NSString *NewRoomName;
@property (nonatomic,strong) IBOutlet UITextField *InputNewRoomName;
@property (nonatomic,strong) NSString *NewLocation;
@property (nonatomic,strong) IBOutlet UITextField *InputNewLocation;
@property (nonatomic,strong) NSString *NewTime;
@property (nonatomic,strong) IBOutlet UITextField *InputNewTime;
@property (nonatomic,strong) NSString *NewImage;
@property (nonatomic,strong) IBOutlet UITextField *InputNewImage;
@property (nonatomic,strong) NSString *NewComment;
@property (nonatomic,strong) IBOutlet UITextField *InputComment;
@property (nonatomic,strong) NSString *NewActivityType;

-(IBAction)textfieldReturnEditing:(id)sender;
-(IBAction)backgroundTap:(id)sender;

@end
