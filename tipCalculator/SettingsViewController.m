//
//  SettingsViewController.m
//  tipCalculator
//
//  Created by Chinmay Kini on 1/19/15.
//  Copyright (c) 2015 Chinmay Kini. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *defaultTipValueField;
- (IBAction)onTap:(id)sender;



@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    int ele = self.getDefaultValue;
    self.defaultTipValueField.selectedSegmentIndex = ele;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)onTap:(id)sender {

    int index = (int)self.defaultTipValueField.selectedSegmentIndex;

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:index forKey:@"default_tip_percetage"];
    [defaults synchronize];
}

- (int) getDefaultValue{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int intValue = (int)[defaults integerForKey:@"default_tip_percetage"];
    return intValue;
}
@end
