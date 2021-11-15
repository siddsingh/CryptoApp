//
//  FAResourcesViewController.m
//  CryptoApp
//
//  Created by Sidd Singh on 11/13/21.
//  Copyright © 2021 Sidd Singh. All rights reserved.
//

#import "FAResourcesViewController.h"
#import <SafariServices/SafariServices.h>

@interface FAResourcesViewController () <SFSafariViewControllerDelegate>

@end

@implementation FAResourcesViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - Resource Button Behavior

// New for 2021: Pressed first resource button - CT
- (IBAction)resourceBtn1Pressed:(id)sender {
    
    // CT URL
    SFSafariViewController *hilightVC1 = [[SFSafariViewController alloc] initWithURL:[NSURL URLWithString:@"https://cointelegraph.com"]];
    hilightVC1.delegate = self;
    hilightVC1.preferredControlTintColor = [UIColor blackColor];
    [self presentViewController:hilightVC1 animated:YES completion:nil];
}

// New for 2021: Pressed second resource button - SEC
- (IBAction)resourceBtn2Pressed:(id)sender {
    
    // SEC URL
    SFSafariViewController *hilightVC2 = [[SFSafariViewController alloc] initWithURL:[NSURL URLWithString:@"https://twitter.com/GaryGensler"]];
    hilightVC2.delegate = self;
    hilightVC2.preferredControlTintColor = [UIColor blackColor];
    [self presentViewController:hilightVC2 animated:YES completion:nil];
}

// New for 2021: Pressed third resource button - CC
- (IBAction)resourceBtn3Pressed:(id)sender {
    
    // CC URL
    SFSafariViewController *hilightVC3 = [[SFSafariViewController alloc] initWithURL:[NSURL URLWithString:@"https://twitter.com/jerrybrito"]];
    hilightVC3.delegate = self;
    hilightVC3.preferredControlTintColor = [UIColor blackColor];
    [self presentViewController:hilightVC3 animated:YES completion:nil];
}

// New for 2021: Fourth resource button - EC
- (IBAction)resourceBtn4Pressed:(id)sender {
    
    // EC URL
    SFSafariViewController *hilightVC4 = [[SFSafariViewController alloc] initWithURL:[NSURL URLWithString:@"https://podcasts.apple.com/us/podcast/epicenter-learn-about-crypto-blockchain-ethereum-bitcoin/id792338939?mt=2"]];
    hilightVC4.delegate = self;
    hilightVC4.preferredControlTintColor = [UIColor blackColor];
    [self presentViewController:hilightVC4 animated:YES completion:nil];
}

@end
