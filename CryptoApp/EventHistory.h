//
//  EventHistory.h
//  FinApp
//
//  Created by Sidd Singh on 10/13/15.
//  Copyright (c) 2015 Sidd Singh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Event;

@interface EventHistory : NSManagedObject

// Date for the previous event of the same type as the parent event. Currently being used for
// the 30 days ago from today market date.
@property (nonatomic, retain) NSDate * previous1Date;

// Indicator if this previous event 1 is "Estimated" based on an algorithm or "Confirmed"
// to be on the day it actually happened. Idea is as the user uses this app, we confirm these events.
// TO DO: Fix when you add a new table for event characteristics.
// For Product Events, this field is currently being overloaded to store a string representing Impact, Impact Description, More Info Title and More Info Url i.e. (Impact_Impact Description_MoreInfoTitle_MoreInfoUrl)
@property (nonatomic, retain) NSString * previous1Status;

// Date related to the previous event.
// 1. "Quarterly Earnings" would have the end date of the previous fiscal quarter
// that was reported.
// Currently being used for the market open date at the start of the year.
@property (nonatomic, retain) NSDate * previous1RelatedDate;

// Date which is considered to be the current date.
@property (nonatomic, retain) NSDate * currentDate;

// Stock price on the previous event 1 date.
// NOTE: 999999.9 is a placeholder for empty prices, meaning we don't have the value.
// For currency price change events this stores the percent change for the last 7 days.
@property (nonatomic, retain) NSNumber * previous1Price;

// Stock price on previous 1 related event date.
// For currency price change events this stores the 24 hr percent change
@property (nonatomic, retain) NSNumber * previous1RelatedPrice;

// Current stock price which right now is yesterday's price
// For currency price change events this stores the current price.
@property (nonatomic, retain) NSNumber * currentPrice;

// Parent event for which this is the history.
@property (nonatomic, retain) Event *parentEvent;

@end
