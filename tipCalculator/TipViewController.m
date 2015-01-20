//
//  TipViewController.m
//  tipCalculator
//
//  Created by Chinmay Kini on 1/19/15.
//  Copyright (c) 2015 Chinmay Kini. All rights reserved.
//

#import "TipViewController.h"
#import "SettingsViewController.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabelField;
@property (weak, nonatomic) IBOutlet UILabel *totalLabelField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *percentSegmentField;

- (IBAction)onTap:(id)sender;
- (void)updateValues;


@end

@implementation TipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"Tip Calculator";
    [self updateValues];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:self action:@selector(onSettingsButton)];
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

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"view will appear");
    
    SettingsViewController *tvc = [[SettingsViewController alloc] init];
    int ele = tvc.getDefaultValue;
    self.percentSegmentField.selectedSegmentIndex = ele;
    [self updateValues];
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"view did appear");
}

- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"view will disappear");
}

- (void)viewDidDisappear:(BOOL)animated {
    NSLog(@"view did disappear");
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
    [self updateValues];
}

- (void) updateValues{
    
    float billAmount = [self.billTextField.text floatValue];
    
    NSArray *tipValues = @[@(0.1), @(0.15), @(0.20)];
    
    float tipAmount = billAmount * [tipValues[self.percentSegmentField.selectedSegmentIndex] floatValue];
    
    float totalAmount = billAmount + tipAmount;
    
    self.tipLabelField.text = [NSString stringWithFormat:@"%.2f", tipAmount];
    
    self.totalLabelField.text = [NSString stringWithFormat:@"%.2f", totalAmount];
    
}

- (void) onSettingsButton{
    [self.navigationController pushViewController:[[SettingsViewController alloc] init] animated:YES];

}
@end
