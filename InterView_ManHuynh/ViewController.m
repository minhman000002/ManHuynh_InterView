//
//  ViewController.m
//  InterView_ManHuynh
//
//  Created by huynh man on 7/13/14.
//  Copyright (c) 2014 huynh man. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
            

@end

@implementation ViewController
@synthesize PK,notifyLabel;
            
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    phoneUtil = [NBPhoneNumberUtil sharedInstance];
    NBPhoneMetaDataGenerator *generator = [[NBPhoneMetaDataGenerator alloc] init];
    [generator generateMetadataClasses];

    [PK setSelectedCountryName:@"Vietnam" animated:YES];
    UIToolbar* keyboardDoneButtonView = [[UIToolbar alloc] init];
    [keyboardDoneButtonView sizeToFit];
    UIBarButtonItem* doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                                                   style:UIBarButtonItemStyleBordered target:self
                                                                  action:@selector(doneClicked:)];
    [keyboardDoneButtonView setItems:[NSArray arrayWithObjects:doneButton, nil]];
    _phoneNumber.inputAccessoryView = keyboardDoneButtonView;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)countryPicker:(__unused CountryPicker *)picker didSelectCountryWithName:(NSString *)name code:(NSString *)code
{
    _nameLabel.text = code;
    _codeLabel.text = [[phoneUtil getCountryCodeForRegion:code] stringValue];
}

- (void)doneClicked:(id) sender {
    [_phoneNumber resignFirstResponder];
    {
        NSString *fullPhoneNumber = [[@"+" stringByAppendingString:_codeLabel.text] stringByAppendingString:_phoneNumber.text];
        NSError *error = nil;
        NBPhoneNumber *phoneNumberZZ = [phoneUtil parse:fullPhoneNumber defaultRegion:_nameLabel.text error:&error];
        if (error) {
            NSLog(@"err [%@]", [error localizedDescription]);
        }
        if ([phoneUtil isValidNumber:phoneNumberZZ] && [phoneUtil isPossibleNumber:phoneNumberZZ error:&error]) {
            notifyLabel.text = @"Correct";
        }
        else {
            notifyLabel.text = @"Your number is not correct, please try again !";
        }
        NSLog(@"- isValidNumber [%@]", [phoneUtil isValidNumber:phoneNumberZZ] ? @"YES" : @"NO");
        NSLog(@"- isPossibleNumber [%@]", [phoneUtil isPossibleNumber:phoneNumberZZ error:&error] ? @"YES" : @"NO");
        NSLog(@"- getRegionCodeForNumber [%@]", [phoneUtil getRegionCodeForNumber:phoneNumberZZ]);
    }

    
}

@end
