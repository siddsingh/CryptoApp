//
//  FACoinAltData.h
//  FinApp
//
//  Class to store alternate data for crypto coins like description, etc.
//
//  Created by Sidd Singh on 02/19/18.
//  Copyright © 2018 Sidd Singh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class FADataController;
@class EventHistory;

@interface FACoinAltData : NSObject

// Create and/or return the single shared data store
+ (FACoinAltData *) singleAltDataBox;

// Get profile information for a given coin i.e. Short Description,Real World Use Case,Backed By,Best Exchange,More Exchanges.
- (NSMutableArray *)getProfileInfoForCoin:(NSString *)ticker;

@end
