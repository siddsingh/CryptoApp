//
//  FACoinAltData.m
//  FinApp
//
//  Class to store alternate data for crypto coins like description, etc. Implement this class as a Singleton to create a single data store accessible from anywhere in the app.
//
//  Created by Sidd Singh on 2/19/18.
//  Copyright © 2018 Sidd Singh. All rights reserved.
//

#import "FACoinAltData.h"
#import "FADataController.h"
#import "EventHistory.h"
#import <UIKit/UIKit.h>

@implementation FACoinAltData

static FACoinAltData *sharedInstance;

// Implement this class as a Singleton to create a single data store accessible
// from anywhere in the app.
+ (void)initialize
{
    
    static BOOL exists = NO;
    
    // If a SnapShot doesn't already exist
    if(!exists)
    {
        exists = YES;
        sharedInstance= [[FACoinAltData alloc] init];
    }
}

// Create and/or return the single Snapshot
+(FACoinAltData *)singleAltDataBox {
    
    return sharedInstance;
}

// Get mostly static profile information for a given coin i.e.
// 1. Short Description,
// 2. Real World Use Cases,
// 3. Website,
// 4. Subreddit,
// 5. Github,
// 6. Twitter Handle,
// 7. Supporters (Countries, Institutions, People)
// 8. Detractors (Countries, Institutions, People)
// 9. Neutral (Countries, Institutions, People)
// 10. Best Exchange,
// 11. Known Exchanges.
- (NSMutableArray *)getProfileInfoForCoin:(NSString *)ticker {
    
    NSMutableArray * infoArray = [NSMutableArray arrayWithCapacity:10];
    
    // NOTE:
    // Here are the assumed base URLS
    // Reddit: https://www.reddit.com
    // Github: https://github.com
    // Twitter: https://twitter.com/
    
    if ([ticker caseInsensitiveCompare:@"BTC"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"First cryptocurrency, it's an innovative payment network & a new kind of money"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Peer to peer transactions like payments, Store of value like digital gold"];
        // 3. Website
        [infoArray addObject:@"https://bitcoin.org"];
        // 4. Subreddit
        [infoArray addObject:@"/r/Bitcoin"];
        // 5. Github
        [infoArray addObject:@"/bitcoin/"];
        // 6. Twitter Handle
        [infoArray addObject:@"@Bitcoin"];
        // 7. Supporters (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 8. Detractors (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 9. Neutral (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 10. Best Exchange
        [infoArray addObject:@"Not Available"];
        // 11. Known Exchanges
        [infoArray addObject:@"Not Available"];
    }
    
    else if ([ticker caseInsensitiveCompare:@"ETH"] == NSOrderedSame) {
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"XRP"] == NSOrderedSame) {
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"BCH"] == NSOrderedSame) {
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"ADA"] == NSOrderedSame) {
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"LTC"] == NSOrderedSame) {
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"NEO"] == NSOrderedSame) {
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"XLM"] == NSOrderedSame) {
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"EOS"] == NSOrderedSame) {
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"MIOTA"] == NSOrderedSame) {
        
    }
    // If not available set to default value of Not Available
    else {
        // 1. Short Description
        [infoArray addObject:@"Not Available"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Not Available"];
        // 3. Website
        [infoArray addObject:@"Not Available"];
        // 4. Subreddit
        [infoArray addObject:@"Not Available"];
        // 5. Github
        [infoArray addObject:@"Not Available"];
        // 6. Twitter Handle
        [infoArray addObject:@"Not Available"];
        // 7. Supporters (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 8. Detractors (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 9. Neutral (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 10. Best Exchange
        [infoArray addObject:@"Not Available"];
        // 11. Known Exchanges
        [infoArray addObject:@"Not Available"];
    }
    
    return infoArray;
} 

@end
