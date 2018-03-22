//
//  FATutorialViewController.h
//  FinApp
//
//  Class to manage the user tutorial
//
//  Created by Sidd Singh on 11/11/16.
//  Copyright © 2016 Sidd Singh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FATutorialViewController : UIViewController

// User presses the Done with the Tutorial button
- (IBAction)tutorialDonePressed:(id)sender;

// Got It button
@property (weak, nonatomic) IBOutlet UIButton *tutorialDoneButton;

@end
