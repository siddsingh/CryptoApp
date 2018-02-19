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
        colorToReturn = [UIColor colorWithRed:16.0f/255.0f green:43.0f/255.0f blue:62.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"BCH"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:81.0f/255.0f green:157.0f/255.0f blue:11.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"ADA"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:33.0f/255.0f green:110.0f/255.0f blue:216.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"LTC"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:63.0f/255.0f green:63.0f/255.0f blue:63.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"NEO"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:118.0f/255.0f green:185.0f/255.0f blue:7.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"XLM"] == NSOrderedSame) {
        // Old slightly grayish blue
        //colorToReturn = [UIColor colorWithRed:172.0f/255.0f green:208.0f/255.0f blue:218.0f/255.0f alpha:1.0f];
        // More light blue
        colorToReturn = [UIColor colorWithRed:213.0f/255.0f green:236.0f/255.0f blue:242.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"EOS"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:57.0f/255.0f green:38.0f/255.0f blue:23.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"MIOTA"] == NSOrderedSame) {
        colorToReturn = [UIColor blackColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"XEM"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:89.0f/255.0f green:187.0f/255.0f blue:173.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"DASH"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:1.0f/255.0f green:97.0f/255.0f blue:213.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"XMR"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:236.0f/255.0f green:99.0f/255.0f blue:51.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"LSK"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:47.0f/255.0f green:135.0f/255.0f blue:202.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"TRX"] == NSOrderedSame) {
        colorToReturn = [UIColor blackColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"USDT"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:78.0f/255.0f green:162.0f/255.0f blue:124.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"ETC"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:234.0f/255.0f green:234.0f/255.0f blue:234.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"VEN"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:98.0f/255.0f green:150.0f/255.0f blue:229.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"QTUM"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:61.0f/255.0f green:154.0f/255.0f blue:208.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"BTG"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:251.0f/255.0f green:211.0f/255.0f blue:51.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"ICX"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:99.0f/255.0f green:212.0f/255.0f blue:216.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"XRB"] == NSOrderedSame) {
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
        colorToReturn = [UIColor colorWithRed:19.0f/255.0f green:20.0f/255.0f blue:22.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"BCN"] == NSOrderedSame) {
        colorToReturn = [UIColor blackColor];
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
        colorToReturn = [UIColor colorWithRed:155.0f/255.0f green:197.0f/255.0f blue:220.0f/255.0f alpha:1.0f];
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
        colorToReturn = [UIColor colorWithRed:71.0f/255.0f green:175.0f/255.0f blue:233.0f/255.0f alpha:1.0f];
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
        colorToReturn = [UIColor colorWithRed:233.0f/255.0f green:173.0f/255.0f blue:101.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"MIOTA"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:81.0f/255.0f green:170.0f/255.0f blue:152.0f/255.0f alpha:1.0f];
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
        colorToReturn = [UIColor colorWithRed:120.0f/255.0f green:248.0f/255.0f blue:223.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"USDT"] == NSOrderedSame) {
        colorToReturn = [UIColor whiteColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"ETC"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:102.0f/255.0f green:144.0f/255.0f blue:115.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"VEN"] == NSOrderedSame) {
        colorToReturn = [UIColor whiteColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"QTUM"] == NSOrderedSame) {
        colorToReturn = [UIColor blackColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"BTG"] == NSOrderedSame) {
        colorToReturn = [UIColor colorWithRed:4.0f/255.0f green:35.0f/255.0f blue:112.0f/255.0f alpha:1.0f];
    }
    
    if ([ticker caseInsensitiveCompare:@"ICX"] == NSOrderedSame) {
        colorToReturn = [UIColor blackColor];
    }
    
    if ([ticker caseInsensitiveCompare:@"XRB"] == NSOrderedSame) {
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
        colorToReturn = [UIColor colorWithRed:189.0f/255.0f green:157.0f/255.0f blue:108.0f/255.0f alpha:1.0f];
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
        colorToReturn = [UIColor blackColor];
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
    
    return colorToReturn;
}

@end
