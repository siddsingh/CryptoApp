//
//  FASnapShot.h
//  FinApp
//
//  Class to store changing data like High Impact Eevents, Trending Events, News Sources and others. Implement this class as a Singleton to create a single data store accessible from anywhere in the app.
//
//  Created by Sidd Singh on 5/21/17.
//  Copyright © 2017 Sidd Singh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class FADataController;
@class EventHistory;
@class Event;

@interface FASnapShot : NSObject

// Create and/or return the single shared data store
+ (FASnapShot *) sharedSnapShot;

// Returns if that event is a High Impact event or not. Examples of high impact events: 1) High impact product launches like iPhone 8, Naples Chip as these either validate my investment thesis or help form a new one. 2) High impact econ events that help shed light on how the market is likely to play out. e.g. Interest rates are likely to go up. Financials will do well. GDP is a big number stocks will likely do well.3) Big name companies earnings like FANG or Apple whose earnings can impact overall market.
- (BOOL)isEventHighImpact:(NSString *)eventType eventParent:(NSString *)parentTicker;

/// Get the brand background color for given ticker
- (UIColor *)getBrandBkgrndColorForCompany:(NSString *)ticker;

// Get the brand text color for given ticker
- (UIColor *)getBrandTextColorForCompany:(NSString *)ticker;

// Does small icon Exist
- (BOOL)doesSmallIconExist:(NSString *)ticker;

// Get the small icon as a background color
- (UIColor *)getSmallIconAsBkgrndColorForCompany:(NSString *)ticker;

// Get the event source based on the event type.
- (NSString *)getNewsSource:(Event *)rawEvent;

// Get formatted news source strings
- (NSMutableAttributedString *)getFormattedSource:(NSString *)src;

// Get formatted title of learning article
- (NSMutableAttributedString *)getFormattedLearningTitle:(NSIndexPath *)rowPath ofType:(NSInteger)typeDesc;

// Get formatted description of learning article
- (NSString *)getLearningDescription:(NSIndexPath *)rowPath ofType:(NSInteger)typeDesc;

// Get URL of learning article
- (NSString *)getLearningURL:(NSIndexPath *)rowPath ofType:(NSInteger)typeDesc;

// Get the learning item color
- (UIColor *)getLearningItemColor:(NSIndexPath *)rowPath ofType:(NSInteger)typeDesc;

// Get the length of the video string
- (NSString *)getVideoLength:(NSIndexPath *)rowPath;

// Get the regular news icon based on keyword and desc
- (UIColor *)getNewsImageWithKeyword:(NSString *)keyword andDescription:(NSString *)desc;

// Get the small news icon based on keyword and desc
- (UIColor *)getSmallNewsImageWithKeyword:(NSString *)keyword andDescription:(NSString *)desc;

@end
