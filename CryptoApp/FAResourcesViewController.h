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

// New for 2021: First resource button - CT
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *resourceBtn1;

// New for 2021: Pressed first resource button - CT
- (IBAction)resourceBtn1Pressed:(id)sender;

// New for 2021: Second resource button - SEC
@property (weak, nonatomic) IBOutlet UIButton *resourceBtn2;

// New for 2021: Pressed second resource button - SEC
- (IBAction)resourceBtn2Pressed:(id)sender;

// New for 2021: Third resource button - CC
@property (weak, nonatomic) IBOutlet UIButton *resourceBtn3;

// New for 2021: Pressed third resource button - CC
- (IBAction)resourceBtn3Pressed:(id)sender;

// New for 2021: Fourth resource button - EC
@property (weak, nonatomic) IBOutlet UIButton *resourceBtn4;

// New for 2021: Pressed fourth resource button - EC
- (IBAction)resourceBtn4Pressed:(id)sender;

@end

NS_ASSUME_NONNULL_END
