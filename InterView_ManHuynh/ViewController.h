//
//  ViewController.h
//  InterView_ManHuynh
//
//  Created by huynh man on 7/13/14.
//  Copyright (c) 2014 huynh man. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CountryPicker.h"
#import "NBPhoneMetaDataGenerator.h"
#import "NBPhoneNumberUtil.h"

@interface ViewController : UIViewController <CountryPickerDelegate> {
    NBPhoneNumberUtil *phoneUtil;
    CountryPicker *PK;
    UILabel *notifyLabel;
}
@property (nonatomic, strong) IBOutlet CountryPicker *PK;
@property (nonatomic, strong) IBOutlet UILabel *nameLabel;
@property (nonatomic, strong) IBOutlet UILabel *codeLabel;
@property (nonatomic, strong) IBOutlet UITextField *phoneNumber;
@property (nonatomic, strong) IBOutlet UILabel *notifyLabel;

@end

