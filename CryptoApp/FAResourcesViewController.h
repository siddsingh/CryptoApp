//
//  FAResourcesViewController.h
//  CryptoApp
//
//  Created by Sidd Singh on 11/13/21.
//  Copyright © 2021 Sidd Singh. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FAResourcesViewController : UIViewController

// First resource button
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *resourceBtn1;

// First resource button pressed
- (IBAction)resourceBtn1Pressed:(id)sender;


@end

NS_ASSUME_NONNULL_END
