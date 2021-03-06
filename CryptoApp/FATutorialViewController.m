//
//  FATutorialViewController.m
//  FinApp
//
//  Class to manage the user tutorial
//
//  Created by Sidd Singh on 11/11/16.
//  Copyright © 2016 Sidd Singh. All rights reserved.
//

#import "FATutorialViewController.h"

@interface FATutorialViewController ()

@end

@implementation FATutorialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tutorialDoneButton.clipsToBounds = YES;
    self.tutorialDoneButton.layer.cornerRadius = 5;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// User presses the Done with the Tutorial button
- (IBAction)tutorialDonePressed:(id)sender {
    
    // Set that the user has used the app at least once
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"V1_0_5_UsedOnce"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
