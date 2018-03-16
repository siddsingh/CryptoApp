//
//  FAEventsTableViewCell.h
//  FinApp
//
//  Class that manages the custom events table view cell
//
//  Created by Sidd Singh on 12/23/14.
//  Copyright (c) 2014 Sidd Singh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FAEventsTableViewCell : UITableViewCell

// Label that represents the company ticker whose event we are showing.
@property (weak, nonatomic) IBOutlet UILabel *companyTicker;

// Label that represents the company name whose event we are showing.
@property (weak, nonatomic) IBOutlet UILabel *companyName;

// Label that represents the event description
@property (weak, nonatomic) IBOutlet UILabel *eventDescription;

// Label that represents the date of the event
@property (weak, nonatomic) IBOutlet UILabel *eventDate;

// Label that represents the certainty of this event
@property (weak, nonatomic) IBOutlet UILabel *eventCertainty;

// Flag to show if the event needs to be fetched from the remote data source
@property BOOL eventRemoteFetch;

// Label representing the event impact.
@property (weak, nonatomic) IBOutlet UILabel *eventImpact;

// Layout constraint specifying top space from Event description to container. Set to 4 in IB.
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topSpaceForEventDesc;

// For the appropriate icon in the list view.
@property (weak, nonatomic) IBOutlet UILabel *listIconLbl;


@end
