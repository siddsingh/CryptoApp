//
//  FASnapShot.m
//  FinApp
//
//  Class to store changing data like High Impact Events, Trending Events, News Sources and others. Also stores things like a company's brand colors. Implement this class as a Singleton to create a single data store accessible from anywhere in the app.
//
//  Created by Sidd Singh on 5/21/17.
//  Copyright © 2017 Sidd Singh. All rights reserved.
//

#import "FASnapShot.h"
#import "FADataController.h"
#import "EventHistory.h"
#import <UIKit/UIKit.h>
#import "Event.h"

@implementation FASnapShot

static FASnapShot *sharedInstance;

// Implement this class as a Singleton to create a single data store accessible
// from anywhere in the app.
+ (void)initialize
{
    
    static BOOL exists = NO;
    
    // If a SnapShot doesn't already exist
    if(!exists)
    {
        exists = YES;
        sharedInstance= [[FASnapShot alloc] init];
    }
}

// Create and/or return the single Snapshot
+(FASnapShot *)sharedSnapShot {
    
    return sharedInstance;
}

// Returns if that event is a High Impact event or not given the raw event type and parent ticker. Examples of high impact events: 1) High impact product launches like iPhone 8, Naples Chip as these either validate my investment thesis or help form a new one. 2) High impact econ events that help shed light on how the market is likely to play out. e.g. Interest rates are likely to go up. Financials will do well. GDP is a big number stocks will likely do well.3) Big name companies earnings like FANG or Apple whose earnings can impact overall market.
- (BOOL)isEventHighImpact:(NSString *)eventType eventParent:(NSString *)parentTicker
{
    BOOL highImpact = NO;
    FADataController *impactController = [[FADataController alloc] init];
    
    // If the event type is earnings, return true for big name companies earnings like FANG or Apple whose earnings can impact overall market
    if ([eventType isEqualToString:@"Quarterly Earnings"]) {
        
        // Cramer's FANG
        /*if ([parentTicker containsString:@"FB"]) {
            highImpact = YES;
        }*/
        if ([parentTicker containsString:@"AMZN"]) {
            highImpact = YES;
        }
        if ([parentTicker containsString:@"NFLX"]) {
            highImpact = YES;
        }
        /*if ([parentTicker containsString:@"GOOG"]) {
            highImpact = YES;
        }*/
        
        // From Knotifi top 10
        if ([parentTicker containsString:@"BAC"]) {
            highImpact = YES;
        }
        /*if ([parentTicker containsString:@"BABA"]) {
            highImpact = YES;
        }*/
        if ([parentTicker containsString:@"LULU"]) {
            highImpact = YES;
        }
        /*if ([parentTicker containsString:@"TSLA"]) {
            highImpact = YES;
        }*/
        if ([parentTicker containsString:@"NKE"]) {
            highImpact = YES;
        }
        /*if ([parentTicker containsString:@"MSFT"]) {
            highImpact = YES;
        }*/
        if ([parentTicker containsString:@"BAC"]) {
            highImpact = YES;
        }
        
        // Curated by Sidd
        if ([parentTicker containsString:@"AAPL"]) {
            highImpact = YES;
        }
        if ([parentTicker containsString:@"JPM"]) {
            highImpact = YES;
        }
        if ([parentTicker containsString:@"GS"]) {
            highImpact = YES;
        }
        if ([parentTicker containsString:@"NVDA"]) {
            highImpact = YES;
        }
    }
    
    if ([eventType containsString:@"Fed Meeting"]) {
        // This is the event description
        //description = @"Very High Impact.Outcome determines key interest rates.";
        highImpact = YES;
    }
    
    if ([eventType containsString:@"Jobs Report"]) {
        // This is the event description
        //description = @"Very High Impact.Reflects the health of the job market.";
        highImpact = YES;
    }
    
    // If event type is Product, the impact is stored in the event history data store, so fetch it from there.
    if ([eventType containsString:@"Launch"]||[eventType containsString:@"Conference"]) {
        
        // Get event history that stores the following string for product events in it's previous1Status field: Impact_Impact Description_MoreInfoTitle_MoreInfoUrl
        EventHistory *eventHistoryForImpact = [impactController getEventHistoryForParentEventTicker:parentTicker parentEventType:eventType];
        
        // Parse out to construct the Impact Text.
        NSArray *impactComponents = [eventHistoryForImpact.previous1Status componentsSeparatedByString:@"_"];
        NSString *description = [NSString stringWithFormat:@"%@ Impact.%@",impactComponents[0],impactComponents[1]];
        
        if ([description containsString:@"Very High Impact"]) {
            // This is the event description
            //description = @"Very High Impact.Outcome determines key interest rates.";
            highImpact = YES;
        }
    }
    
    return highImpact;
}

// Get the brand background color for given ticker
- (UIColor *)getBrandBkgrndColorForCompany:(NSString *)ticker {
    
    //Default Darkish whitish gray
    UIColor *colorToReturn = [UIColor colorWithRed:177.0f/255.0f green:177.0f/255.0f blue:177.0f/255.0f alpha:1.0f];
    
    if ([ticker caseInsensitiveCompare:@"BTC"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:239.0f/255.0f green:142.0f/255.0f blue:51.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"ETH"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:94.0f/255.0f green:117.0f/255.0f blue:185.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"XRP"] == NSOrderedSame) {
       // colorToReturn = [UIColor colorWithRed:16.0f/255.0f green:43.0f/255.0f blue:62.0f/255.0f alpha:1.0f];
       // Better color for the detail view scheme. Upper one is the original
       //colorToReturn = [UIColor colorWithRed:24.0f/255.0f green:33.0f/255.0f blue:104.0f/255.0f alpha:1.0f];
        // Blue more in line with icon
        //colorToReturn = [UIColor colorWithRed:64.0f/255.0f green:162.0f/255.0f blue:221.0f/255.0f alpha:1.0f];
        colorToReturn = [UIColor colorWithRed:52.0f/255.0f green:137.0f/255.0f blue:193.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"BCH"] == NSOrderedSame) {
        // Old green
        colorToReturn = [UIColor colorWithRed:0.0f/255.0f green:213.0f/255.0f blue:74.0f/255.0f alpha:1.0f];
        // Orange more in line with icon
        //colorToReturn = [UIColor colorWithRed:240.0f/255.0f green:140.0f/255.0f blue:51.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"ADA"] == NSOrderedSame) {
        // Old
        //colorToReturn = [UIColor colorWithRed:33.0f/255.0f green:110.0f/255.0f blue:216.0f/255.0f alpha:1.0f];
        // New
        //colorToReturn = [UIColor colorWithRed:94.0f/255.0f green:200.0f/255.0f blue:201.0f/255.0f alpha:1.0f];
        colorToReturn = [UIColor colorWithRed:42.0f/255.0f green:93.0f/255.0f blue:197.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"LTC"] == NSOrderedSame) {
        // Old
        //colorToReturn = [UIColor colorWithRed:63.0f/255.0f green:63.0f/255.0f blue:63.0f/255.0f alpha:1.0f];
        // New
        //colorToReturn = [UIColor blackColor];
        colorToReturn = [UIColor colorWithRed:87.0f/255.0f green:87.0f/255.0f blue:87.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"NEO"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:118.0f/255.0f green:185.0f/255.0f blue:7.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"XLM"] == NSOrderedSame) {
        // Old slightly grayish blue
        colorToReturn = [UIColor colorWithRed:172.0f/255.0f green:208.0f/255.0f blue:218.0f/255.0f alpha:1.0f];
        //More light blue, doesn't work as well for detail view
        //colorToReturn = [UIColor colorWithRed:213.0f/255.0f green:236.0f/255.0f blue:242.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"EOS"] == NSOrderedSame) {
        //Old
        //colorToReturn = [UIColor colorWithRed:57.0f/255.0f green:38.0f/255.0f blue:23.0f/255.0f alpha:1.0f];
        //New
        colorToReturn = [UIColor colorWithRed:38.0f/255.0f green:37.0f/255.0f blue:37.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"MIOTA"] == NSOrderedSame) {
        //colorToReturn = [UIColor blackColor];
        colorToReturn = [UIColor colorWithRed:81.0f/255.0f green:170.0f/255.0f blue:151.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"XEM"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:89.0f/255.0f green:187.0f/255.0f blue:173.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"DASH"] == NSOrderedSame) {
        //Old awesome blue
        //colorToReturn = [UIColor colorWithRed:1.0f/255.0f green:97.0f/255.0f blue:213.0f/255.0f alpha:1.0f];
        colorToReturn = [UIColor colorWithRed:36.0f/255.0f green:117.0f/255.0f blue:188.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"XMR"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:236.0f/255.0f green:99.0f/255.0f blue:51.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"LSK"] == NSOrderedSame) {
        //colorToReturn = [UIColor colorWithRed:47.0f/255.0f green:135.0f/255.0f blue:202.0f/255.0f alpha:1.0f];
        //colorToReturn = [UIColor colorWithRed:4.0f/255.0f green:75.0f/255.0f blue:157.0f/255.0f alpha:1.0f];
        colorToReturn = [UIColor colorWithRed:47.0f/255.0f green:136.0f/255.0f blue:209.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"TRX"] == NSOrderedSame) {
        colorToReturn = [UIColor blackColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"USDT"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:78.0f/255.0f green:162.0f/255.0f blue:124.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"ETC"] == NSOrderedSame) {
        //colorToReturn = [UIColor colorWithRed:234.0f/255.0f green:234.0f/255.0f blue:234.0f/255.0f alpha:1.0f];
        // Better color for the detail view scheme. Upper one is the original
        //colorToReturn = [UIColor colorWithRed:94.0f/255.0f green:184.0f/255.0f blue:88.0f/255.0f alpha:1.0f];
        colorToReturn = [UIColor colorWithRed:102.0f/255.0f green:144.0f/255.0f blue:115.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"VEN"] == NSOrderedSame) {
        //colorToReturn = [UIColor colorWithRed:98.0f/255.0f green:150.0f/255.0f blue:229.0f/255.0f alpha:1.0f];
        //colorToReturn = [UIColor colorWithRed:78.0f/255.0f green:189.0f/255.0f blue:251.0f/255.0f alpha:1.0f];
        colorToReturn = [UIColor colorWithRed:67.0f/255.0f green:174.0f/255.0f blue:247.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"QTUM"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:61.0f/255.0f green:154.0f/255.0f blue:208.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"BTG"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:246.0f/255.0f green:165.0f/255.0f blue:12.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"ICX"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:99.0f/255.0f green:212.0f/255.0f blue:216.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"XRB"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:74.0f/255.0f green:144.0f/255.0f blue:226.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"NANO"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:74.0f/255.0f green:144.0f/255.0f blue:226.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"ZEC"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:250.0f/255.0f green:207.0f/255.0f blue:84.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"PPT"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:0.0f/255.0f green:40.0f/255.0f blue:89.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"OMG"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:3.0f/255.0f green:40.0f/255.0f blue:148.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"ZCL"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:136.0f/255.0f green:74.0f/255.0f blue:30.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"STEEM"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:23.0f/255.0f green:31.0f/255.0f blue:36.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"BNB"] == NSOrderedSame) {
        //colorToReturn = [UIColor colorWithRed:19.0f/255.0f green:20.0f/255.0f blue:22.0f/255.0f alpha:1.0f];
        colorToReturn = [UIColor colorWithRed:243.0f/255.0f green:186.0f/255.0f blue:50.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"BCN"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:237.0f/255.0f green:65.0f/255.0f blue:145.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"SNT"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:93.0f/255.0f green:113.0f/255.0f blue:234.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"XVG"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:189.0f/255.0f green:190.0f/255.0f blue:191.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"STRAT"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:63.0f/255.0f green:161.0f/255.0f blue:225.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"SC"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:125.0f/255.0f green:243.0f/255.0f blue:134.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"BTS"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:32.0f/255.0f green:90.0f/255.0f blue:125.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"MKR"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:94.0f/255.0f green:191.0f/255.0f blue:160.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"AE"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:206.0f/255.0f green:63.0f/255.0f blue:109.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"REP"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:98.0f/255.0f green:32.0f/255.0f blue:82.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"WTC"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:12.0f/255.0f green:48.0f/255.0f blue:141.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"WAVES"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:1.0f/255.0f green:84.0f/255.0f blue:251.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"VERI"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:34.0f/255.0f green:34.0f/255.0f blue:34.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"ZRX"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:51.0f/255.0f green:51.0f/255.0f blue:51.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"DOGE"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:237.0f/255.0f green:212.0f/255.0f blue:135.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"DCR"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:165.0f/255.0f green:240.0f/255.0f blue:223.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"HSR"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:84.0f/255.0f green:69.0f/255.0f blue:139.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"DGD"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:31.0f/255.0f green:41.0f/255.0f blue:70.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"KCS"] == NSOrderedSame) {
        // Old color
        //colorToReturn = [UIColor colorWithRed:155.0f/255.0f green:197.0f/255.0f blue:220.0f/255.0f alpha:1.0f];
        // New MSFT blue
        colorToReturn = [UIColor colorWithRed:34.0f/255.0f green:125.0f/255.0f blue:251.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"SYS"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:43.0f/255.0f green:131.0f/255.0f blue:208.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"RHOC"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:205.0f/255.0f green:56.0f/255.0f blue:71.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"ARDR"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:58.0f/255.0f green:140.0f/255.0f blue:210.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"R"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:72.0f/255.0f green:40.0f/255.0f blue:120.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"KMD"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:94.0f/255.0f green:129.0f/255.0f blue:131.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"KNC"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:182.0f/255.0f green:222.0f/255.0f blue:205.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"GAS"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:174.0f/255.0f green:219.0f/255.0f blue:25.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"DRGN"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:53.0f/255.0f green:151.0f/255.0f blue:230.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"QASH"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:19.0f/255.0f green:72.0f/255.0f blue:232.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"ETN"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:11.0f/255.0f green:23.0f/255.0f blue:32.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"BAT"] == NSOrderedSame) {
        colorToReturn = [UIColor darkGrayColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"BTM"] == NSOrderedSame) {
        colorToReturn = [UIColor blackColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"ARK"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:233.0f/255.0f green:63.0f/255.0f blue:56.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"GNT"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:0.0f/255.0f green:31.0f/255.0f blue:87.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"ETHOS"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:102.0f/255.0f green:208.0f/255.0f blue:172.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"PIVX"] == NSOrderedSame) {
        colorToReturn = [UIColor blackColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"DGB"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:1.0f/255.0f green:35.0f/255.0f blue:81.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"CNX"] == NSOrderedSame) {
        colorToReturn = [UIColor grayColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"ZIL"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:70.0f/255.0f green:73.0f/255.0f blue:75.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"MONA"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:194.0f/255.0f green:103.0f/255.0f blue:77.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"FCT"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:64.0f/255.0f green:108.0f/255.0f blue:142.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"AION"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:92.0f/255.0f green:202.0f/255.0f blue:240.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"LRC"] == NSOrderedSame) {
        colorToReturn = [UIColor darkGrayColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"ELF"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:156.0f/255.0f green:75.0f/255.0f blue:222.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"GBYTE"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:44.0f/255.0f green:62.0f/255.0f blue:80.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"SALT"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:86.0f/255.0f green:167.0f/255.0f blue:97.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"NAS"] == NSOrderedSame) {
        colorToReturn = [UIColor blackColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"FUN"] == NSOrderedSame) {
        colorToReturn = [UIColor blackColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"PART"] == NSOrderedSame) {
        colorToReturn = [UIColor darkGrayColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"RDD"] == NSOrderedSame) {
        colorToReturn = [UIColor blackColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"DENT"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:174.0f/255.0f green:44.0f/255.0f blue:35.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"IOST"] == NSOrderedSame) {
        colorToReturn = [UIColor blackColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"GXS"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:0.0f/255.0f green:3.0f/255.0f blue:46.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"NEBL"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:52.0f/255.0f green:142.0f/255.0f blue:208.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"KIN"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:5.0f/255.0f green:57.0f/255.0f blue:187.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"XZC"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:94.0f/255.0f green:185.0f/255.0f blue:83.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"BLOCK"] == NSOrderedSame) {
        colorToReturn = [UIColor grayColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"POWR"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:91.0f/255.0f green:189.0f/255.0f blue:169.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"DCN"] == NSOrderedSame) {
        colorToReturn = [UIColor blackColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"ICN"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:69.0f/255.0f green:103.0f/255.0f blue:130.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"LINK"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:74.0f/255.0f green:122.0f/255.0f blue:171.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"POLY"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:42.0f/255.0f green:63.0f/255.0f blue:125.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"BNT"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:16.0f/255.0f green:38.0f/255.0f blue:68.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"NXT"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:68.0f/255.0f green:160.0f/255.0f blue:198.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"PAY"] == NSOrderedSame) {
        colorToReturn = [UIColor blackColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"ENG"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:18.0f/255.0f green:47.0f/255.0f blue:169.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"NXS"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:58.0f/255.0f green:164.0f/255.0f blue:251.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"REQ"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:35.0f/255.0f green:95.0f/255.0f blue:133.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"MAID"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:45.0f/255.0f green:57.0f/255.0f blue:71.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"CND"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:16.0f/255.0f green:3.0f/255.0f blue:20.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"EMC"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:175.0f/255.0f green:156.0f/255.0f blue:201.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"PLR"] == NSOrderedSame) {
        colorToReturn = [UIColor blackColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"AGI"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:66.0f/255.0f green:54.0f/255.0f blue:153.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"SMART"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:244.0f/255.0f green:181.0f/255.0f blue:50.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"SRN"] == NSOrderedSame) {
        colorToReturn = [UIColor blackColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"BTCP"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:44.0f/255.0f green:36.0f/255.0f blue:100.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"BCD"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:235.0f/255.0f green:182.0f/255.0f blue:17.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"ONT"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:0.0f/255.0f green:166.0f/255.0f blue:193.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"WAN"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:0.0f/255.0f green:189.0f/255.0f blue:240.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"XIN"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:56.0f/255.0f green:102.0f/255.0f blue:237.0f/255.0f alpha:1.0f];
    }
    
    return colorToReturn;
}

// Get the brand text color for given ticker
- (UIColor *)getBrandTextColorForCompany:(NSString *)ticker {
    
    //Default black color
    UIColor *colorToReturn = [UIColor blackColor];
    
    if ([ticker caseInsensitiveCompare:@"BTC"] == NSOrderedSame) {
        // White
        colorToReturn = [UIColor whiteColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"ETH"] == NSOrderedSame) {
        colorToReturn = [UIColor whiteColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"XRP"] == NSOrderedSame) {
        // Old
        //colorToReturn = [UIColor colorWithRed:71.0f/255.0f green:175.0f/255.0f blue:233.0f/255.0f alpha:1.0f];
        // New more in line with icon
        colorToReturn = [UIColor whiteColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"BCH"] == NSOrderedSame) {
        colorToReturn = [UIColor whiteColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"ADA"] == NSOrderedSame) {
        colorToReturn = [UIColor whiteColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"LTC"] == NSOrderedSame) {
        colorToReturn = [UIColor whiteColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"NEO"] == NSOrderedSame) {
        colorToReturn = [UIColor whiteColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"XLM"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:239.0f/255.0f green:136.0f/255.0f blue:51.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"EOS"] == NSOrderedSame) {
        //Old
        //colorToReturn = [UIColor colorWithRed:233.0f/255.0f green:173.0f/255.0f blue:101.0f/255.0f alpha:1.0f];
        // New
        colorToReturn = [UIColor whiteColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"MIOTA"] == NSOrderedSame) {
        //colorToReturn = [UIColor colorWithRed:81.0f/255.0f green:170.0f/255.0f blue:151.0f/255.0f alpha:1.0f];
        colorToReturn = [UIColor whiteColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"XEM"] == NSOrderedSame) {
        colorToReturn = [UIColor whiteColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"DASH"] == NSOrderedSame) {
        colorToReturn = [UIColor whiteColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"XMR"] == NSOrderedSame) {
        colorToReturn = [UIColor blackColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"LSK"] == NSOrderedSame) {
        colorToReturn = [UIColor whiteColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"TRX"] == NSOrderedSame) {
        //colorToReturn = [UIColor colorWithRed:120.0f/255.0f green:248.0f/255.0f blue:223.0f/255.0f alpha:1.0f];
        colorToReturn = [UIColor whiteColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"USDT"] == NSOrderedSame) {
        colorToReturn = [UIColor whiteColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"ETC"] == NSOrderedSame) {
        //colorToReturn = [UIColor colorWithRed:102.0f/255.0f green:144.0f/255.0f blue:115.0f/255.0f alpha:1.0f];
        // Better color for the detail view scheme. Upper one is the original
        //colorToReturn = [UIColor blackColor];
        colorToReturn = [UIColor whiteColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"VEN"] == NSOrderedSame) {
        colorToReturn = [UIColor whiteColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"QTUM"] == NSOrderedSame) {
        //colorToReturn = [UIColor blackColor];
        colorToReturn = [UIColor whiteColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"BTG"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:4.0f/255.0f green:35.0f/255.0f blue:112.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"ICX"] == NSOrderedSame) {
        //colorToReturn = [UIColor blackColor];
        colorToReturn = [UIColor whiteColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"XRB"] == NSOrderedSame) {
        colorToReturn = [UIColor whiteColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"NANO"] == NSOrderedSame) {
        colorToReturn = [UIColor whiteColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"ZEC"] == NSOrderedSame) {
        colorToReturn = [UIColor blackColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"PPT"] == NSOrderedSame) {
        colorToReturn = [UIColor whiteColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"OMG"] == NSOrderedSame) {
        colorToReturn = [UIColor whiteColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"ZCL"] == NSOrderedSame) {
        colorToReturn = [UIColor whiteColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"STEEM"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:75.0f/255.0f green:162.0f/255.0f blue:242.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"BNB"] == NSOrderedSame) {
        //colorToReturn = [UIColor colorWithRed:189.0f/255.0f green:157.0f/255.0f blue:108.0f/255.0f alpha:1.0f];
        colorToReturn = [UIColor whiteColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"BCN"] == NSOrderedSame) {
        colorToReturn = [UIColor whiteColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"SNT"] == NSOrderedSame) {
        colorToReturn = [UIColor whiteColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"XVG"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:64.0f/255.0f green:153.0f/255.0f blue:191.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"STRAT"] == NSOrderedSame) {
        colorToReturn = [UIColor whiteColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"SC"] == NSOrderedSame) {
        colorToReturn = [UIColor blackColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"BTS"] == NSOrderedSame) {
        colorToReturn = [UIColor whiteColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"MKR"] == NSOrderedSame) {
        colorToReturn = [UIColor blackColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"AE"] == NSOrderedSame) {
        colorToReturn = [UIColor whiteColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"REP"] == NSOrderedSame) {
        colorToReturn = [UIColor whiteColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"WTC"] == NSOrderedSame) {
        colorToReturn = [UIColor whiteColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"WAVES"] == NSOrderedSame) {
        colorToReturn = [UIColor whiteColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"VERI"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:241.0f/255.0f green:152.0f/255.0f blue:62.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"ZRX"] == NSOrderedSame) {
        colorToReturn = [UIColor whiteColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"DOGE"] == NSOrderedSame) {
        colorToReturn = [UIColor blackColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"DCR"] == NSOrderedSame) {
        colorToReturn = [UIColor blueColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"HSR"] == NSOrderedSame) {
        colorToReturn = [UIColor whiteColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"DGD"] == NSOrderedSame) {
        colorToReturn = [UIColor whiteColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"KCS"] == NSOrderedSame) {
        colorToReturn = [UIColor whiteColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"SYS"] == NSOrderedSame) {
        colorToReturn = [UIColor whiteColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"RHOC"] == NSOrderedSame) {
        colorToReturn = [UIColor whiteColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"ARDR"] == NSOrderedSame) {
        colorToReturn = [UIColor blackColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"R"] == NSOrderedSame) {
        colorToReturn = [UIColor whiteColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"KMD"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:246.0f/255.0f green:187.0f/255.0f blue:52.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"KNC"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:39.0f/255.0f green:93.0f/255.0f blue:101.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"GAS"] == NSOrderedSame) {
        colorToReturn = [UIColor blackColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"DRGN"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:202.0f/255.0f green:53.0f/255.0f blue:43.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"QASH"] == NSOrderedSame) {
        colorToReturn = [UIColor whiteColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"ETN"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:82.0f/255.0f green:189.0f/255.0f blue:225.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"BAT"] == NSOrderedSame) {
        colorToReturn = [UIColor orangeColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"BTM"] == NSOrderedSame) {
        colorToReturn = [UIColor grayColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"ARK"] == NSOrderedSame) {
        colorToReturn = [UIColor whiteColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"GNT"] == NSOrderedSame) {
        colorToReturn = [UIColor whiteColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"ETHOS"] == NSOrderedSame) {
        colorToReturn = [UIColor whiteColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"PIVX"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:119.0f/255.0f green:98.0f/255.0f blue:160.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"DGB"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:8.0f/255.0f green:102.0f/255.0f blue:204.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"CNX"] == NSOrderedSame) {
        colorToReturn = [UIColor blueColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"ZIL"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:90.0f/255.0f green:192.0f/255.0f blue:91.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"MONA"] == NSOrderedSame) {
        colorToReturn = [UIColor whiteColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"FCT"] == NSOrderedSame) {
        colorToReturn = [UIColor whiteColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"AION"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:27.0f/255.0f green:70.0f/255.0f blue:82.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"LRC"] == NSOrderedSame) {
        colorToReturn = [UIColor whiteColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"ELF"] == NSOrderedSame) {
        colorToReturn = [UIColor whiteColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"GBYTE"] == NSOrderedSame) {
        colorToReturn = [UIColor whiteColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"SALT"] == NSOrderedSame) {
        colorToReturn = [UIColor whiteColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"NAS"] == NSOrderedSame) {
        colorToReturn = [UIColor whiteColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"FUN"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:229.0f/255.0f green:70.0f/255.0f blue:132.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"PART"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:116.0f/255.0f green:233.0f/255.0f blue:177.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"RDD"] == NSOrderedSame) {
        colorToReturn = [UIColor redColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"DENT"] == NSOrderedSame) {
        colorToReturn = [UIColor whiteColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"IOST"] == NSOrderedSame) {
        colorToReturn = [UIColor whiteColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"GXS"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:102.0f/255.0f green:152.0f/255.0f blue:252.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"NEBL"] == NSOrderedSame) {
        colorToReturn = [UIColor whiteColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"KIN"] == NSOrderedSame) {
        colorToReturn = [UIColor whiteColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"XZC"] == NSOrderedSame) {
        colorToReturn = [UIColor whiteColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"BLOCK"] == NSOrderedSame) {
        colorToReturn = [UIColor blackColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"POWR"] == NSOrderedSame) {
        colorToReturn = [UIColor whiteColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"DCN"] == NSOrderedSame) {
        colorToReturn = [UIColor whiteColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"ICN"] == NSOrderedSame) {
        colorToReturn = [UIColor whiteColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"LINK"] == NSOrderedSame) {
        colorToReturn = [UIColor whiteColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"POLY"] == NSOrderedSame) {
        colorToReturn = [UIColor whiteColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"BNT"] == NSOrderedSame) {
        colorToReturn = [UIColor whiteColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"NXT"] == NSOrderedSame) {
        colorToReturn = [UIColor whiteColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"PAY"] == NSOrderedSame) {
        colorToReturn = [UIColor whiteColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"ENG"] == NSOrderedSame) {
        colorToReturn = [UIColor whiteColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"NXS"] == NSOrderedSame) {
        colorToReturn = [UIColor blackColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"REQ"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:122.0f/255.0f green:247.0f/255.0f blue:205.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"MAID"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:153.0f/255.0f green:190.0f/255.0f blue:231.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"CND"] == NSOrderedSame) {
        colorToReturn = [UIColor whiteColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"EMC"] == NSOrderedSame) {
        colorToReturn = [UIColor whiteColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"PLR"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:79.0f/255.0f green:191.0f/255.0f blue:251.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"AGI"] == NSOrderedSame) {
        colorToReturn = [UIColor whiteColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"SMART"] == NSOrderedSame) {
        colorToReturn = [UIColor blackColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"SRN"] == NSOrderedSame) {
        colorToReturn = [UIColor whiteColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"BTCP"] == NSOrderedSame) {
        colorToReturn = [UIColor whiteColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"BCD"] == NSOrderedSame) {
        colorToReturn = [UIColor whiteColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"ONT"] == NSOrderedSame) {
        colorToReturn = [UIColor whiteColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"WAN"] == NSOrderedSame) {
        colorToReturn = [UIColor whiteColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"XIN"] == NSOrderedSame) {
        colorToReturn = [UIColor whiteColor];
    }
    
    return colorToReturn;
}

// Does small icon Exist
- (BOOL)doesSmallIconExist:(NSString *)ticker
{
    BOOL iconExists = NO;
    
    if ([ticker caseInsensitiveCompare:@"BTC"] == NSOrderedSame) {
        iconExists = YES;
    }
    else if ([ticker caseInsensitiveCompare:@"ETH"] == NSOrderedSame) {
        iconExists = YES;
    }
    else if ([ticker caseInsensitiveCompare:@"XRP"] == NSOrderedSame) {
        iconExists = YES;
    }
    else if ([ticker caseInsensitiveCompare:@"XMR"] == NSOrderedSame) {
        iconExists = YES;
    }
    else if ([ticker caseInsensitiveCompare:@"BCH"] == NSOrderedSame) {
        iconExists = YES;
    }
    else if ([ticker caseInsensitiveCompare:@"ADA"] == NSOrderedSame) {
        iconExists = YES;
    }
    else if ([ticker caseInsensitiveCompare:@"LTC"] == NSOrderedSame) {
        iconExists = YES;
    }
    else if ([ticker caseInsensitiveCompare:@"EOS"] == NSOrderedSame) {
        iconExists = YES;
    }
    else if ([ticker caseInsensitiveCompare:@"NEO"] == NSOrderedSame) {
        iconExists = YES;
    }
    else if ([ticker caseInsensitiveCompare:@"XLM"] == NSOrderedSame) {
        iconExists = YES;
    }
    else if ([ticker caseInsensitiveCompare:@"MIOTA"] == NSOrderedSame) {
        iconExists = YES;
    }
    else if ([ticker caseInsensitiveCompare:@"DASH"] == NSOrderedSame) {
        iconExists = YES;
    }
    else if ([ticker caseInsensitiveCompare:@"XEM"] == NSOrderedSame) {
        iconExists = YES;
    }
    else if ([ticker caseInsensitiveCompare:@"TRX"] == NSOrderedSame) {
        iconExists = YES;
    }
    else if ([ticker caseInsensitiveCompare:@"USDT"] == NSOrderedSame) {
        iconExists = YES;
    }
    else if ([ticker caseInsensitiveCompare:@"ETC"] == NSOrderedSame) {
        iconExists = YES;
    }
    else if ([ticker caseInsensitiveCompare:@"VEN"] == NSOrderedSame) {
        iconExists = YES;
    }
    else if ([ticker caseInsensitiveCompare:@"QTUM"] == NSOrderedSame) {
        iconExists = YES;
    }
    else if ([ticker caseInsensitiveCompare:@"ICX"] == NSOrderedSame) {
        iconExists = YES;
    }
    else if ([ticker caseInsensitiveCompare:@"LSK"] == NSOrderedSame) {
        iconExists = YES;
    }
    else if ([ticker caseInsensitiveCompare:@"BNB"] == NSOrderedSame) {
        iconExists = YES;
    }
    else if ([ticker caseInsensitiveCompare:@"BTCP"] == NSOrderedSame) {
        iconExists = YES;
    }
    else if ([ticker caseInsensitiveCompare:@"BCD"] == NSOrderedSame) {
        iconExists = YES;
    }
    else if ([ticker caseInsensitiveCompare:@"ONT"] == NSOrderedSame) {
        iconExists = YES;
    }
    else if ([ticker caseInsensitiveCompare:@"OMG"] == NSOrderedSame) {
        iconExists = YES;
    }
    else if ([ticker caseInsensitiveCompare:@"BTG"] == NSOrderedSame) {
        iconExists = YES;
    }
    else if ([ticker caseInsensitiveCompare:@"WAN"] == NSOrderedSame) {
        iconExists = YES;
    }
    else if ([ticker caseInsensitiveCompare:@"XIN"] == NSOrderedSame) {
        iconExists = YES;
    }
    
    return iconExists;
}

// Get the small icon as a background color
- (UIColor *)getSmallIconAsBkgrndColorForCompany:(NSString *)ticker {
    
    //Default Darkish whitish gray
    UIColor *colorToReturn = [UIColor colorWithRed:177.0f/255.0f green:177.0f/255.0f blue:177.0f/255.0f alpha:1.0f];
    NSString *imageSetName = [NSString stringWithFormat:@"%@Label",ticker];
    
    colorToReturn = [UIColor colorWithPatternImage:[UIImage imageNamed:imageSetName]];
    
    return colorToReturn;
}

// Get the regular news icon based on keyword and desc
- (UIColor *)getNewsImageWithKeyword:(NSString *)keyword andDescription:(NSString *)desc {
    
    //Default Darkish whitish gray
    UIColor *colorToReturn = [UIColor colorWithRed:177.0f/255.0f green:177.0f/255.0f blue:177.0f/255.0f alpha:1.0f];
    NSString *imageSetName = nil;
    
    // Get a random number between 1 and 5
    /*int lowerB = 1;
    int upperB = 3;
    int rndVal = lowerB + arc4random() % (upperB - lowerB);
    NSString *rndStr = [NSString stringWithFormat:@"%d",rndVal];
    
    NSLog(@"The random number for regular news is %@:",rndStr); */
    
    // First set the source icons as default
    if ([keyword caseInsensitiveCompare:@"Cointelegraph"] == NSOrderedSame) {
        imageSetName = @"CTNews";
    }
    else if ([keyword caseInsensitiveCompare:@"CCN"] == NSOrderedSame){
        imageSetName = @"CCNNews";
    }
    else if ([keyword caseInsensitiveCompare:@"Bitcoinist"] == NSOrderedSame){
        imageSetName = @"BitcoinistNews";
    }
    else if ([keyword caseInsensitiveCompare:@"Bitcoin Warrior"] == NSOrderedSame){
        imageSetName = @"BitWarNews";
    }
    else {
        imageSetName = [NSString stringWithFormat:@"EditorNews"];
    }
    
    // Next add special images based on desc
    if ([desc containsString:@"Bitcoin"]) {
        imageSetName = @"BTCNews1";
    }
    if ([desc localizedCaseInsensitiveContainsString:@"Blockchain"]) {
        imageSetName = @"BTCNews2";
    }
    if ([desc localizedCaseInsensitiveContainsString:@"Ethereum"]||[desc localizedCaseInsensitiveContainsString:@"Ether"]) {
        imageSetName = @"EthNews";
    }
    if ([desc localizedCaseInsensitiveContainsString:@"Ripple"]||[desc localizedCaseInsensitiveContainsString:@"XRP"]) {
        imageSetName = @"RippleNews";
    }
    if ([desc localizedCaseInsensitiveContainsString:@"Bank"]||[desc localizedCaseInsensitiveContainsString:@"Banks"]) {
        imageSetName = @"BanksNews";
    }
    if ([desc localizedCaseInsensitiveContainsString:@"Trade"]||[desc localizedCaseInsensitiveContainsString:@"Trader"]||[desc localizedCaseInsensitiveContainsString:@"Trading"]) {
        imageSetName = @"WallStNews";
    }
    if ([desc localizedCaseInsensitiveContainsString:@"Fundstrat"]||[desc localizedCaseInsensitiveContainsString:@"Tom Lee"]) {
        imageSetName = @"TomLeeNews";
    }
    if ([desc localizedCaseInsensitiveContainsString:@"Novogratz"]||[desc localizedCaseInsensitiveContainsString:@"Galaxy Digital"]) {
        imageSetName = @"NovogratzNews";
    }
    if ([desc localizedCaseInsensitiveContainsString:@"EOS"]||[desc localizedCaseInsensitiveContainsString:@"Larimer"]) {
        imageSetName = @"EosNews";
    }
    
    // For Editor's pick always use the editor image
    if ([keyword caseInsensitiveCompare:@"Editor's Pick"] == NSOrderedSame){
        imageSetName = @"EditorNews";
    }
    
    colorToReturn = [UIColor colorWithPatternImage:[UIImage imageNamed:imageSetName]];
    
    return colorToReturn;
}

// Get the small news icon based on keyword and desc
- (UIColor *)getSmallNewsImageWithKeyword:(NSString *)keyword andDescription:(NSString *)desc {
    
    //Default Darkish whitish gray
    UIColor *colorToReturn = [UIColor colorWithRed:177.0f/255.0f green:177.0f/255.0f blue:177.0f/255.0f alpha:1.0f];
    NSString *imageSetName = nil;
    
    // Get a random number between 1 and 5
   /* int lowerB = 1;
    int upperB = 3;
    int rndVal = lowerB + arc4random() % (upperB - lowerB);
    NSString *rndStr = [NSString stringWithFormat:@"%d",rndVal];
    
    NSLog(@"The random number for small news is %@:",rndStr);*/
    
    // First set the source icons as default
    if ([keyword caseInsensitiveCompare:@"Cointelegraph"] == NSOrderedSame) {
        imageSetName = @"CTNewsSmall";
    }
    else if ([keyword caseInsensitiveCompare:@"CCN"] == NSOrderedSame){
        imageSetName = @"CCNNewsSmall";
    }
    else if ([keyword caseInsensitiveCompare:@"Bitcoinist"] == NSOrderedSame){
        imageSetName = @"BitcoinistNewsSmall";
    }
    else if ([keyword caseInsensitiveCompare:@"Bitcoin Warrior"] == NSOrderedSame){
        imageSetName = @"BitWarNewsSmall";
    }
    else {
        imageSetName = [NSString stringWithFormat:@"EditorNewsSmall"];
    }
    
    // Next add special images based on desc
    if ([desc containsString:@"Bitcoin"]) {
        imageSetName = @"BTCNewsSmall1";
    }
    if ([desc localizedCaseInsensitiveContainsString:@"Blockchain"]) {
        imageSetName = @"BTCNewsSmall2";
    }
    if ([desc localizedCaseInsensitiveContainsString:@"Ethereum"]||[desc localizedCaseInsensitiveContainsString:@"Eth"]||[desc localizedCaseInsensitiveContainsString:@"Ether"]) {
        imageSetName = @"EthNewsSmall";
    }
    if ([desc localizedCaseInsensitiveContainsString:@"Ripple"]||[desc localizedCaseInsensitiveContainsString:@"XRP"]) {
        imageSetName = @"RippleNewsSmall";
    }
    if ([desc localizedCaseInsensitiveContainsString:@"Bank"]||[desc localizedCaseInsensitiveContainsString:@"Banks"]) {
        imageSetName = @"BanksNewsSmall";
    }
    if ([desc localizedCaseInsensitiveContainsString:@"Trade"]||[desc localizedCaseInsensitiveContainsString:@"Trader"]||[desc localizedCaseInsensitiveContainsString:@"Trading"]) {
        imageSetName = @"WallStNewsSmall";
    }
    if ([desc localizedCaseInsensitiveContainsString:@"Fundstrat"]||[desc localizedCaseInsensitiveContainsString:@"Tom Lee"]) {
        imageSetName = @"TomLeeNewsSmall";
    }
    if ([desc localizedCaseInsensitiveContainsString:@"Novogratz"]||[desc localizedCaseInsensitiveContainsString:@"Galaxy Digital"]) {
        imageSetName = @"NovogratzNewsSmall";
    }
    if ([desc localizedCaseInsensitiveContainsString:@"EOS"]||[desc localizedCaseInsensitiveContainsString:@"Larimer"]) {
        imageSetName = @"EosNewsSmall";
    }
    
    // For Editor's pick always use the editor image
    if ([keyword caseInsensitiveCompare:@"Editor's Pick"] == NSOrderedSame){
        imageSetName = @"EditorNews";
    }
    
    // For Editor's pick always use the editor image
    if ([keyword caseInsensitiveCompare:@"Editor's Pick"] == NSOrderedSame){
        imageSetName = @"EditorNewsSmall";
    }
    
    colorToReturn = [UIColor colorWithPatternImage:[UIImage imageNamed:imageSetName]];
    
    return colorToReturn;
}

// Get the event source based on the event type.
- (NSString *)getNewsSource:(Event *)rawEvent
{
    NSString *learnMoreURL = rawEvent.relatedDetails;
    NSString *newsSrc = @"Other";
    
    // For news event, strip out the cryptofinews:: from the beginning
    if ([learnMoreURL containsString:@"cointelegraph.com"]) {
        newsSrc = @"Cointelegraph";
    }
    else if ([learnMoreURL containsString:@"ccn.com"]){
        newsSrc = @"CCN";
    }
    else if ([learnMoreURL containsString:@"bitcoinist.com"]){
        newsSrc = @"Bitcoinist";
    }
    else if ([learnMoreURL containsString:@"bitcoinwarrior.net"]){
        newsSrc = @"Bitcoin Warrior";
    }
    else if ([learnMoreURL containsString:@"ambcrypto.com"]){
        newsSrc = @"Amb Crypto";
    }
    else {
        newsSrc = @"Editor's Pick";
    }
    
    return newsSrc;
}

// Get formatted news source strings
- (NSMutableAttributedString *)getFormattedSource:(NSString *)src {
    
    NSMutableAttributedString *formattedTxt = nil;
    NSDictionary *txtAttributes = nil;
    
    // Default formatting in gray
     txtAttributes = @{
     NSForegroundColorAttributeName:[UIColor colorWithRed:113.0f/255.0f green:113.0f/255.0f blue:113.0f/255.0f alpha:1.0f],
     NSFontAttributeName:[UIFont fontWithName:@"Helvetica" size:13]
     };
     formattedTxt = [[NSMutableAttributedString alloc] initWithString:src attributes:txtAttributes];
    
    // Default formatting in black
    /*txtAttributes = @{
                      NSForegroundColorAttributeName:[UIColor blackColor],
                      NSFontAttributeName:[UIFont fontWithName:@"Helvetica-Bold" size:13]
                      };
    formattedTxt = [[NSMutableAttributedString alloc] initWithString:src attributes:txtAttributes];*/
    
    if ([src caseInsensitiveCompare:@"Cointelegraph"] == NSOrderedSame) {
        // Alternate color is 255,137,0
       /* txtAttributes = @{
                          NSForegroundColorAttributeName:[UIColor colorWithRed:49.0f/255.0f green:70.0f/255.0f blue:80.0f/255.0f alpha:1.0f],
                          NSFontAttributeName:[UIFont fontWithName:@"Helvetica-Bold" size:13]
                          };*/
        formattedTxt = [[NSMutableAttributedString alloc] initWithString:src attributes:txtAttributes];
    }
    else if ([src caseInsensitiveCompare:@"CCN"] == NSOrderedSame) {
       /* txtAttributes = @{
                          NSForegroundColorAttributeName:[UIColor colorWithRed:255.0f/255.0f green:101.0f/255.0f blue:51.0f/255.0f alpha:1.0f],
                          NSFontAttributeName:[UIFont fontWithName:@"Helvetica-Bold" size:13]
                          };*/
        formattedTxt = [[NSMutableAttributedString alloc] initWithString:src attributes:txtAttributes];
    }
    else if ([src caseInsensitiveCompare:@"Bitcoinist"] == NSOrderedSame) {
        /*txtAttributes = @{
                          NSForegroundColorAttributeName:[UIColor colorWithRed:48.0f/255.0f green:153.0f/255.0f blue:251.0f/255.0f alpha:1.0f],
                          NSFontAttributeName:[UIFont fontWithName:@"Helvetica-Bold" size:13]
                          };*/
        formattedTxt = [[NSMutableAttributedString alloc] initWithString:src attributes:txtAttributes];
    }
    else if ([src caseInsensitiveCompare:@"Bitcoin Warrior"] == NSOrderedSame) {
        /*txtAttributes = @{
                          NSForegroundColorAttributeName:[UIColor colorWithRed:35.0f/255.0f green:92.0f/255.0f blue:165.0f/255.0f alpha:1.0f],
                          NSFontAttributeName:[UIFont fontWithName:@"Helvetica-Bold" size:13]
                          };*/
        formattedTxt = [[NSMutableAttributedString alloc] initWithString:src attributes:txtAttributes];
    }
    else if ([src caseInsensitiveCompare:@"Amb Crypto"] == NSOrderedSame) {
        /*txtAttributes = @{
                          NSForegroundColorAttributeName:[UIColor colorWithRed:233.0f/255.0f green:67.0f/255.0f blue:97.0f/255.0f alpha:1.0f],
                          NSFontAttributeName:[UIFont fontWithName:@"Helvetica-Bold" size:13]
                          };*/
        formattedTxt = [[NSMutableAttributedString alloc] initWithString:src attributes:txtAttributes];
    }
    else if ([src caseInsensitiveCompare:@"Editor's Pick"] == NSOrderedSame) {
       /* txtAttributes = @{
                          NSForegroundColorAttributeName:[UIColor colorWithRed:226.0f/255.0f green:35.0f/255.0f blue:95.0f/255.0f alpha:1.0f],
                          NSFontAttributeName:[UIFont fontWithName:@"Helvetica-Bold" size:13]
                          };*/
        formattedTxt = [[NSMutableAttributedString alloc] initWithString:src attributes:txtAttributes];
    }
    else {
        txtAttributes = @{
                          NSForegroundColorAttributeName:[UIColor colorWithRed:113.0f/255.0f green:113.0f/255.0f blue:113.0f/255.0f alpha:1.0f],
                          NSFontAttributeName:[UIFont fontWithName:@"Helvetica" size:13]
                          };
        formattedTxt = [[NSMutableAttributedString alloc] initWithString:src attributes:txtAttributes];
    }
    
    return formattedTxt;
}

// Get formatted title of learning article based on learning type
- (NSMutableAttributedString *)getFormattedLearningTitle:(NSIndexPath *)rowPath ofType:(NSInteger)typeDesc {
    
    NSMutableAttributedString *formattedTxt = nil;
    NSDictionary *txtAttributes = nil;
    NSInteger rowNo = (rowPath.row + 1);
    
    
    // [NEW WORK 2021] Setting the title for learning videos to match the specified sizes in the storyboard.
    // Black color
    txtAttributes = @{
                      NSForegroundColorAttributeName:[UIColor blackColor],
                      NSFontAttributeName:[UIFont fontWithName:@"Helvetica-Bold" size:16]
                      };
    
    // [NEW WORK 2021] Setting the titles based on type selected.
    if (typeDesc == 0) {
        if (rowNo == 1) {
            formattedTxt = [[NSMutableAttributedString alloc] initWithString:@"Hi" attributes:txtAttributes];
        }
        else if (rowNo == 2) {
            formattedTxt = [[NSMutableAttributedString alloc] initWithString:@"Blockchain Basics" attributes:txtAttributes];
        }
        else if (rowNo == 3) {
            formattedTxt = [[NSMutableAttributedString alloc] initWithString:@"Blockchain Mechanics" attributes:txtAttributes];
        }
        else if (rowNo == 4) {
            formattedTxt = [[NSMutableAttributedString alloc] initWithString:@"Bitcoin Basics" attributes:txtAttributes];
        }
        else if (rowNo == 5) {
            formattedTxt = [[NSMutableAttributedString alloc] initWithString:@"Ethereum Basics" attributes:txtAttributes];
        }
        else if (rowNo == 6) {
            formattedTxt = [[NSMutableAttributedString alloc] initWithString:@"All" attributes:txtAttributes];
        }
        else if (rowNo == 7) {
            formattedTxt = [[NSMutableAttributedString alloc] initWithString:@"Contact" attributes:txtAttributes];
        }
        else {
            formattedTxt = [[NSMutableAttributedString alloc] initWithString:@"NA" attributes:txtAttributes];
        }
    }
    else if (typeDesc == 1) {
        if (rowNo == 1) {
            formattedTxt = [[NSMutableAttributedString alloc] initWithString:@"Crypto Types" attributes:txtAttributes];
        }
        else if (rowNo == 2) {
            formattedTxt = [[NSMutableAttributedString alloc] initWithString:@"Cryptonomics" attributes:txtAttributes];
        }
        else if (rowNo == 3) {
            formattedTxt = [[NSMutableAttributedString alloc] initWithString:@"DeFi" attributes:txtAttributes];
        }
        else if (rowNo == 4) {
            formattedTxt = [[NSMutableAttributedString alloc] initWithString:@"NFT" attributes:txtAttributes];
        }
        else if (rowNo == 5) {
            formattedTxt = [[NSMutableAttributedString alloc] initWithString:@"Solana" attributes:txtAttributes];
        }
        else if (rowNo == 6) {
            formattedTxt = [[NSMutableAttributedString alloc] initWithString:@"All" attributes:txtAttributes];
        }
        else if (rowNo == 7) {
            formattedTxt = [[NSMutableAttributedString alloc] initWithString:@"Contact" attributes:txtAttributes];
        }
        else {
            formattedTxt = [[NSMutableAttributedString alloc] initWithString:@"NA" attributes:txtAttributes];
        }
    }
    else if (typeDesc == 2) {
        if (rowNo == 1) {
            formattedTxt = [[NSMutableAttributedString alloc] initWithString:@"Cointelegraph" attributes:txtAttributes];
        }
        else if (rowNo == 2) {
            formattedTxt = [[NSMutableAttributedString alloc] initWithString:@"CNBC, Bitcoin" attributes:txtAttributes];
        }
        else if (rowNo == 3) {
            formattedTxt = [[NSMutableAttributedString alloc] initWithString:@"Gary Gensler, SEC Chair" attributes:txtAttributes];
        }
        else if (rowNo == 4) {
            formattedTxt = [[NSMutableAttributedString alloc] initWithString:@"Jerry Brito, Coin Center" attributes:txtAttributes];
        }
        else if (rowNo == 5) {
            formattedTxt = [[NSMutableAttributedString alloc] initWithString:@"Reddit, CryptoCurrency" attributes:txtAttributes];
        }
        else if (rowNo == 6) {
            formattedTxt = [[NSMutableAttributedString alloc] initWithString:@"Jake Chervinsky, Compound" attributes:txtAttributes];
        }
        else if (rowNo == 7) {
            formattedTxt = [[NSMutableAttributedString alloc] initWithString:@"Epicenter" attributes:txtAttributes];
        }
        else {
            formattedTxt = [[NSMutableAttributedString alloc] initWithString:@"NA" attributes:txtAttributes];
        }
    }
    else {
        formattedTxt = [[NSMutableAttributedString alloc] initWithString:@"NA" attributes:txtAttributes];
    }
    
    return formattedTxt;
}

// Get sub title of learning article based on type of learning
- (NSString *)getLearningDescription:(NSIndexPath *)rowPath ofType:(NSInteger)typeDesc {
    
    NSString *formattedTxt = nil;
    NSInteger rowNo = (rowPath.row + 1);
    
    // [NEW WORK 2021] Setting the sub titles based on type of learning
    if (typeDesc == 0) {
        if (rowNo == 1) {
            formattedTxt = @"Introduction.";
        }
        else if (rowNo == 2) {
            formattedTxt = @"The crypto foundation.";
        }
        else if (rowNo == 3) {
            formattedTxt = @"By Anders Brownworth.";
        }
        else if (rowNo == 4) {
            formattedTxt = @"The game changer.";
        }
        else if (rowNo == 5) {
            formattedTxt = @"The brilliant platform.";
        }
        else if (rowNo == 6) {
            formattedTxt = @"View all as a presentation.";
        }
        else if (rowNo == 7) {
            formattedTxt = @"Comments? Write to us.";
        }
        else {
            formattedTxt = @"Hmm! Nothing here.";
        }
    }
    else if (typeDesc == 1) {
        if (rowNo == 1) {
            formattedTxt = @"Categorizing all cryptos.";
        }
        else if (rowNo == 2) {
            formattedTxt = @"What gives crypto value?";
        }
        else if (rowNo == 3) {
            formattedTxt = @"Decentralized Finance overview.";
        }
        else if (rowNo == 4) {
            formattedTxt = @"Non Fungible Tokens explained.";
            
        }
        else if (rowNo == 5) {
            formattedTxt = @"The Ethereum challenger.";
            
        }
        else if (rowNo == 6) {
            formattedTxt = @"View all as a presentation.";
        }
        else if (rowNo == 7) {
            formattedTxt = @"Comments? Write to us.";
        }
        else {
            formattedTxt = @"Hmm! Nothing here.";
        }
    }
    else if (typeDesc == 2) {
        if (rowNo == 1) {
            formattedTxt = @"Read news.";
        }
        else if (rowNo == 2) {
            formattedTxt = @"Read news.";
        }
        else if (rowNo == 3) {
            formattedTxt = @"See tweets.";
        }
        else if (rowNo == 4) {
            formattedTxt = @"See tweets.";
        }
        else if (rowNo == 5) {
            formattedTxt = @"See messages.";
        }
        else if (rowNo == 6) {
            formattedTxt = @"See tweets.";
        }
        else if (rowNo == 7) {
            formattedTxt = @"Listen to podcast.";
        }
        else {
            formattedTxt = @"Hmm! Nothing here.";
        }
    }
    else {
        formattedTxt = @"Hmm! Nothing here.";
    }
    
    return formattedTxt;
}

// Get URL of learning article based on type of learning
- (NSString *)getLearningURL:(NSIndexPath *)rowPath ofType:(NSInteger)typeDesc {
    
    NSString *externalURLStr = nil;
    NSInteger rowNo = (rowPath.row + 1);
    
    // [NEW WORK 2021] Setting the learning article URL based on type of learning
    if (typeDesc == 0) {
        if (rowNo == 1) {
            externalURLStr = @"https://youtu.be/GYQNNfDs_bk";
        }
        else if (rowNo == 2) {
            externalURLStr = @"https://youtu.be/Q32NcEH_uHM";
        }
        else if (rowNo == 3) {
            externalURLStr = @"https://youtu.be/_160oMzblY8";
        }
        else if (rowNo == 4) {
            externalURLStr = @"https://youtu.be/gfZEVGN_KlY";
        }
        else if (rowNo == 5) {
            externalURLStr = @"https://youtu.be/_Y71wrngQ3k";
        }
        else if (rowNo == 6) {
            externalURLStr = @"https://docs.google.com/presentation/d/1csWbrHybgL8I8a76c8AfgBMmL8NcTB1TGuFzwCEJS6Y";
        }
        else if (rowNo == 7) {
            externalURLStr = @"https://sidd37.wixsite.com/website-1";
        }
        else {
            externalURLStr = @"https://sidd37.wixsite.com/website-1";
        }
    }
    else if (typeDesc == 1) {
        if (rowNo == 1) {
            externalURLStr = @"https://youtu.be/ASl0Um1FcuE";
        }
        else if (rowNo == 2) {
            externalURLStr = @"https://youtu.be/1olbtC2djy4";
        }
        else if (rowNo == 3) {
            externalURLStr = @"https://youtu.be/HpNFgFgpo04";
        }
        else if (rowNo == 4) {
            externalURLStr = @"https://youtu.be/CsMsnflDQ0E";
        }
        else if (rowNo == 5) {
            externalURLStr = @"https://youtu.be/fal3dnelLpM";
        }
        else if (rowNo == 6) {
            externalURLStr = @"https://docs.google.com/presentation/d/1OQfm76x7fENczyQL1d0SuublNlHQUMDvyozItixQnLk";
        }
        else if (rowNo == 7) {
            externalURLStr = @"https://sidd37.wixsite.com/website-1";
        }
        else {
            externalURLStr = @"https://sidd37.wixsite.com/website-1";
        }
    }
    else if (typeDesc == 2) {
        if (rowNo == 1) {
            externalURLStr = @"https://cointelegraph.com";
        }
        else if (rowNo == 2) {
            externalURLStr = @"https://www.cnbc.com/bitcoin/";
        }
        else if (rowNo == 3) {
            externalURLStr = @"https://twitter.com/GaryGensler";
        }
        else if (rowNo == 4) {
            externalURLStr = @"https://twitter.com/jerrybrito";
        }
        else if (rowNo == 5) {
            externalURLStr = @"https://www.reddit.com/r/CryptoCurrency/";
        }
        else if (rowNo == 6) {
            externalURLStr = @"https://twitter.com/jchervinsky";
        }
        else if (rowNo == 7) {
            externalURLStr = @"https://podcasts.apple.com/us/podcast/epicenter-learn-about-crypto-blockchain-ethereum-bitcoin/id792338939?mt=2";
        }
        else {
            externalURLStr = @"https://sidd37.wixsite.com/website-1";
        }
    }
    else {
        externalURLStr = @"https://sidd37.wixsite.com/website-1";
    }
    
    return externalURLStr;
}

// Get the learning item color
- (UIColor *)getLearningItemColor:(NSIndexPath *)rowPath ofType:(NSInteger)typeDesc {
    
    //Default black color
    UIColor *colorToReturn = [UIColor whiteColor];
    
    NSInteger rowNo = (rowPath.row + 1);
    
    //NEW FOR 2021: Images for Learning articles
    
    if (typeDesc == 0) {
        if (rowNo == 1) {
            colorToReturn = [UIColor colorWithPatternImage:[UIImage imageNamed:@"PinkRedPlay"]];
        }
        else if (rowNo == 2) {
            colorToReturn = [UIColor colorWithPatternImage:[UIImage imageNamed:@"BlockBluePlay"]];
        }
        else if (rowNo == 3) {
            colorToReturn = [UIColor colorWithPatternImage:[UIImage imageNamed:@"MechanicsPlay"]];
        }
        else if (rowNo == 4) {
            colorToReturn = [UIColor colorWithPatternImage:[UIImage imageNamed:@"BtcYellowPlay"]];
        }
        else if (rowNo == 5) {
            colorToReturn = [UIColor colorWithPatternImage:[UIImage imageNamed:@"EthVioletPlay"]];
        }
        else if (rowNo == 6) {
            colorToReturn = [UIColor colorWithPatternImage:[UIImage imageNamed:@"UpGreenPlay"]];
        }
        else if (rowNo == 7) {
            colorToReturn = [UIColor colorWithPatternImage:[UIImage imageNamed:@"BlackSupport"]];
        }
        else {
            colorToReturn = [UIColor whiteColor];
        }
    }
    else if (typeDesc == 1) {
        if (rowNo == 1) {
            colorToReturn = [UIColor colorWithPatternImage:[UIImage imageNamed:@"FoundBrickPlay"]];
        }
        else if (rowNo == 2) {
            colorToReturn = [UIColor colorWithPatternImage:[UIImage imageNamed:@"CbBluePlay"]];
        }
        else if (rowNo == 3) {
            colorToReturn = [UIColor colorWithPatternImage:[UIImage imageNamed:@"DefiIntro"]];
        }
        else if (rowNo == 4) {
            colorToReturn = [UIColor colorWithPatternImage:[UIImage imageNamed:@"NftIntro"]];
            
        }
        else if (rowNo == 5) {
            colorToReturn = [UIColor colorWithPatternImage:[UIImage imageNamed:@"SolanaOverview"]];
            
        }
        else if (rowNo == 6) {
            colorToReturn = [UIColor colorWithPatternImage:[UIImage imageNamed:@"UpGreenPlay"]];
        }
        else if (rowNo == 7) {
            colorToReturn = [UIColor colorWithPatternImage:[UIImage imageNamed:@"BlackSupport"]];
        }
        else {
            colorToReturn = [UIColor whiteColor];
        }
    }
    else if (typeDesc == 2) {
        if (rowNo == 1) {
            colorToReturn = [UIColor colorWithPatternImage:[UIImage imageNamed:@"DailyNews"]];
        }
        else if (rowNo == 2) {
            colorToReturn = [UIColor colorWithPatternImage:[UIImage imageNamed:@"MainstreamNews"]];
        }
        else if (rowNo == 3) {
            colorToReturn = [UIColor colorWithPatternImage:[UIImage imageNamed:@"RegUpdates"]];
        }
        else if (rowNo == 4) {
            colorToReturn = [UIColor colorWithPatternImage:[UIImage imageNamed:@"RegUpdates"]];
        }
        else if (rowNo == 5) {
            colorToReturn = [UIColor colorWithPatternImage:[UIImage imageNamed:@"CommUpdates"]];
        }
        else if (rowNo == 6) {
            colorToReturn = [UIColor colorWithPatternImage:[UIImage imageNamed:@"DefiUpdates"]];
        }
        else if (rowNo == 7) {
            colorToReturn = [UIColor colorWithPatternImage:[UIImage imageNamed:@"IndepthConvo"]];
        }
        else {
            colorToReturn = [UIColor whiteColor];
        }
    }
    else {
        colorToReturn = [UIColor whiteColor];
    }
    
    return colorToReturn;
}

// Get the length of the video string
- (NSString *)getVideoLength:(NSIndexPath *)rowPath {
    
    NSString *externalURLStr = nil;
    NSInteger rowNo = (rowPath.row + 1);
    
    if (rowNo == 1) {
        externalURLStr = @"1:12";
    }
    else if (rowNo == 2) {
        externalURLStr = @"2:08";
    }
    else if (rowNo == 3) {
        externalURLStr = @"17:50";
    }
    else if (rowNo == 4) {
        externalURLStr = @"5:36";
    }
    else if (rowNo == 5) {
        externalURLStr = @"3:44";
    }
    else if (rowNo == 6) {
        externalURLStr = @"1:30";
    }
    else if (rowNo == 7) {
        externalURLStr = @"3:45";
    }
    else if (rowNo == 8) {
        externalURLStr = @"";
    }
    else if (rowNo == 9) {
        externalURLStr = @"";
    }
    else {
        externalURLStr = @"";
    }
    
    return externalURLStr;
}

@end
