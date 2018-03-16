//
//  FAEventsTableViewCell.m
//  FinApp
//
//  Class that manages the custom events table view cell
//
//  Created by Sidd Singh on 12/23/14.
//  Copyright (c) 2014 Sidd Singh. All rights reserved.
//

#import "FAEventsTableViewCell.h"
#import <QuartzCore/QuartzCore.h>

@implementation FAEventsTableViewCell

- (void)awakeFromNib {
    // Initialization code
    [super awakeFromNib];
    
    // Set top left and right corners to rounded for icon label
    self.listIconLbl.clipsToBounds = YES;
    self.listIconLbl.layer.cornerRadius = 16;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
