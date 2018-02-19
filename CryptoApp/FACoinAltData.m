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

// Get profile information for a given coin i.e. Short Description,Real World Use Case,Backed By,Best Exchange,More Exchanges.
- (NSMutableArray *)getProfileInfoForCoin:(NSString *)ticker {
    
    NSMutableArray * infoArray = [NSMutableArray arrayWithCapacity:5];
    
    if ([ticker caseInsensitiveCompare:@"BTC"] == NSOrderedSame) {
        
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
        [infoArray addObject:@"Not Availabe"];
        [infoArray addObject:@"Not Availabe"];
        [infoArray addObject:@"Not Availabe"];
        [infoArray addObject:@"Not Availabe"];
        [infoArray addObject:@"Not Availabe"];
    }
    
    return infoArray;
} 

@end
