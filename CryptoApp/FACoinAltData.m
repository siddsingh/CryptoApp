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
// 4. Best Detailed Description Weblink
// 5. Subreddit,
// 6. Github,
// 7. Twitter Handle,
// 8. Backers (Countries, Institutions, People)
// 9. Detractors (Countries, Institutions, People)
// 10. On The Fence (Countries, Institutions, People)
// 11. Best Exchange,
// 12. Known Exchanges,
// 13. Best News Coverage Site
- (NSMutableArray *)getProfileInfoForCoin:(NSString *)ticker {
    
    NSMutableArray * infoArray = [NSMutableArray arrayWithCapacity:10];
    
    // NOTE:
    // Here are the assumed base URLS
    // Reddit: https://www.reddit.com
    // Github: https://github.com
    // Twitter: https://twitter.com/ and @ should be appended to the handle.
    //
    
    if ([ticker caseInsensitiveCompare:@"BTC"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"First cryptocurrency,it's an innovative payment network & a new kind of money"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Peer to peer transactions like payments,Store of value like digital gold"];
        // 3. Website
        [infoArray addObject:@"https://bitcoin.org"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://bitcoin.org/en/how-it-works"];
        // 5. Subreddit
        [infoArray addObject:@"/r/Bitcoin"];
        // 6. Github
        [infoArray addObject:@"/bitcoin/"];
        // 7. Twitter Handle
        [infoArray addObject:@"Bitcoin"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"Japan,Russia,Germany,Ronnie Moas(Standpoint Research)"];
        // 9. Detractors (Countries, Institutions, People)
        [infoArray addObject:@"China,Jamie Dimon(JP Morgan),Tidjane Thiam(Credit Suisse)"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"USA,Lloyd Blankfein(CEO Goldman Sachs)"];
        // 11. Best Exchange
        [infoArray addObject:@"Coinbase(GDAX)"];
        // 12. Known Exchanges
        [infoArray addObject:@"Coinbase(GDAX),Kraken,Bittrex,Gemini"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"https://www.coindesk.com"];
    }
    
    else if ([ticker caseInsensitiveCompare:@"ETH"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"Platform to develop & run smart contracts i.e. decentralized blockchain apps"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Exchange of money,content,property,shares or anything of value"];
        // 3. Website
        [infoArray addObject:@"https://www.ethereum.org"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://www.coindesk.com/information/what-is-ethereum/"];
        // 5. Subreddit
        [infoArray addObject:@"/r/ethereum"];
        // 6. Github
        [infoArray addObject:@"/bitcoin/"];
        // 7. Twitter Handle
        [infoArray addObject:@"ethereumproject"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"Japan,Russia,Germany,JP Morgan,Intel,Microsoft,Vitalik Buterin(Creator)"];
        // 9. Detractors (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Coinbase(GDAX)"];
        // 12. Known Exchanges
        [infoArray addObject:@"Coinbase(GDAX),Kraken,Bittrex,Gemini"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"https://www.ccn.com/ethereum-news/"];
    }
    
    else if ([ticker caseInsensitiveCompare:@"XRP"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"Not Available"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Not Available"];
        // 3. Website
        [infoArray addObject:@"Not Available"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"Not Available"];
        // 5. Subreddit
        [infoArray addObject:@"Not Available"];
        // 6. Github
        [infoArray addObject:@"Not Available"];
        // 7. Twitter Handle
        [infoArray addObject:@"Not Available"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 9. Detractors (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Not Available"];
        // 12. Known Exchanges
        [infoArray addObject:@"Not Available"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"https://www.coindesk.com"];
        
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
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"Not Available"];
        // 5. Subreddit
        [infoArray addObject:@"Not Available"];
        // 6. Github
        [infoArray addObject:@"Not Available"];
        // 7. Twitter Handle
        [infoArray addObject:@"Not Available"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 9. Detractors (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Not Available"];
        // 12. Known Exchanges
        [infoArray addObject:@"Not Available"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"https://www.coindesk.com"];
    }
    
    return infoArray;
} 

@end
