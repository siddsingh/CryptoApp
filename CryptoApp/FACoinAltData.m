//
//  FACoinAltData.m
//  FinApp
//
//  Class to store alternate data for crypto coins like description, etc. Implement this class as a Singleton to create a single data store accessible from anywhere in the app.
//
//  Created by Sidd Singh on 2/19/18.
//  Copyright © 2018 Litchi Labs LLC. All rights reserved.
//  The data in this file has been curated by Litchi Labs. Cannot be used in apps without approval from Litchi Labs. If you need to please reach connect with us here: http://www.knotifi.com/p/contact.html
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
// 9. Detractors (Countries, Institutions, People) - call it Concerns
// 10. On The Fence (Countries, Institutions, People)
// 11. Best Exchange,
// 12. Known Exchanges,
// 13. Best News Coverage Site is being used to store the whitepaper link where available.
- (NSMutableArray *)getProfileInfoForCoin:(NSString *)ticker {
    
    NSMutableArray * infoArray = [NSMutableArray arrayWithCapacity:13];
    
    // NOTE:
    // Here are the assumed base URLS
    // Reddit: https://www.reddit.com
    // Github: https://github.com
    // Twitter: https://twitter.com/ and @ should be appended to form handle if needed.
    // If News Site is Not Available, then it is assumed we will use the best crypto news site whatever it is.
    
    if ([ticker caseInsensitiveCompare:@"BTC"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"1st cryptocurrency,it's an innovative payment network & a new kind of money"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Peer to peer transactions like payments,Store of value like digital gold"];
        // 3. Website
        [infoArray addObject:@"https://bitcoin.org"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://www.investinblockchain.com/what-is-bitcoin/"];
        // 5. Subreddit
        [infoArray addObject:@"/r/Bitcoin"];
        // 6. Github
        [infoArray addObject:@"/bitcoin/"];
        // 7. Twitter Handle
        [infoArray addObject:@"Bitcoin"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"Japan,Russia,Germany,Ronnie Moas(Standpoint Research)"];
        // 9. Detractors (Countries, Institutions, People)
        [infoArray addObject:@"China,influencers like Warren Buffett,Jamie Dimon(JP Morgan) opposed to it"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"USA,Lloyd Blankfein(CEO Goldman Sachs)"];
        // 11. Best Exchange
        [infoArray addObject:@"Coinbase(GDAX)"];
        // 12. Known Exchanges
        [infoArray addObject:@"Coinbase(GDAX),Kraken,Bittrex,Gemini"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"Not Available"];
    }
    
    else if ([ticker caseInsensitiveCompare:@"ETH"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"Platform to develop & run smart contracts i.e. decentralized blockchain apps"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Exchange of money,content,property,shares or anything of value"];
        // 3. Website
        [infoArray addObject:@"https://www.ethereum.org"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://www.investinblockchain.com/what-is-ethereum/"];
        // 5. Subreddit
        [infoArray addObject:@"/r/ethereum"];
        // 6. Github
        [infoArray addObject:@"/ethereum"];
        // 7. Twitter Handle
        [infoArray addObject:@"ethereumproject"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"Japan,Russia,Germany,JP Morgan,Intel,Microsoft,Vitalik Buterin(Creator)"];
        // 9. Detractors (Countries, Institutions, People)
        [infoArray addObject:@"Detractors say users have lost money to hacks,faulty code,human error"];
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
        [infoArray addObject:@"Blockchain solution for global payments geared to large financial institutions"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Real time cross border payments,low cost liquidity,$155 trillion market"];
        // 3. Website
        [infoArray addObject:@"https://ripple.com"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://www.investinblockchain.com/what-is-ripple/"];
        // 5. Subreddit
        [infoArray addObject:@"/r/Ripple"];
        // 6. Github
        [infoArray addObject:@"/ripple"];
        // 7. Twitter Handle
        [infoArray addObject:@"Ripple"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"HongKong,UAE,Santander,MoneyGram,Softbank,Bank Of America,UBS"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Detractors argue it's centralized,with Ripple Labs owning 60% of XRP tokens"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Binance"];
        // 12. Known Exchanges
        [infoArray addObject:@"Binance,Kraken,BitStamp"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"Not Available"];
    }
    
    else if ([ticker caseInsensitiveCompare:@"BCH"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"Bitcoin offshoot promising faster,cheaper peer to peer electronic cash"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Peer to peer electronic transactions like cash payments"];
        // 3. Website
        [infoArray addObject:@"https://www.bitcoincash.org"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://www.bitcoincash.org"];
        // 5. Subreddit
        [infoArray addObject:@"/r/Bitcoincash"];
        // 6. Github
        [infoArray addObject:@"/bitcoincashorg/"];
        // 7. Twitter Handle
        [infoArray addObject:@"BITCOlNCASH"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"Coinbase,Roger Ver(Bitcoin Evangelist),Calvin Ayre(Gaming Mogul)"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Charlie Lee(Litecoin Creator) is opposed to it's scaling approach"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Coinbase(GDAX)"];
        // 12. Known Exchanges
        [infoArray addObject:@"Coinbase(GDAX),Kraken,Binance"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"https://news.bitcoin.com"];
    }
    
    else if ([ticker caseInsensitiveCompare:@"ADA"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"Ethereum of Japan is a platform to build & run smart contracts"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Exchange of money,content,property,shares with regulatory support"];
        // 3. Website
        [infoArray addObject:@"https://www.cardanohub.org/en/home/"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://www.investinblockchain.com/what-is-cardano/"];
        // 5. Subreddit
        [infoArray addObject:@"/r/cardano/"];
        // 6. Github
        [infoArray addObject:@"/input-output-hk/cardano-sl/"];
        // 7. Twitter Handle
        [infoArray addObject:@"CardanoStiftung"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"Charles Hoskinson(Ethereum CoFounder)"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Not Available"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Binance"];
        // 12. Known Exchanges
        [infoArray addObject:@"Binance,Bittrex,Bitmex"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"https://ethereumworldnews.com"];
    }
    
    else if ([ticker caseInsensitiveCompare:@"LTC"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"Silver to Bitcoin's Gold but with faster transaction times"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Ideal for small size purchases"];
        // 3. Website
        [infoArray addObject:@"https://litecoin.com"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://www.investinblockchain.com/what-is-litecoin/"];
        // 5. Subreddit
        [infoArray addObject:@"/r/litecoin"];
        // 6. Github
        [infoArray addObject:@"/litecoin-project/litecoin"];
        // 7. Twitter Handle
        [infoArray addObject:@"litecoin"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"Coinbase,Charlie Lee(Litecoin Creator)"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Not Available"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Coinbase(GDAX)"];
        // 12. Known Exchanges
        [infoArray addObject:@"Coinbase(GDAX),Kraken,Binance"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"https://www.ccn.com/litecoin-news/"];
    }
    
    else if ([ticker caseInsensitiveCompare:@"NEO"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"Ethereum of China is a platform to build & run smart contracts"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Digitize,exchange traditional assets with existing programming languages"];
        // 3. Website
        [infoArray addObject:@"https://neo.org"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://www.investinblockchain.com/what-is-neo/"];
        // 5. Subreddit
        [infoArray addObject:@"/r/NEO/"];
        // 6. Github
        [infoArray addObject:@"/neo-project"];
        // 7. Twitter Handle
        [infoArray addObject:@"NEO_Blockchain"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"China(Speculation),Microsoft,Alibaba,Da Hongfei(NEO Creator)"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"China has displayed a negative stance towards the overall crypto space"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Binance"];
        // 12. Known Exchanges
        [infoArray addObject:@"Binance,Bitfinex,Huobi"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"Not Available"];
    }
    
    else if ([ticker caseInsensitiveCompare:@"XLM"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"Like Ripple but catering to developers building affordable financial services"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Fast,cheap cross border payments,Micropayments,Services for the underbanked"];
        // 3. Website
        [infoArray addObject:@"https://www.stellar.org"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://www.investinblockchain.com/what-are-stellar-lumens-xlm/"];
        // 5. Subreddit
        [infoArray addObject:@"/r/Stellar/"];
        // 6. Github
        [infoArray addObject:@"/stellar"];
        // 7. Twitter Handle
        [infoArray addObject:@"StellarOrg"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"IBM,Stripe,Jed McCaleb(Ex Cofounder Ripple)"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Competitors like Ripple already have a strong foothold"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Binance"];
        // 12. Known Exchanges
        [infoArray addObject:@"Binance,Bittrex,Cex.Io"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"Not Available"];
    }
    
    else if ([ticker caseInsensitiveCompare:@"EOS"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"Like Ethereum but with interesting performance and scalability benefits"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Exchange of money,content,property,shares or anything of value"];
        // 3. Website
        [infoArray addObject:@"https://eos.io"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://www.investinblockchain.com/what-is-eos/"];
        // 5. Subreddit
        [infoArray addObject:@"/r/eos/"];
        // 6. Github
        [infoArray addObject:@"/eosio"];
        // 7. Twitter Handle
        [infoArray addObject:@"EOS_io"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"Bitfinex,Dan Larimer(Founder STEEM),Li Xiaolai(Chinese Bitcoin Investor)"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Not Available"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Binance"];
        // 12. Known Exchanges
        [infoArray addObject:@"Binance,Bitfinex"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"Not Available"];
    }
    
    else if ([ticker caseInsensitiveCompare:@"DASH"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"Digital Cash with private transactions,quick confirmation times & low fees"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Instant, private payments online or in-store"];
        // 3. Website
        [infoArray addObject:@"https://www.dash.org"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://www.btcnn.com/dash-coin-work/"];
        // 5. Subreddit
        [infoArray addObject:@"/r/dashpay/"];
        // 6. Github
        [infoArray addObject:@"/dashpay/dash"];
        // 7. Twitter Handle
        [infoArray addObject:@"Dashpay"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"FanDuel did a joint promotion with Dash during the Superbowl"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Detractors say it's not truly decentralized as some users have more power"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Binance"];
        // 12. Known Exchanges
        [infoArray addObject:@"Binance,Bittrex,Bitfinex"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"Not Available"];
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"XMR"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"The first secure,private,and untraceable cryptocurrency"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Top currency for anonymous transactions"];
        // 3. Website
        [infoArray addObject:@"https://getmonero.org"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://www.investinblockchain.com/what-is-monero/"];
        // 5. Subreddit
        [infoArray addObject:@"/r/Monero/"];
        // 6. Github
        [infoArray addObject:@"/monero-project/monero"];
        // 7. Twitter Handle
        [infoArray addObject:@"monerocurrency"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"Riccardo Spagni(Lead maintainer Monero),Musicians like Mariah Carey"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Detractors believe that this cryptocurrency is popular on the black market"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Binance"];
        // 12. Known Exchanges
        [infoArray addObject:@"Binance,Kraken,Bitfinex"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"Not Available"];
    }
    
    else if ([ticker caseInsensitiveCompare:@"MIOTA"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"Enabling micropayments with no mining,no blocks,no transaction fees"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Internet connected devices transacting with each other"];
        // 3. Website
        [infoArray addObject:@"https://iota.org"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://www.investinblockchain.com/what-is-iota-miota/"];
        // 5. Subreddit
        [infoArray addObject:@"/r/Iota/"];
        // 6. Github
        [infoArray addObject:@"/iotaledger"];
        // 7. Twitter Handle
        [infoArray addObject:@"iotatoken"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"Berlin based,Microsoft,Cisco,Samsung,VW,Dominik Schiener(Co Founder)"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Detractors say IOTA fans are trying to silence critics without discussion"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Binance"];
        // 12. Known Exchanges
        [infoArray addObject:@"Binance,Bitfinex"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"Not Available"];
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"XEM"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"Smart Asset Blockchain for Enterprise"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Put business transactions on the blockchain e.g. payments,escrow,etc"];
        // 3. Website
        [infoArray addObject:@"https://nem.io/enterprise/"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://www.investinblockchain.com/what-is-nem/"];
        // 5. Subreddit
        [infoArray addObject:@"/r/nem/"];
        // 6. Github
        [infoArray addObject:@"/NemProject"];
        // 7. Twitter Handle
        [infoArray addObject:@"NEMofficial"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"Singapore,Lon Wong(NEM President)"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Not Available"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Bittrex"];
        // 12. Known Exchanges
        [infoArray addObject:@"Bittrex,Poloniex,Huobi"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"Not Available"];
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"ETC"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"Similar to and forked from Ethereum after a hacker attack"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Exchange of money,content,property,shares or anything of value"];
        // 3. Website
        [infoArray addObject:@"https://ethereumclassic.github.io"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://www.investinblockchain.com/what-is-ethereum-classic/"];
        // 5. Subreddit
        [infoArray addObject:@"/r/EthereumClassic/"];
        // 6. Github
        [infoArray addObject:@"/ethereumproject"];
        // 7. Twitter Handle
        [infoArray addObject:@"eth_classic"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Not Available"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Binance"];
        // 12. Known Exchanges
        [infoArray addObject:@"Binance,Bittrex,Kraken"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"Not Available"];
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"TRX"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"Goal is to create a healthier entertainment ecosystem on blockchain"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Users can freely publish,store & own their data like text,pictures,etc"];
        // 3. Website
        [infoArray addObject:@"https://tron.network/enindex.html"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://www.investinblockchain.com/what-is-tron/"];
        // 5. Subreddit
        [infoArray addObject:@"/r/Tronix/"];
        // 6. Github
        [infoArray addObject:@"/tronprotocol"];
        // 7. Twitter Handle
        [infoArray addObject:@"Tronfoundation"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"Singapore based,Chinese team,Justin Sun(CEO,Forbes Asia 30 under 30)"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Detractors don't believe that TRON can succeed with Chinese media rules"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Binance"];
        // 12. Known Exchanges
        [infoArray addObject:@"Binance,YoBit"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"Not Available"];
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"VEN"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"Blockchain platform for businesses to effectively automate product processes"];
         // 2. Real World Use Cases
        [infoArray addObject:@"Prevent counterfeit goods,food safety tracking,digitizing car maintenance"];
         // 3. Website
         [infoArray addObject:@"https://www.vechain.com/#/"];
         // 4. Best Detailed Description Weblink
         [infoArray addObject:@"https://blockonomi.com/vechain-guide/"];
         // 5. Subreddit
         [infoArray addObject:@"/r/Vechain/"];
         // 6. Github
         [infoArray addObject:@"/vechain"];
         // 7. Twitter Handle
         [infoArray addObject:@"vechainofficial"];
         // 8. Backers (Countries, Institutions, People)
         [infoArray addObject:@"Chinese Govt Partnerships,PwC,Renault,Microsoft,Singapore based"];
         // 9. Detractors (Countries, Institutions, People, Argument)
         [infoArray addObject:@"Not Available"];
         // 10. On the Fence (Countries, Institutions, People)
         [infoArray addObject:@"Not Available"];
         // 11. Best Exchange
         [infoArray addObject:@"Binance"];
         // 12. Known Exchanges
         [infoArray addObject:@"Binance,Huobi,Kucoin"];
         // 13. Best News Coverage Site
         [infoArray addObject:@"Not Available"];
         
         }
    
    else if ([ticker caseInsensitiveCompare:@"LSK"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"Platform to build and deploy blockchain applications in JavaScript"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Exchange of money,content,property,shares or anything of value"];
        // 3. Website
        [infoArray addObject:@"https://lisk.io"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://www.investinblockchain.com/what-is-lisk/"];
        // 5. Subreddit
        [infoArray addObject:@"/r/Lisk/"];
        // 6. Github
        [infoArray addObject:@"/LiskHQ/"];
        // 7. Twitter Handle
        [infoArray addObject:@"LiskHQ"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"Berlin based,Max Kordek & Olivier Beddows(co founders,crypto veterans)"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Not Available"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Binance"];
        // 12. Known Exchanges
        [infoArray addObject:@"Binance,Livecoin,YoBit"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"Not Available"];
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"USDT"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"Represents fiat,each tether is backed by,pegged to $1 USD"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Facilitate transactions with a rate fixed to the USD"];
        // 3. Website
        [infoArray addObject:@"https://tether.to"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://www.reddit.com/r/Tether/comments/7a37al/to_those_that_still_think_it_is_a_good_idea_to/"];
        // 5. Subreddit
        [infoArray addObject:@"/r/Tether/"];
        // 6. Github
        [infoArray addObject:@"Not Available"];
        // 7. Twitter Handle
        [infoArray addObject:@"Tether_to"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"Incorporated(Hong Kong),Swiss Offices,JL van der Velde(CEO Tether,Bitfinex)"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Controversial business model,and some consider it a scam"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Binance"];
        // 12. Known Exchanges
        [infoArray addObject:@"Binance,Huobi,Poloniex"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"Not Available"];
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"BTG"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"Fork from Bitcoin that lowers the barrier to entry for new miners"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Decentralize mining by enabling new GPU based miners to come in"];
        // 3. Website
        [infoArray addObject:@"https://bitcoingold.org"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://arstechnica.com/tech-policy/2017/11/bitcoin-gold-the-latest-bitcoin-fork-explained/"];
        // 5. Subreddit
        [infoArray addObject:@"/r/BitcoinGoldHQ"];
        // 6. Github
        [infoArray addObject:@"/BTCGPU/BTCGPU"];
        // 7. Twitter Handle
        [infoArray addObject:@"bitcoingold"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"Martin Kuvandzhiev(Developer)"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Some in the community consider Bitcoin Gold a scam"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Binance"];
        // 12. Known Exchanges
        [infoArray addObject:@"Binance,Bitfinex,Bittrex"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"Not Available"];
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"OMG"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"Ethereum based financial technology for use in mainstream digital wallets"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Digital payment services for individuals & businesses,Unbank the Banked"];
        // 3. Website
        [infoArray addObject:@"https://omisego.network"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://www.investinblockchain.com/what-is-omisego-omg/"];
        // 5. Subreddit
        [infoArray addObject:@"/r/omise_go/"];
        // 6. Github
        [infoArray addObject:@"/omise/omise-go"];
        // 7. Twitter Handle
        [infoArray addObject:@"omise_go"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"Big in Southeast Asia(esp Thailand),McDonald’s & Credit Saison"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Valuation is too high,considering their platform launched in Q4 2017"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Binance"];
        // 12. Known Exchanges
        [infoArray addObject:@"Binance,Bitfinex,Bittrex"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"Not Available"];
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"QTUM"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"Bitcoin & Ethereum hybrid,it's a platform to build mobile blockchain apps"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Exchange of money,content,property,shares or anything of value"];
        // 3. Website
        [infoArray addObject:@"https://qtum.org/en/"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://www.investinblockchain.com/what-is-qtum/"];
        // 5. Subreddit
        [infoArray addObject:@"/r/Qtum/"];
        // 6. Github
        [infoArray addObject:@"/qtumproject/qtum/"];
        // 7. Twitter Handle
        [infoArray addObject:@"QtumOfficial"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"Singapore based,strong development team,Patrick Dai(CEO)"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Not Available"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Binance"];
        // 12. Known Exchanges
        [infoArray addObject:@"Binance,Bittrex,Huobi"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"Not Available"];
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"NANO"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"Fast & free digital currency"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Crypto trading,Peer to peer payments,micropayments,business to consumer"];
        // 3. Website
        [infoArray addObject:@"https://nano.org/en"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://www.investinblockchain.com/what-is-raiblocks/"];
        // 5. Subreddit
        [infoArray addObject:@"/r/nanocurrency/"];
        // 6. Github
        [infoArray addObject:@"/nanocurrency"];
        // 7. Twitter Handle
        [infoArray addObject:@"nanocurrency"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"Colin LeMahieu(Lead Developer ex AMD,Qualcomm),Strong international team"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Detractors point to a recent hack where a large amount of Nanos were stolen"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Binance"];
        // 12. Known Exchanges
        [infoArray addObject:@"Binance,Kucoin,BitFlip"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"Not Available"];
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"ICX"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"Platform to connect all the different blockchains together"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Facilitate operations between different industries e.g. medical & insurance"];
        // 3. Website
        [infoArray addObject:@"https://icon.foundation/?lang=en"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://www.investinblockchain.com/what-is-icon-icx/"];
        // 5. Subreddit
        [infoArray addObject:@"/r/helloicon/"];
        // 6. Github
        [infoArray addObject:@"/theloopkr/loopchain"];
        // 7. Twitter Handle
        [infoArray addObject:@"helloiconworld"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"S Korea based,Woori(Korea’s largest bank) & 28 other financial instituions"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Other blockchains might decide to not work with them"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Binance"];
        // 12. Known Exchanges
        [infoArray addObject:@"Binance,Huobi"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"Not Available"];
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"ZEC"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"Like Bitcoin but can fully protect the privacy of transactions"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Privacy based flows e.g. Private Internet Access"];
        // 3. Website
        [infoArray addObject:@"https://z.cash"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://www.investinblockchain.com/invest-in-zcash/"];
        // 5. Subreddit
        [infoArray addObject:@"/r/zec"];
        // 6. Github
        [infoArray addObject:@"/zcash/zcash"];
        // 7. Twitter Handle
        [infoArray addObject:@"zcashco"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"JP Morgan,Israeli Govt,Roger Ver,Erik Voorhees(Major crypto influencers)"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Politically charged backers,detractors criticize the founders mining tax"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Kraken"];
        // 12. Known Exchanges
        [infoArray addObject:@"Kraken,Binance,Huobi"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"Not Available"];
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"BNB"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"Coin used to facilitate operations on the popular Binance exchange"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Users can pay lower trading fees on Binance using the coin"];
        // 3. Website
        [infoArray addObject:@"https://www.binance.com"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://www.binance.com/resources/ico/Binance_WhitePaper_en.pdf"];
        // 5. Subreddit
        [infoArray addObject:@"/r/BinanceExchange/"];
        // 6. Github
        [infoArray addObject:@"/binance-exchange"];
        // 7. Twitter Handle
        [infoArray addObject:@"binance_2017"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"Hong Kong based,servers in S Korea,quickly diverisfying internationally"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"No one knows how China's negative stance on crypto impacts their future"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Binance"];
        // 12. Known Exchanges
        [infoArray addObject:@"Binance,Bancor Network"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"Not Available"];
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"STEEM"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"Currency for the Steemit platform where one gets paid to post content"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Platform for users to monetize content & grow community like Youtube"];
        // 3. Website
        [infoArray addObject:@"https://steem.io"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://www.investinblockchain.com/steem-steemit/"];
        // 5. Subreddit
        [infoArray addObject:@"/r/steemit/"];
        // 6. Github
        [infoArray addObject:@"/steemit/steem"];
        // 7. Twitter Handle
        [infoArray addObject:@"steemit"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"Ned Scott(Co founder) & Daniel Larimer(Co Founder, Founder BitShares)"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Going up against tech behemoths Facebook & Google (Youtube)"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Binance"];
        // 12. Known Exchanges
        [infoArray addObject:@"Binance,Bittrex,Poloniex"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"Not Available"];
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"XVG"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"Like Bitcoin,a cryptocurrency with secure,anonymous & private transactions"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Fast business to consumer transactions while maintaining personal privacy"];
        // 3. Website
        [infoArray addObject:@"https://vergecurrency.com"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://www.investinblockchain.com/what-is-verge/"];
        // 5. Subreddit
        [infoArray addObject:@"/r/vergecurrency/"];
        // 6. Github
        [infoArray addObject:@"/vergecurrency"];
        // 7. Twitter Handle
        [infoArray addObject:@"vergecurrency"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"Sunerok(Co founder),CryptoRekt(CMO,Ex Cisco),Kieran Daniels(VP Marketing)"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Concern that the development is not proceeding at an appreciable pace"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Binance"];
        // 12. Known Exchanges
        [infoArray addObject:@"Binance,Bittrex,Upbit"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"Not Available"];
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"BCN"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"The first private untraceable cryptocurrency from which Monero split off"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Instant,no fee transactions around the world,totally untraceable"];
        // 3. Website
        [infoArray addObject:@"https://bytecoin.org"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://www.investinblockchain.com/what-is-bytecoin/"];
        // 5. Subreddit
        [infoArray addObject:@"/r/BytecoinBCN/"];
        // 6. Github
        [infoArray addObject:@"/bcndev"];
        // 7. Twitter Handle
        [infoArray addObject:@"Bytecoin_BCN"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Monero is basically the improved version of Bytecoin and is better known"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Poloniex"];
        // 12. Known Exchanges
        [infoArray addObject:@"HitBTC,Poloniex"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"Not Available"];
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"PPT"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"Ethereum based peer to peer platform for invoicing & trade financing"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Marketplace for small investors to finance businesses which need cash"];
        // 3. Website
        [infoArray addObject:@"https://populous.co/index.html"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://www.investinblockchain.com/what-is-populous/"];
        // 5. Subreddit
        [infoArray addObject:@"/r/PopulousCoin/"];
        // 6. Github
        [infoArray addObject:@"/bitpopulous"];
        // 7. Twitter Handle
        [infoArray addObject:@"BitPopulous"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"Stephen Williams(British founder,fin expert),Jonathan Millar(noted economist)"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Founded in 2017,yet to prove they can churn out great returns for investors"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Binance"];
        // 12. Known Exchanges
        [infoArray addObject:@"Binance,Kucoin,HitBTC"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"Not Available"];
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"DGD"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"One of two coins,DGD & DGX,created by Digix Global"];
        // 2. Real World Use Cases
        [infoArray addObject:@"DGD enables partaking in DGX,DGX will be backed by physical gold bullion"];
        // 3. Website
        [infoArray addObject:@"https://digix.global"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://captainaltcoin.com/what-is-digixdao-coin/"];
        // 5. Subreddit
        [infoArray addObject:@"/r/digix/"];
        // 6. Github
        [infoArray addObject:@"/digixglobal"];
        // 7. Twitter Handle
        [infoArray addObject:@"DigixGlobal"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"Singapore based"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"DGX not yet released,slated for Q1 2018"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Binance"];
        // 12. Known Exchanges
        [infoArray addObject:@"Binance,Huobi,HitBTC"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"Not Available"];
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"STRAT"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"Platform for companies to build custom blockchain apps easily in .NET"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Origin,Tracking for Seafood,Unalterable store of medical research,Fin Tech"];
        // 3. Website
        [infoArray addObject:@"https://stratisplatform.com"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://www.investinblockchain.com/what-is-stratis/"];
        // 5. Subreddit
        [infoArray addObject:@"/r/stratisplatform/"];
        // 6. Github
        [infoArray addObject:@"/stratisproject"];
        // 7. Twitter Handle
        [infoArray addObject:@"stratisplatform"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"UK based,EarthTwine,Gluon(Partners),Chris Trew(CEO)"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Feels relatively new and still exploring use cases and building usage"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Binance"];
        // 12. Known Exchanges
        [infoArray addObject:@"Binance,Huobi,HitBTC"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"Not Available"];
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"DOGE"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"Self proclaimed joke coin that has become very popular"];
        // 2. Real World Use Cases
        [infoArray addObject:@"peer to peer e payments,microtransactions like tipping on articles"];
        // 3. Website
        [infoArray addObject:@"http://dogecoin.com"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://www.investinblockchain.com/what-is-dogecoin/"];
        // 5. Subreddit
        [infoArray addObject:@"/r/dogecoin/"];
        // 6. Github
        [infoArray addObject:@"/dogecoin/dogecoin"];
        // 7. Twitter Handle
        [infoArray addObject:@"dogecoin"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"Huge,friendly community of over 100,000 reddit subscribers"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Stalled development without a single update in over 2 years"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Bittrex"];
        // 12. Known Exchanges
        [infoArray addObject:@"Bittrex,Upbit,Poloniex"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"Not Available"];
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"SC"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"The Airbnb of hard drives,a cloud storage platform on blockchain"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Reduce costs by allowing users to rent out their unused hard drive"];
        // 3. Website
        [infoArray addObject:@"https://sia.tech"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://www.investinblockchain.com/what-is-siacoin/"];
        // 5. Subreddit
        [infoArray addObject:@"/r/siacoin/"];
        // 6. Github
        [infoArray addObject:@"/NebulousLabs/Sia"];
        // 7. Twitter Handle
        [infoArray addObject:@"SiaTechHQ"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"Venture Capital Firms,Jim Pallotta(Investor,Co owner Boston Celtics)"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Lower content access speed compared to current players like Dropbox"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Bittrex"];
        // 12. Known Exchanges
        [infoArray addObject:@"Bittrex,Upbit,Poloniex"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"Not Available"];
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"RHOC"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"Like Ethereum,a platform that scales like Facebook & is fast like Visa"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Exchange of money,content,property,shares or anything of value"];
        // 3. Website
        [infoArray addObject:@"https://www.rchain.coop/#home"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://themerkle.com/what-is-rchain/"];
        // 5. Subreddit
        [infoArray addObject:@"/r/RChain/"];
        // 6. Github
        [infoArray addObject:@"/rchain/"];
        // 7. Twitter Handle
        [infoArray addObject:@"rchain_coop"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"Greg Meredith(Creator,mathematician & software engineer)"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Remains to be seen if their technology can deliver on the initial promise"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Kucoin"];
        // 12. Known Exchanges
        [infoArray addObject:@"Kucoin"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"Not Available"];
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"WAVES"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"Like Ethereum,a platform to build distributed blockchain apps without knowing to code"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Average person can build apps that digitize and exchange anything of value like money"];
        // 3. Website
        [infoArray addObject:@"https://www.rchain.coop/#home"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://www.investinblockchain.com/what-is-waves/"];
        // 5. Subreddit
        [infoArray addObject:@"/r/Wavesplatform/"];
        // 6. Github
        [infoArray addObject:@"/wavesplatform/"];
        // 7. Twitter Handle
        [infoArray addObject:@"wavesplatform"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"Russian Govt,Deloitte,Sasha Ivanov(CEO,Solid track record in the crypto space"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Lack of regulation can lead to and led to (in 2017) scam tokens being created"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Binance"];
        // 12. Known Exchanges
        [infoArray addObject:@"Binance,Bittrex,Upbit"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"Not Available"];
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"SNT"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"Mobile operating system & messaging platform for Ethereum(think Android)"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Enables users to browse & interact with distributed apps built on Ethereum"];
        // 3. Website
        [infoArray addObject:@"https://status.im"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://www.investinblockchain.com/what-is-status/"];
        // 5. Subreddit
        [infoArray addObject:@"/r/statusim/"];
        // 6. Github
        [infoArray addObject:@"/status-im"];
        // 7. Twitter Handle
        [infoArray addObject:@"ethstatus"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"Originally Singapore based,Status team exploded into 55 global members in 2017"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Very early,the biggest challenge currently is gaining mass adoption"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Binance"];
        // 12. Known Exchanges
        [infoArray addObject:@"Binance,Huobi,Upbit"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"Not Available"];
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"BTS"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"Decentralized peer to peer exchange,removing the need for a central authority"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Price-Stable Cryptocurrencies,Secure Decentralized Asset Exchange"];
        // 3. Website
        [infoArray addObject:@"https://bitshares.org"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://bytemaster.github.io/update/2014/12/18/What-is-BitShares/"];
        // 5. Subreddit
        [infoArray addObject:@"/r/BitShares/"];
        // 6. Github
        [infoArray addObject:@"/bitshares"];
        // 7. Twitter Handle
        [infoArray addObject:@"bitshares"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"Dan Larimer(Founder,impressive resume,also lead developer on both EOS & Steem)"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Too sophisticated a business model for the average investor to understand"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Binance"];
        // 12. Known Exchanges
        [infoArray addObject:@"Binance,BitShares Asset Exchange"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"Not Available"];
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"WTC"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"Utilizes RFID & Blockchain to create an IoT(internet of things) network"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Enabling businesses to passively & cheaply track any type of physical product"];
        // 3. Website
        [infoArray addObject:@"https://www.waltonchain.org"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://www.investinblockchain.com/waltonchain/"];
        // 5. Subreddit
        [infoArray addObject:@"/r/waltonchain/"];
        // 6. Github
        [infoArray addObject:@"/WaltonChain/WaltonWallet"];
        // 7. Twitter Handle
        [infoArray addObject:@"Waltonchain"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"Strong S Korea based team,Xu Fangcheng(Founder,Apparel Billionaire),Coinnest"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Privacy is an issue with RFID,Cost is high,RFID tech maturity is low"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Binance"];
        // 12. Known Exchanges
        [infoArray addObject:@"Binance,Coinnest,Kucoin"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"Not Available"];
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"ZRX"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"Built on Ethereum,it's a platform to create decentralized exchanges"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Offers plug & play exchange capabilities for ethereum based apps"];
        // 3. Website
        [infoArray addObject:@"https://0xproject.com"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://blockonomi.com/0x-guide/"];
        // 5. Subreddit
        [infoArray addObject:@"/r/0xProject/"];
        // 6. Github
        [infoArray addObject:@"/0xProject"];
        // 7. Twitter Handle
        [infoArray addObject:@"0xProject"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"Well funded by Fintech Blockchain Group,Pantera,Polychain Capital & others"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"As of Sep 2017,there were no active projects using Ox,so early days"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Binance"];
        // 12. Known Exchanges
        [infoArray addObject:@"Binance,Bittrex,Poloniex"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"Not Available"];
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"ETN"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"First British cryptocurrency designed specifically for mobile users"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Payments from mobile devices,users can mine the currency on their smartphone"];
        // 3. Website
        [infoArray addObject:@"https://electroneum.com"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://www.investinblockchain.com/what-is-electroneum-etn/"];
        // 5. Subreddit
        [infoArray addObject:@"/r/Electroneum/"];
        // 6. Github
        [infoArray addObject:@"/electroneum"];
        // 7. Twitter Handle
        [infoArray addObject:@"electroneum"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"Strong team headed by Richard Ells(successful entrepreneur),ICO raised $40 mn"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Listed on only 1 major exchange Cryptopia,Weakly differentiated biz model"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Cryptopia"];
        // 12. Known Exchanges
        [infoArray addObject:@"Cryptopia"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"Not Available"];
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"AE"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"Platform to build scalable,efficient blockchain apps with governance"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Like Ethereum,digitize and exchange any asset but with better scaling"];
        // 3. Website
        [infoArray addObject:@"https://www.aeternity.com"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://themerkle.com/what-is-aeternity-cryptocurrency/"];
        // 5. Subreddit
        [infoArray addObject:@"/r/Aeternity/"];
        // 6. Github
        [infoArray addObject:@"/aeternity"];
        // 7. Twitter Handle
        [infoArray addObject:@"aetrnty"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"Bulgaria based team of 48 people,ICO raised more than $24 million"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Still early,security audit slated in Q1 2018,main launch in Q2 2018"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Binance"];
        // 12. Known Exchanges
        [infoArray addObject:@"Binance & HitBTC"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"Not Available"];
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"DCR"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"An autonomous digital currency with community based governance"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Open & progressive currency where people who own it get a say in it's future"];
        // 3. Website
        [infoArray addObject:@"https://www.decred.org"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://www.investinblockchain.com/what-is-decred/"];
        // 5. Subreddit
        [infoArray addObject:@"/r/decred/"];
        // 6. Github
        [infoArray addObject:@"/decred"];
        // 7. Twitter Handle
        [infoArray addObject:@"decredproject"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"Sound engineering team of primarily volunteers that are somewhat anonymous"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Very little hype,challenges are garnering adoption & growing the community"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Bittrex"];
        // 12. Known Exchanges
        [infoArray addObject:@"Bittrex,Poloniex"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"Not Available"];
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"REP"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"Decentralized prediction market built on Ethereum"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Users can trade on their prediction of any future outcome e.g. elections"];
        // 3. Website
        [infoArray addObject:@"http://www.augur.net"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://www.investinblockchain.com/what-is-augur/"];
        // 5. Subreddit
        [infoArray addObject:@"/r/Augur/"];
        // 6. Github
        [infoArray addObject:@"/AugurProject"];
        // 7. Twitter Handle
        [infoArray addObject:@"AugurProject"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"Experienced dev team,Star advisors like Vitalik Buterin(Ethereum founder)"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Competing with betting platforms such as Betfair,advantage not clear"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Kraken"];
        // 12. Known Exchanges
        [infoArray addObject:@"Kraken,Bittrex,Poloniex"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"Not Available"];
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"VERI"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"Offers blockchain based,peer to peer capital markets globally"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Seamless connection of parties & assets without a authoritarian 3rd party"];
        // 3. Website
        [infoArray addObject:@"https://veritas.veritaseum.com"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://drive.google.com/file/d/0B2VyTD2UEyLTTERVNHFPY2x1b00/view"];
        // 5. Subreddit
        [infoArray addObject:@"Not Available"];
        // 6. Github
        [infoArray addObject:@"/veritaseum"];
        // 7. Twitter Handle
        [infoArray addObject:@"Veritaseuminc"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"Very little is known about their product creation"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Lack of clear & detailed info on the project casts doubt on it as a scam"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"HitBTC"];
        // 12. Known Exchanges
        [infoArray addObject:@"HitBTC"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"Not Available"];
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"R"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"First trustworthy reviews platform,built with blockchain technology"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Users get paid for posting tamper proof reviews,companies pay for the feedback"];
        // 3. Website
        [infoArray addObject:@"https://revain.org"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"http://www.forexnewsnow.com/forex-analysis/cryptocurrency/know-revain-cryptocurrency/"];
        // 5. Subreddit
        [infoArray addObject:@"/r/revain_org/"];
        // 6. Github
        [infoArray addObject:@"/Revain"];
        // 7. Twitter Handle
        [infoArray addObject:@"Revain_org"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"17 person Russia based team,Dmitry Fedotov(Advisor,CEO Resume Games)"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Early days,tight roadmap with the token & gaming reviews launching late 2018"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Kucoin"];
        // 12. Known Exchanges
        [infoArray addObject:@"Kucoin,Cryptopia,HitBTC"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"Not Available"];
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"ARDR"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"Blockchain as a service platform for companies to build scalable apps"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Companies can digitize & exchange anything of value in a highly scalable manner"];
        // 3. Website
        [infoArray addObject:@"https://www.ardorplatform.org"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://www.investinblockchain.com/what-is-ardor/"];
        // 5. Subreddit
        [infoArray addObject:@"/r/Ardor/"];
        // 6. Github Stored on Bitbucket: https://bitbucket.org/Jelurida/ardor/src
        [infoArray addObject:@"Not Available"];
        // 7. Twitter Handle
        [infoArray addObject:@"ArdorPlatform"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"Expert team,Lior Yaffe(Cofounder & Developer),Kristina Kalcheva(Cofounder & Legal)"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Early days,yet to see what use cases are built on the Ardor platform"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Bittrex"];
        // 12. Known Exchanges
        [infoArray addObject:@"Bittrex,Poloniex,HitBTC"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"Not Available"];
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"HSR"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"A decentralized & open source cross platform cryptocurrency"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Easy transfer of currency on different blockchains"];
        // 3. Website
        [infoArray addObject:@"https://h.cash"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://h.cash"];
        // 5. Subreddit
        [infoArray addObject:@"/r/hcash/"];
        // 6. Github
        [infoArray addObject:@"/HcashOrg/hcashd"];
        // 7. Twitter Handle
        [infoArray addObject:@"HcashOfficial"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"9 investors listed on website including Fintech Blockchain Group"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Currently just an idea making people skeptical of it,even calling it a scam"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Bittrex"];
        // 12. Known Exchanges
        [infoArray addObject:@"Bittrex,Poloniex,HitBTC"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"Not Available"];
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"GAS"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"Sister crypto to NEO,which is the Ethereum of China,a platform for smart contracts"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Digitize,exchange traditional assets with existing programming languages"];
        // 3. Website
        [infoArray addObject:@"https://neo.org"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://hackernoon.com/what-is-neo-and-what-is-gas-5b9828a1aa65"];
        // 5. Subreddit
        [infoArray addObject:@"/r/NEO/"];
        // 6. Github
        [infoArray addObject:@"/neo-project"];
        // 7. Twitter Handle
        [infoArray addObject:@"NEO_Blockchain"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"China(Speculation),Microsoft,Alibaba,Da Hongfei(NEO Creator)"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"China has displayed a negative stance towards the overall crypto space"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Binance"];
        // 12. Known Exchanges
        [infoArray addObject:@"Binance,Poloniex,Huobi"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"Not Available"];
    }
    
    else if ([ticker caseInsensitiveCompare:@"KMD"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"Platform to build blockchain solutions including launching a distributed ICO"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Build blockchain solutions,launch an ICO,add an exchange,anonymity features"];
        // 3. Website
        [infoArray addObject:@"https://komodoplatform.com/en"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://coinsutra.com/komodo-cryptocurrency-kmd/"];
        // 5. Subreddit
        [infoArray addObject:@"/r/komodoplatform/"];
        // 6. Github
        [infoArray addObject:@"/KomodoPlatform"];
        // 7. Twitter Handle
        [infoArray addObject:@"KomodoPlatform"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"Given the anonymity aspect,all team members use aliases,jl777(lead developer)"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Feels early,not clear how much adoption they have"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Binance"];
        // 12. Known Exchanges
        [infoArray addObject:@"Binance,Bittrex,Upbit"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"Not Available"];
    }
    
    else if ([ticker caseInsensitiveCompare:@"KCS"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"Like Binance coin,this coin is issued by the Kucoin cryptocurrency exchange"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Users pay lower trading fees on Kucoin by using it,holders of KCS can earn a bonus"];
        // 3. Website
        [infoArray addObject:@"https://www.kucoin.com/#/"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://intro.kucoin.com"];
        // 5. Subreddit
        [infoArray addObject:@"/r/kucoin/"];
        // 6. Github
        [infoArray addObject:@"/Kucoin"];
        // 7. Twitter Handle
        [infoArray addObject:@"kucoincom"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"Hong Kong based,One of the Top 10 crypto exchanges,Michael Gan(CEO,ex Alibaba)"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"No one knows how China's negative stance on crypto impacts their future"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Kucoin"];
        // 12. Known Exchanges
        [infoArray addObject:@"Kucoin"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"Not Available"];
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"BAT"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"Platform for blockchain based digital advertising on a new browser: Brave"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Exchange of value between content creators,advertisers and users"];
        // 3. Website
        [infoArray addObject:@"https://basicattentiontoken.org"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://www.investinblockchain.com/what-is-basic-attention-token-bat/"];
        // 5. Subreddit
        [infoArray addObject:@"/r/BATProject/"];
        // 6. Github
        [infoArray addObject:@"/brave-intl/basic-attention-token-crowdsale"];
        // 7. Twitter Handle
        [infoArray addObject:@"AttentionToken"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"Solid team including the JavaScript creator.Funded by Pantera Capital & more"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Competing with Google,Facebook, etc.Long road to get to mainstream adoption"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Binance"];
        // 12. Known Exchanges
        [infoArray addObject:@"Binance,Bittrex,Upbit"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"https://basicattentiontoken.org/BasicAttentionTokenWhitePaper-4.pdf"];
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"BTM"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"Platform connecting digital assets with physical financial instruments"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Registration,exchange between cryptocurrencies & dividends,bonds,etc"];
        // 3. Website
        [infoArray addObject:@"http://bytom.io"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://themerkle.com/what-is-bytom/"];
        // 5. Subreddit
        [infoArray addObject:@"/r/BytomBlockchain/"];
        // 6. Github
        [infoArray addObject:@"/Bytom/bytom"];
        // 7. Twitter Handle
        [infoArray addObject:@"Bytom_Official"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"Strong China based team including Duan XinXing(Ex Vice President,OKCoin"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Still early,highly technical,Bytom blockchain released later this year"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Kucoin"];
        // 12. Known Exchanges
        [infoArray addObject:@"Kucoin,Huobi,OKEx"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"http://bytom.io/BytomWhitePaperV1.0_Economic_en.pdf"];
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"ARK"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"Ecosystem to connect the blockchain of every cryptocurrency together"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Execute ethereum(or another currency) based smart contract using ARK"];
        // 3. Website
        [infoArray addObject:@"https://ark.io"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://www.investinblockchain.com/what-is-ark/"];
        // 5. Subreddit
        [infoArray addObject:@"/r/ArkEcosystem/"];
        // 6. Github
        [infoArray addObject:@"/ArkEcosystem"];
        // 7. Twitter Handle
        [infoArray addObject:@"ArkEcosystem"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"Strong global team,Francois Xavier Thoorens(CTO,Ex Lead Developer Lisk)"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Criticism for Ark is that it is trying to do too many things at once"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Binance"];
        // 12. Known Exchanges
        [infoArray addObject:@"Binance,Bittrex,Upbit"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"Not Available"];
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"GNT"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"Global decentralized supercomputer made up by combining users’ machines"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Users with extra computational power can lend to other users for a price"];
        // 3. Website
        [infoArray addObject:@"https://golem.network"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://www.forbes.com/sites/rogeraitken/2016/11/12/fintech-golems-airbnb-for-computing-crowdsale-scores-8-6m-in-minutes/#61988fe83583"];
        // 5. Subreddit
        [infoArray addObject:@"/r/GolemProject/"];
        // 6. Github
        [infoArray addObject:@"/golemfactory/golem"];
        // 7. Twitter Handle
        [infoArray addObject:@"golemproject"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"Poland based team,Julian Zawistowski(CEO & Founder),Piotr Janiuk(CTO)"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Early days,with an ambitious vision that will require a lot of tech wins"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Bittrex"];
        // 12. Known Exchanges
        [infoArray addObject:@"Bittrex,Huobi,Poloniex"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"Not Available"];
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"SYS"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"The Swiss army knife of crypto platforms for creating blockchain applications"];
        // 2. Real World Use Cases
        [infoArray addObject:@"As a first use case,the team developed a secure,reliable marketplace for anything"];
        // 3. Website
        [infoArray addObject:@"https://syscoin.org"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://medium.com/@danieljasonwestby/syscoin-the-hidden-gem-of-2018-96f973b81b9"];
        // 5. Subreddit
        [infoArray addObject:@"/r/SysCoin/"];
        // 6. Github
        [infoArray addObject:@"/syscoin/"];
        // 7. Twitter Handle
        [infoArray addObject:@"syscoin"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"Microsoft Azure is a partner,Sebastian Schepis(Creator & Core developer)"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Core use case is not clear. Are they a marketplace or a blockchain platform ?"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Bittrex"];
        // 12. Known Exchanges
        [infoArray addObject:@"Bittrex,Upbit,Poloniex"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"http://whitepaper.syscoin.org/"];
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"ETHOS"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"People powered cryptocurrency platform for storing & exchanging crypto assets"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Secure,universal wallet to store,exchange & invest in crypto assets"];
        // 3. Website
        [infoArray addObject:@"https://www.ethos.io"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://bitcoinexchangeguide.com/ethos/"];
        // 5. Subreddit
        [infoArray addObject:@"/r/ethos_io/"];
        // 6. Github
        [infoArray addObject:@"Not Available"];
        // 7. Twitter Handle
        [infoArray addObject:@"Ethos_io"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"Shingo Lavine(Founder,early crypto expert,enrolled in Brown University)"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"The use case for this being on the blockchain is not super clear"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Binance"];
        // 12. Known Exchanges
        [infoArray addObject:@"Binance,HitBTC,CoinExchange"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"http://www.ethos.io/Ethos_Whitepaper.pdf"];
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"DRGN"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"Platform for businesses to create Blockchain apps,originally built by Disney"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Ability to keep proprietary business logic private when building blockchain apps"];
        // 3. Website
        [infoArray addObject:@"https://dragonchain.com"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://www.investinblockchain.com/what-is-dragonchain/"];
        // 5. Subreddit
        [infoArray addObject:@"/r/drgn/"];
        // 6. Github
        [infoArray addObject:@"/dragonchain/dragonchain"];
        // 7. Twitter Handle
        [infoArray addObject:@"dragonchaingang"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"Joe Roets(Lead Developer,ex Disney),7 member experienced team (many ex Disney)"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Competing with the likes of Ethereum and Neo which have a lot of momentum"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Kucoin"];
        // 12. Known Exchanges
        [infoArray addObject:@"Kucoin"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"https://dragonchain.com/assets/Dragonchain_Business_Summary.pdf"];
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"PIVX"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"Open source cryptocurrency focused on fast private transactions"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Fast private transactions with low transaction fees & small environmental footprint"];
        // 3. Website
        [infoArray addObject:@"https://pivx.org"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://captainaltcoin.com/what-is-pivx-coin/"];
        // 5. Subreddit
        [infoArray addObject:@"/r/pivx/"];
        // 6. Github
        [infoArray addObject:@"/PIVX-Project/PIVX/"];
        // 7. Twitter Handle
        [infoArray addObject:@"_pivx"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"Diverse community based team,s3v3n h4cks(Chief Visionary),Coin Server(Sys Admin)"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Because of the emphasis on privacy,PIVX is susceptible to criminal activity"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Binance"];
        // 12. Known Exchanges
        [infoArray addObject:@"Binance,Bittrex,Upbit"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"https://pivx.org/what-is-pivx/white-papers/"];
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"DGB"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"Created as a faster,more secure alternative to Bitcoin,reaching a wider community"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Focused on secure & super fast transactions for digital payments"];
        // 3. Website
        [infoArray addObject:@"https://www.digibyte.io"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://www.investinblockchain.com/what-is-digibyte/"];
        // 5. Subreddit
        [infoArray addObject:@"/r/Digibyte/"];
        // 6. Github
        [infoArray addObject:@"/digibyte"];
        // 7. Twitter Handle
        [infoArray addObject:@"DigiByteCoin"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"Selected to Microsoft's BizSpark startups program,Jared Tate(very public founder)"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Overtaken by other fast moving projects,yet to see significant mainstream adoption"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Kucoin"];
        // 12. Known Exchanges
        [infoArray addObject:@"Kucoin,Bittrex,Poloniex"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"Not Available"];
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"CNX"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"Global cryptocurrency to exchange any world's currencies for any cryptocurrencies"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Aiming ot be the go to way to exchange world’s currencies for any cryptocurrencies"];
        // 3. Website
        [infoArray addObject:@"https://cryptonex.org"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://themerkle.com/what-is-cryptonex/"];
        // 5. Subreddit
        [infoArray addObject:@"/user/Cryptonex-CNX"];
        // 6. Github
        [infoArray addObject:@"/Cryptonex"];
        // 7. Twitter Handle
        [infoArray addObject:@"Cryptonex_CNX"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"Swiss origins,small team led by Pavel Kalinin(Founder & Managing Director)"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Still plenty of work to be done before Cryptonex reaches its full potential"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"HitBTC"];
        // 12. Known Exchanges
        [infoArray addObject:@"HitBTC,YoBit"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"https://cryptonex.org/pdf/whitepaper.pdf"];
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"CNX"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"Global cryptocurrency to exchange any world's currencies for any cryptocurrencies"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Aiming ot be the go to way to exchange world’s currencies for any cryptocurrencies"];
        // 3. Website
        [infoArray addObject:@"https://cryptonex.org"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://themerkle.com/what-is-cryptonex/"];
        // 5. Subreddit
        [infoArray addObject:@"/user/Cryptonex-CNX"];
        // 6. Github
        [infoArray addObject:@"/Cryptonex"];
        // 7. Twitter Handle
        [infoArray addObject:@"Cryptonex_CNX"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"Swiss origins,small team led by Pavel Kalinin(Founder & Managing Director)"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Still plenty of work to be done before Cryptonex reaches its full potential"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"HitBTC"];
        // 12. Known Exchanges
        [infoArray addObject:@"HitBTC,YoBit"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"https://cryptonex.org/pdf/whitepaper.pdf"];
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"ZIL"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"High throughput blockchain platform for thousands ​of transactions per second"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Enable decentralised apps in the areas of machine learning & financial algorithms"];
        // 3. Website
        [infoArray addObject:@"https://www.zilliqa.com"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://coincentral.com/zilliqa-beginners-guide/"];
        // 5. Subreddit
        [infoArray addObject:@"/r/zilliqa/"];
        // 6. Github
        [infoArray addObject:@"/Zilliqa/Zilliqa"];
        // 7. Twitter Handle
        [infoArray addObject:@"zilliqa"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"Singapore based,highly technical team of Computer Scientists,Xinshu Dong(CEO)"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Still early days,main product launching in Q3 2018"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Huobi"];
        // 12. Known Exchanges
        [infoArray addObject:@"Huobi"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"https://docs.zilliqa.com/zilliqa-slides-updated.pdf"];
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"MONA"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"The first Japanese Cryptocurrency,a popular favorite altcoin there"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Form of payment especially at e commerce websites"];
        // 3. Website
        [infoArray addObject:@"https://monacoin.org"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://youtu.be/lIg0ub_VWjk"];
        // 5. Subreddit
        [infoArray addObject:@"/r/monacoin/"];
        // 6. Github
        [infoArray addObject:@"/monacoinproject/monacoin"];
        // 7. Twitter Handle
        [infoArray addObject:@"Not Available"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"Gaining acceptance in Japan especially in stores like Ark Electronics"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Anonymous founder,no major financial backing or partnerships,vision unclear"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Bittrex"];
        // 12. Known Exchanges
        [infoArray addObject:@"Bittrex,Upbit,Zaif"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"https://docs.zilliqa.com/zilliqa-slides-updated.pdf"];
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"FCT"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"Blockchain based platform to preserve,ensure & validate digital assets"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Share,audit & exchange sensitive documents quickly via an API"];
        // 3. Website
        [infoArray addObject:@"https://www.factom.com"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://coincentral.com/factom-beginner-guide/"];
        // 5. Subreddit
        [infoArray addObject:@"/r/factom/"];
        // 6. Github
        [infoArray addObject:@"/FactomProject"];
        // 7. Twitter Handle
        [infoArray addObject:@"factom"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"Austin based,partnerships with Department of Homeland Security,Gates Foundation"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Marketing hasn’t been the team’s focus,high profile competitor in NEM"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Bittrex"];
        // 12. Known Exchanges
        [infoArray addObject:@"Bittrex,Upbit,Poloniex"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"Not Available"];
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"AION"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"3rd gen blockchain network with superior scalability,privacy & interoperability"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Seamlessly integrate dissimilar blockchain systems e.g. an ethereum & AION system"];
        // 3. Website
        [infoArray addObject:@"https://www.factom.com"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://coincoaching.com/aion-crypto-invest-aion-coin/"];
        // 5. Subreddit
        [infoArray addObject:@"/r/AionNetwork/"];
        // 6. Github
        [infoArray addObject:@"/aionnetwork"];
        // 7. Twitter Handle
        [infoArray addObject:@"Aion_Network"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"20+ person team based out of Canada,Ontario Govt,Moog(Partners)"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"High profile competitor in ARK,Complex business model will take time to play out"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Binance"];
        // 12. Known Exchanges
        [infoArray addObject:@"Binance,Kucoin"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"https://aion.network/whitepapers.html"];
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"LRC"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"A Decentralized Exchange & Open Protocol"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Crypto exchange with reduced risk & optimized results for traders"];
        // 3. Website
        [infoArray addObject:@"https://loopring.org/en/index.html"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://themerkle.com/what-is-loopring/"];
        // 5. Subreddit
        [infoArray addObject:@"/r/loopringorg/"];
        // 6. Github
        [infoArray addObject:@"/loopring"];
        // 7. Twitter Handle
        [infoArray addObject:@"loopringorg"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"Daniel Feng(Founder,Ex Google).Solid advisory team:Da Hongfei(NEO founder) & more"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Early days,remains to be seen if their vision will be realized"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Binance"];
        // 12. Known Exchanges
        [infoArray addObject:@"Binance,HitBTC"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"https://github.com/Loopring/whitepaper/raw/master/en_whitepaper.pdf"];
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"ELF"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"Customizable operating system (OS) for blockchains focused on scalability"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Create and run blockchain apps like ethereum that scale well"];
        // 3. Website
        [infoArray addObject:@"https://aelf.io"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://coincentral.com/aelf-beginner-guide/"];
        // 5. Subreddit
        [infoArray addObject:@"Not Available"];
        // 6. Github
        [infoArray addObject:@"/aelfProject"];
        // 7. Twitter Handle
        [infoArray addObject:@"aelfblockchain"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"Large VC firms like FGB Capital,Michael Arrington(TechCrunch founder)"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Being relatively new puts them further back than similar projects"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Binance"];
        // 12. Known Exchanges
        [infoArray addObject:@"Binance,Huobi"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"https://grid.hoopox.com/aelf%20presentation-EN.pdf"];
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"ELF"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"Customizable operating system (OS) for blockchains focused on scalability"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Create and run blockchain apps like ethereum that scale well"];
        // 3. Website
        [infoArray addObject:@"https://aelf.io"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://coincentral.com/aelf-beginner-guide/"];
        // 5. Subreddit
        [infoArray addObject:@"Not Available"];
        // 6. Github
        [infoArray addObject:@"/aelfProject"];
        // 7. Twitter Handle
        [infoArray addObject:@"aelfblockchain"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"Large VC firms like FGB Capital,Michael Arrington(TechCrunch founder)"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Being relatively new puts them further back than similar projects"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Binance"];
        // 12. Known Exchanges
        [infoArray addObject:@"Binance,Huobi"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"https://grid.hoopox.com/aelf%20presentation-EN.pdf"];
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"GBYTE"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"The cryptocurrency with no blockchain"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Conditional crypto payments,send cryptocurrency to email or via chat,P2P Betting"];
        // 3. Website
        [infoArray addObject:@"https://byteball.org"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://www.coinbureau.com/education/what-is-byteball-cryptocurrency-with-no-blockchain/"];
        // 5. Subreddit
        [infoArray addObject:@"/r/ByteBall/"];
        // 6. Github
        [infoArray addObject:@"/byteball"];
        // 7. Twitter Handle
        [infoArray addObject:@"ByteballOrg"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"Anton Churyumov(Founder)"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Information on team, vision, etc not available on the website"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Bittrex"];
        // 12. Known Exchanges
        [infoArray addObject:@"Bittrex,Upbit"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"https://byteball.org/Byteball.pdf"];
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"QASH"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"Aiming to bring liquidity to the cryptocurrency space"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Easily buy cryptocurrency with & cash out to fiat(i.e. currencies like USD)"];
        // 3. Website
        [infoArray addObject:@"https://liquid.plus/#home"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://coincentral.com/qash-beginner-guide/"];
        // 5. Subreddit
        [infoArray addObject:@"/r/LiquidQASH/"];
        // 6. Github
        [infoArray addObject:@"Not Available"];
        // 7. Twitter Handle
        [infoArray addObject:@"QUOINE_SG"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"Mike Kayamori(CEO,ex SVP Softbank),Mario Lozada(CTO,ex CTO Merrill Lynch Japan)"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Competing against popular exchanges like Binance,Coinbase/GDAX & more"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Huobi"];
        // 12. Known Exchanges
        [infoArray addObject:@"Huobi,Quoine"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"https://s3-ap-southeast-1.amazonaws.com/liquid-site/quoine-liquid_v1.9.pdf"];
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"SALT"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"Providing Blockchain Backed Loans"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Leverage your blockchain assets(cryptocurrencies) to secure cash loans"];
        // 3. Website
        [infoArray addObject:@"https://www.saltlending.com"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://www.investinblockchain.com/what-is-salt/"];
        // 5. Subreddit
        [infoArray addObject:@"/r/SaltCoin/"];
        // 6. Github
        [infoArray addObject:@"Not Available"];
        // 7. Twitter Handle
        [infoArray addObject:@"SaltLending"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"Very strong US based team,notable advisors like Erik Voorhees(Bitcoin influencer)"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Early days with the lending platform having launched in Dec 2017"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Binance"];
        // 12. Known Exchanges
        [infoArray addObject:@"Binance,Bittrex,Upbit"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"https://crushcrypto.com/wp-content/uploads/2017/08/SALT-abstract.pdf"];
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"NAS"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"Decentralized Search Framework,think Google but for Blockchain data"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Search engine for queries like which blockchain project is gaining traction"];
        // 3. Website
        [infoArray addObject:@"https://nebulas.io"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://coincentral.com/nebulas-nas-beginners-guide/"];
        // 5. Subreddit
        [infoArray addObject:@"/r/nebulas/"];
        // 6. Github
        [infoArray addObject:@"/nebulasio"];
        // 7. Twitter Handle
        [infoArray addObject:@"nebulasio"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"Very strong team,Hitters Xu(CEO,Founder of NEO),Chris McCann(Advisor,Greylock)"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Early days with the mainnet launching in Q1 2018"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Huobi"];
        // 12. Known Exchanges
        [infoArray addObject:@"Huobi,OKEx"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"https://nebulas.io/docs/NebulasTechnicalWhitepaper.pdf"];
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"FUN"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"Blockchain platform to make it easier for new entities to launch online casinos"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Decentralization removes single point of failure,Offers transparency"];
        // 3. Website
        [infoArray addObject:@"https://funfair.io"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://themerkle.com/what-is-funfair/"];
        // 5. Subreddit
        [infoArray addObject:@"/r/FunfairTech/"];
        // 6. Github
        [infoArray addObject:@"Not Available"];
        // 7. Twitter Handle
        [infoArray addObject:@"FunFairTech"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"Sizeable 25+ British team,Jez San(CEO,extensive gaming/online poker experience)"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Very early,considered in beta,with major product launches in Q1 2018"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Binance"];
        // 12. Known Exchanges
        [infoArray addObject:@"Binance,HitBTC"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"https://funfair.io/explore/whitepapers/"];
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"XZC"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"Crypto for private transactions,enabled by the Zerocoin Protocol"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Private financial transactions"];
        // 3. Website
        [infoArray addObject:@"https://zcoin.io"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://youtu.be/aEbawhzhLqM"];
        // 5. Subreddit
        [infoArray addObject:@"/r/zcoin/"];
        // 6. Github
        [infoArray addObject:@"/zcoin/"];
        // 7. Twitter Handle
        [infoArray addObject:@"zcoinofficial"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"15+ team,Poramin Insom(Founder,Lead Developer)"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Competing with other private currencies,especially the popular Monero"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Binance"];
        // 12. Known Exchanges
        [infoArray addObject:@"Binance,Bittrex,Upbit"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"https://zcoin.io/tech/"];
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"PART"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"Platform to build blockchain apps with enhanced privacy"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Built an anonymous marketplace for buyers & sellers to trade securely"];
        // 3. Website
        [infoArray addObject:@"https://particl.io"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://bitcoinexchangeguide.com/particl/"];
        // 5. Subreddit
        [infoArray addObject:@"/r/Particl/"];
        // 6. Github
        [infoArray addObject:@"/particl"];
        // 7. Twitter Handle
        [infoArray addObject:@"ParticlProject"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"20+ international team,Ryno Mathee(Lead Developer,Ex Lead Dev ShadowCash)"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Still early days as it was launched in March 2017"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Bittrex"];
        // 12. Known Exchanges
        [infoArray addObject:@"Bittrex,Upbit"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"Not Available"];
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"RDD"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"Social digital currency for the general public"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Microtransactions in social networks e.g. tipping in Reddit,where it got it's name"];
        // 3. Website
        [infoArray addObject:@"https://www.reddcoin.com"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://youtu.be/KlYJ0sNVVpg"];
        // 5. Subreddit
        [infoArray addObject:@"/r/reddCoin/"];
        // 6. Github
        [infoArray addObject:@"/reddcoin-project/reddcoin"];
        // 7. Twitter Handle
        [infoArray addObject:@"reddcoin"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"5+ international team,John McAfee(McAfee creator pumped it in a tweet in Dec 2017)"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Rose almost too quickly when John McAfee tweeted about it"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Bittrex"];
        // 12. Known Exchanges
        [infoArray addObject:@"Bittrex,Upbit"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"Not Available"];
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"KNC"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"Instant liquid exchange for cryptocurrencies"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Exchange cryptocurrencies & liquidate instantly(faster than regular exchanges)"];
        // 3. Website
        [infoArray addObject:@"https://kyber.network"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://coincentral.com/kyber-network-beginner-guide/"];
        // 5. Subreddit
        [infoArray addObject:@"/r/kybernetwork/"];
        // 6. Github
        [infoArray addObject:@"/kybernetwork"];
        // 7. Twitter Handle
        [infoArray addObject:@"KyberNetwork"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"Impressive team,Loi Luu(CEO),Vitalik Buterin(Ethereum Founder,Advisor)"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Still early days,live product launching in Q1 of 2018"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Binance"];
        // 12. Known Exchanges
        [infoArray addObject:@"Binance,Huobi,Kucoin"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"https://kyber.network/assets/KyberNetworkWhitepaper.pdf"];
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"DENT"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"Blockchain based mobile data trading"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Users can buy & sell their mobile data with each other using a mobile app"];
        // 3. Website
        [infoArray addObject:@"https://www.dentwireless.com"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://www.dentwireless.com/faq"];
        // 5. Subreddit
        [infoArray addObject:@"/r/dentcoin/"];
        // 6. Github
        [infoArray addObject:@"Not Available"];
        // 7. Twitter Handle
        [infoArray addObject:@"dentcoin"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"Strong Hong Kong based team,Tero Katajainen(CEO & Founder),PLDT Hong Kong(Partner)"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Very ambitious,will need to get the large telcos on board"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Kucoin"];
        // 12. Known Exchanges
        [infoArray addObject:@"Kucoin,HitBTC"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"https://www.dentwireless.com/whitepaper"];
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"IOST"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"Blockchain platform that is targeting up to 100,000 transactions per second"];
        // 2. Real World Use Cases
        [infoArray addObject:@"For large organizations to build blockchain apps with high throughput needs"];
        // 3. Website
        [infoArray addObject:@"https://iost.io"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://cryptoslate.com/introduction-iostoken-blockchain-internet-services/"];
        // 5. Subreddit
        [infoArray addObject:@"/r/IOStoken/"];
        // 6. Github
        [infoArray addObject:@"Not Available"];
        // 7. Twitter Handle
        [infoArray addObject:@"IOStoken"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"15+ highly technical team,Ryan Bubinski(Advisor, Co founder of Code Academy)"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Still early,difficult to understand their business model"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Binance"];
        // 12. Known Exchanges
        [infoArray addObject:@"Binance,Huobi"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"https://docsend.com/view/ihwqcdg"];
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"GXS"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"Decentralized data exchange based on Blockchain"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Enabling data flows in things like online lending,consumer loans,banking"];
        // 3. Website
        [infoArray addObject:@"https://gxs.gxb.io/en/"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://themerkle.com/what-is-gxshares/"];
        // 5. Subreddit
        [infoArray addObject:@"/r/GXS/"];
        // 6. Github
        [infoArray addObject:@"/gxchain"];
        // 7. Twitter Handle
        [infoArray addObject:@"gongxinbao"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"15+ China based team,Minqiang Huang(CEO,Founder)"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Off to a good start but there's no public roadmap"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Binance"];
        // 12. Known Exchanges
        [infoArray addObject:@"Binance,Gate.io"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"https://gxs.gxb.io/download/GXB_Blockchain_White_Paper_v1.2_EN.pdf"];
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"NEBL"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"Blockchain platform to build enterprise applications & services"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Providing businesses easy to use tools to build distributed apps"];
        // 3. Website
        [infoArray addObject:@"https://nebl.io"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://themerkle.com/what-is-neblio/"];
        // 5. Subreddit
        [infoArray addObject:@"/r/Neblio/"];
        // 6. Github
        [infoArray addObject:@"/NeblioTeam"];
        // 7. Twitter Handle
        [infoArray addObject:@"NeblioTeam"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"5 person team,Eddy Smith(Co Founder & Lead Developer)"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Early days with a marketing campaign launch scheduled for Q2 2018"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Binance"];
        // 12. Known Exchanges
        [infoArray addObject:@"Binance,Kucoin"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"https://nebl.io/wp-content/uploads/2017/07/NeblioWhitepaper.pdf"];
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"KIN"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"Cryptocurrency from Kik,a popular Canadian social networking app"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Change traditional advertising models e.g. pay using Kin for exclusive content"];
        // 3. Website
        [infoArray addObject:@"https://kinecosystem.org"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://blokt.com/icos/kin-review"];
        // 5. Subreddit
        [infoArray addObject:@"/r/KinFoundation/"];
        // 6. Github
        [infoArray addObject:@"/kinfoundation"];
        // 7. Twitter Handle
        [infoArray addObject:@"kin_foundation"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"Ted Livingston(CEO,Kik),Fred Wilson(Union Square Ventures),Kik's 15 mn users"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Early days,not clear how well Kik,to which Kin is tied,itself is doing"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Bancor Network"];
        // 12. Known Exchanges
        [infoArray addObject:@"Bancor Network,Mercatox"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"https://kinecosystem.org/static/files/Kin_Whitepaper_V1_English.pdf"];
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"BLOCK"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"Platform to build apps that operate across different blockchains"];
        // 2. Real World Use Cases
        [infoArray addObject:@"1st app being released is a Decentralized exchange of different crypto assets"];
        // 3. Website
        [infoArray addObject:@"https://blocknet.co/index.html"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://coincentral.com/blocknet-block-beginners-guide/"];
        // 5. Subreddit
        [infoArray addObject:@"/r/theblocknet/"];
        // 6. Github
        [infoArray addObject:@"/BlocknetDX/"];
        // 7. Twitter Handle
        [infoArray addObject:@"The_Blocknet"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"Dan Metcalf & Arlyn Culwick(Co Founders),0x Protocol & Poloniex(Partners)"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Limited information available on the team"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Bittrex"];
        // 12. Known Exchanges
        [infoArray addObject:@"Bittrex,Upbit"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"Not Available"];
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"POWR"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"Peer to peer marketplace for renewable energy"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Enabling customers & businesses to sell their power without a middleman"];
        // 3. Website
        [infoArray addObject:@"https://powerledger.io"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://powerledger.io/#video-popup"];
        // 5. Subreddit
        [infoArray addObject:@"/r/PowerLedger/"];
        // 6. Github
        [infoArray addObject:@"Not Available"];
        // 7. Twitter Handle
        [infoArray addObject:@"PowerLedger_io"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"Super strong Australian team of 25+ people,Bill Tai(Advisor,High Profile VC)"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Very ambitious & very early,marketing launch expected Q3 2018"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Bittrex"];
        // 12. Known Exchanges
        [infoArray addObject:@"Bittrex,Upbit"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"https://tge.powerledger.io/media/Power-Ledger-Whitepaper-v3.pdf"];
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"DCN"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"Blockchain solution for the global dental industry"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Create a marketplace directly between patients and dentists including trusted reviews"];
        // 3. Website
        [infoArray addObject:@"https://dentacoin.com"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://blockonomi.com/dentacoin-guide/"];
        // 5. Subreddit
        [infoArray addObject:@"/r/Dentacoin/"];
        // 6. Github
        [infoArray addObject:@"/Dentacoin"];
        // 7. Twitter Handle
        [infoArray addObject:@"dentacoin"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"20 person team out of Bulgaria,Prof Dr Dimitar Dimitrakiev,Philipp Grenzebach(Co founders)"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Difficult to understand the value proposition from a blckchain perspective"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"HitBTC"];
        // 12. Known Exchanges
        [infoArray addObject:@"HitBTC,Cryptopia"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"https://dentacoin.com/web/white-paper/Whitepaper-en1.pdf"];
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"ICN"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"Platform for users to invest in and manage digital assets"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Create & invest in digital asset arrays e.g. an index fund of cryptocurrencies"];
        // 3. Website
        [infoArray addObject:@"https://www.iconomi.net"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://blockonomi.com/iconomi-guide/"];
        // 5. Subreddit
        [infoArray addObject:@"/r/ICONOMI/"];
        // 6. Github
        [infoArray addObject:@"Not Available"];
        // 7. Twitter Handle
        [infoArray addObject:@"iconominet"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"Small Slovenia based team,Tim M. Zagar(CEO) & Jani Valjavec(CTO) founded it in 2016"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Still early days,as the product is currently in beta mode"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Binance"];
        // 12. Known Exchanges
        [infoArray addObject:@"Binance,Kraken"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"Not Available"];
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"LINK"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"Bridging blockchain apps to off chain resources like data feeds or APIs"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Developers building Ethereum apps can incorporate APIs e.g. for bank accounts"];
        // 3. Website
        [infoArray addObject:@"https://www.smartcontract.com"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://blockonomi.com/chainlink-guide/"];
        // 5. Subreddit
        [infoArray addObject:@"Not Available"];
        // 6. Github
        [infoArray addObject:@"Not Available"];
        // 7. Twitter Handle
        [infoArray addObject:@"Smart_Contract"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"San Francisco based,Sergey Nazarov(CEO),Partnership with SWIFT(think Swift code)"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Do not show a roadmap,general lack of marketing & concrete updates,still early"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Binance"];
        // 12. Known Exchanges
        [infoArray addObject:@"Binance,Huobi"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"Not Available"];
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"POLY"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"The Securities Token platform"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Enables launching ICOs legally with KYC & more baked in"];
        // 3. Website
        [infoArray addObject:@"https://www.polymath.network"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://themerkle.com/what-is-polymath/"];
        // 5. Subreddit
        [infoArray addObject:@"/r/PolymathNetwork/"];
        // 6. Github
        [infoArray addObject:@"/PolymathNetwork"];
        // 7. Twitter Handle
        [infoArray addObject:@"PolymathNetwork"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"Trevor Koverko(CEO)"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"The platform is still in its nascent stages"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Kucoin"];
        // 12. Known Exchanges
        [infoArray addObject:@"Kucoin"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"https://www.polymath.network/resources/whitepaper"];
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"BNT"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"Decentralized liquidity network for crypto tokens"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Exchange of crypto currencies at low cost"];
        // 3. Website
        [infoArray addObject:@"https://about.bancor.network"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://about.bancor.network/network"];
        // 5. Subreddit
        [infoArray addObject:@"/r/Bancor/"];
        // 6. Github
        [infoArray addObject:@"/bancorprotocol/"];
        // 7. Twitter Handle
        [infoArray addObject:@"Bancor"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"Switzerland based 10+ people team,Tim Draper(Advisor,Venture Capitalist)"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Founded in 2017 it's still early days for this venture"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Binance"];
        // 12. Known Exchanges
        [infoArray addObject:@"Binance,Bancor Network"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"https://about.bancor.network/Whitepaper"];
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"NXT"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"Blockchain platform with asset exchange & monetary systems capabilities"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Platform for people to build & launch their own cryptocurrencies"];
        // 3. Website
        [infoArray addObject:@"https://nxtplatform.org"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://www.investinblockchain.com/what-is-nxt/"];
        // 5. Subreddit
        [infoArray addObject:@"/r/NXT/"];
        // 6. Github on bitbucket /JeanLucPicard/nxt/src
        [infoArray addObject:@"Not Available"];
        // 7. Twitter Handle
        [infoArray addObject:@"NxtCommunity"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"Run by Jelurida B.V.(Same small Holland based company that runs Ardor as well)"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Ardor is the new version of NXT,time will tell how active the NXT development is"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Bittrex"];
        // 12. Known Exchanges
        [infoArray addObject:@"Bittrex,HitBTC"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"Not Available"];
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"PAY"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"Spend virtual currencies — anytime,anywhere"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Provides a debit card to load your cryptos & use them for daily transcations"];
        // 3. Website
        [infoArray addObject:@"https://www.tenx.tech"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://www.investinblockchain.com/interview-tenx/"];
        // 5. Subreddit
        [infoArray addObject:@"r/TenX/"];
        // 6. Github
        [infoArray addObject:@"Not Available"];
        // 7. Twitter Handle
        [infoArray addObject:@"tenxwallet"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"Strong team,Advisors:Vitalik Buterin(Ethereum Founder),Bo Shen(Fenbushi Capital)"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Still early days in the development of this product"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Bittrex"];
        // 12. Known Exchanges
        [infoArray addObject:@"Bittrex,Kucoin"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"https://www.tenx.tech/whitepaper/tenx_whitepaper_final.pdf"];
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"ENG"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"Scalable privacy for every blockchain"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Platform to enable privacy of blockchain data & solve blockchain's scaling issues"];
        // 3. Website
        [infoArray addObject:@"https://enigma.co"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://youtu.be/qeJn8YgDIlw"];
        // 5. Subreddit
        [infoArray addObject:@"/r/enigmacatalyst/"];
        // 6. Github
        [infoArray addObject:@"/enigmampc"];
        // 7. Twitter Handle
        [infoArray addObject:@"EnigmaMPC"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"10+ growing team,Guy Zyskind(Ex MIT Blockchain Researcher,CEO & Founder)"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Same challenge as other platforms,early days,will need adoption to succeed"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Binance"];
        // 12. Known Exchanges
        [infoArray addObject:@"Binance,Bittrex,Huobi"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"Not Available"];
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"NXS"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"Quantum resistant 3D blockchain using communication satellites in space"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Creating a super secure,faster,reliable & truly decentralized cryptocurrency"];
        // 3. Website
        [infoArray addObject:@"https://nexusearth.com"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://coincentral.com/nexus-nxs-beginners-guide/"];
        // 5. Subreddit
        [infoArray addObject:@"/r/nexusearth/"];
        // 6. Github
        [infoArray addObject:@"/Nexusoft/"];
        // 7. Twitter Handle
        [infoArray addObject:@"NxsEarth"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"Colin Cantrell(Founder),Partners:Vector Space Systems,SingularityNET"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Super Ambitious,lot of future work to be done on building out the product pieces"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Bittrex"];
        // 12. Known Exchanges
        [infoArray addObject:@"Bittrex,Upbit"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"https://nexusearth.com/white-paper/"];
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"REQ"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"A network built on Ethereum,which allows anyone,anywhere to request a payment"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Anyone can generate an invoice that the recipient can pay without a 3rd party"];
        // 3. Website
        [infoArray addObject:@"https://request.network/#/"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://blockonomi.com/request-guide/"];
        // 5. Subreddit
        [infoArray addObject:@"/r/RequestNetwork/"];
        // 6. Github
        [infoArray addObject:@"/RequestNetwork/"];
        // 7. Twitter Handle
        [infoArray addObject:@"RequestNetwork"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"Very strong team that created MoneyTis,a money transfer service.YCombinator backed"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"While to go before the vision is fully realized"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Binance"];
        // 12. Known Exchanges
        [infoArray addObject:@"Binance,Kucoin"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"https://request.network/#"];
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"MAID"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"A decentralized autonomous internet"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Infrastructure to publish & consume data without human intervention"];
        // 3. Website
        [infoArray addObject:@"https://maidsafe.net"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://www.investinblockchain.com/what-is-maidsafe/"];
        // 5. Subreddit
        [infoArray addObject:@"/r/safenetwork/"];
        // 6. Github
        [infoArray addObject:@"/maidsafe"];
        // 7. Twitter Handle
        [infoArray addObject:@"maidsafe"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"Started in 2006 by Scottish engineer David Irvine,Scotland based"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Trying to recreate the internet is super ambitious,adoption will be everything"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Bittrex"];
        // 12. Known Exchanges
        [infoArray addObject:@"Bittrex,HitBTC,Poloniex"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"Not Available"];
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"CND"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"Hybrid Intelligence platform for effective asset management"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Combines financial analysts & artificial intelligence to invest better"];
        // 3. Website
        [infoArray addObject:@"https://cindicator.com"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://coincentral.com/cindicator-beginners-guide/"];
        // 5. Subreddit
        [infoArray addObject:@"/r/Cindicator/"];
        // 6. Github
        [infoArray addObject:@"Not Available"];
        // 7. Twitter Handle
        [infoArray addObject:@"Crowd_indicator"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"Super strong Russian team,Mike Brusov(CEO),Charlie Shrem(Bitcoin Foundation,Advisor)"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Not Available"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Binance"];
        // 12. Known Exchanges
        [infoArray addObject:@"Binance,HitBTC"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"Not Available"];
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"EMC"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"Built from Bitcoin code,it's a platform for exchange without a central authority"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Fast,safe & inexpensive exchange of money & information"];
        // 3. Website
        [infoArray addObject:@"https://emercoin.com/en"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://captainaltcoin.com/what-is-emercoin-coin/"];
        // 5. Subreddit
        [infoArray addObject:@"/r/EmerCoin/"];
        // 6. Github
        [infoArray addObject:@"/emercoin/"];
        // 7. Twitter Handle
        [infoArray addObject:@"emercoin_press"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"Founded by 8 Russian developers,Eugene Shumilov(Founder,MD),Partners:Microsoft"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Highly technical value proposition,will need mass adoption"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Bittrex"];
        // 12. Known Exchanges
        [infoArray addObject:@"Bittrex,HitBTC"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"Not Available"];
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"AGI"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"The Decentralized Marketplace for Artificial Intelligence"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Lets anyone create,monetize & use AI at scale"];
        // 3. Website
        [infoArray addObject:@"https://singularitynet.io"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://coincentral.com/singularitynet-beginner-guide/"];
        // 5. Subreddit
        [infoArray addObject:@"/r/SingularityNet/"];
        // 6. Github
        [infoArray addObject:@"/singnet/singnet"];
        // 7. Twitter Handle
        [infoArray addObject:@"singularity_net"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"Super strong team,50+ AI Developers,10+ PhDs,Dr. Ben Goertzel(CEO,Chief Scientist)"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Still early,in alpha,launching a public beta sometime in the middle of 2018"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Kucoin"];
        // 12. Known Exchanges
        [infoArray addObject:@"Kucoin"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"https://public.singularitynet.io/whitepaper.pdf"];
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"PLR"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"Claims itself as the world’s best cryptocurrency & token wallet"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Users store all their cryptos & data in one wallet,share with others as they please"];
        // 3. Website
        [infoArray addObject:@"https://pillarproject.io"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://themerkle.com/what-is-pillar-cryptocurrency/"];
        // 5. Subreddit
        [infoArray addObject:@"/r/PillarProject/"];
        // 6. Github
        [infoArray addObject:@"/pillarwallet"];
        // 7. Twitter Handle
        [infoArray addObject:@"pillarwallet"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"London based,25+ people team,David Siegel(CEO)"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Slightly worrisome that the roadmap for Pillar appears a bit unclear"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"HitBTC"];
        // 12. Known Exchanges
        [infoArray addObject:@"HitBTC,Cryptopia"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"Not Available"];
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"SMART"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"Newer cryptocurrency with a rewards system for holding it"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Cryptocurrency that rewards you for holding it & also gives you voting rights"];
        // 3. Website
        [infoArray addObject:@"https://smartcash.cc/#top"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://globalcoinreport.com/smartcash-smart-smartcash-smart-hive-explained/"];
        // 5. Subreddit
        [infoArray addObject:@"/r/smartcash/"];
        // 6. Github
        [infoArray addObject:@"/smartcash"];
        // 7. Twitter Handle
        [infoArray addObject:@"scashofficial"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"20+ global team"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Not yet released,expected to launch 2018"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"HitBTC"];
        // 12. Known Exchanges
        [infoArray addObject:@"HitBTC,CryptoBridge"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"Not Available"];
        
    }
    
    else if ([ticker caseInsensitiveCompare:@"SRN"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"Creating the first cyber-protected,blockchain-enabled smart phones & PCs"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Secure device to simplify the use of cryptocurrency across multiple applications"];
        // 3. Website
        [infoArray addObject:@"https://sirinlabs.com"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://www.coindesk.com/blockchain-pocket-phone-behind-sirins-157-million-ico/"];
        // 5. Subreddit
        [infoArray addObject:@"/r/SirinLabs/"];
        // 6. Github
        [infoArray addObject:@"/sirin-labs"];
        // 7. Twitter Handle
        [infoArray addObject:@"SIRINLABS"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"Strong 30+ Switzerland based team,Moshe Hogeg(Founder),advisory ties to Ethereum"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Still early,very ambitious,will need partnerships to get adoption"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Bittrex"];
        // 12. Known Exchanges
        [infoArray addObject:@"Bittrex,Upbit,Huobi"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"https://sirinlabs.com/media/SIRINLABS_-_White_Paper.pdf"];
        
    }
    // Github is accurate from this point on. New descriptions to enter into sups db.
    else if ([ticker caseInsensitiveCompare:@"BTCP"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"Bitcoin fork that bills itself as more anonymous and secure than Bitcoin"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Taking private cryptocurrency transactions mainstream"];
        // 3. Website
        [infoArray addObject:@"https://btcprivate.org"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://coincentral.com/bitcoin-private-beginner-guide/"];
        // 5. Subreddit
        [infoArray addObject:@"/r/BitcoinPrivate/"];
        // 6. Github
        [infoArray addObject:@"/BTCPrivate/BitcoinPrivate"];
        // 7. Twitter Handle
        [infoArray addObject:@"bitcoinprivate"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"20 engineers,200 contributors,fast moving.Led by Rhett Creighton,Zclassic founder"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Zclassic,Bitcoin Private’s predecessor,has a sketchy past embroiled in controversy"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Trade Satoshi"];
        // 12. Known Exchanges
        [infoArray addObject:@"Trade Satoshi,Nanex"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"https://btcprivate.org/whitepaper.pdf"];
    }
    //
    else if ([ticker caseInsensitiveCompare:@"BCD"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"Another privacy & anonymity focused Bitcoin fork"];
        // 2. Real World Use Cases
        [infoArray addObject:@"Encrypt the amounts & balances of transactions,making them private"];
        // 3. Website
        [infoArray addObject:@"http://btcd.io/#/"];
        // 4. Best Detailed Description Weblink
        [infoArray addObject:@"https://cointelegraph.com/news/is-bitcoin-diamond-a-better-bitcoin"];
        // 5. Subreddit
        [infoArray addObject:@"Not Available"];
        // 6. Github
        [infoArray addObject:@"/eveybcd/BitcoinDiamond"];
        // 7. Twitter Handle
        [infoArray addObject:@"Not Available"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"Anonymous development team,Linke Yang(Advisor,Founder of China's 1st crypto exchange"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Similar to Monero,but it is doubtful their implementation is equally competent"];
        // 10. On the Fence (Countries, Institutions, People)
        [infoArray addObject:@"Not Available"];
        // 11. Best Exchange
        [infoArray addObject:@"Binance"];
        // 12. Known Exchanges
        [infoArray addObject:@"Binance,Kucoin,Huobi"];
        // 13. Best News Coverage Site
        [infoArray addObject:@"http://btcd.io/#/faq"];
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
        [infoArray addObject:@"Not Available"];
    }
    
    return infoArray;
} 

@end
