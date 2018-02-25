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
    
    NSMutableArray * infoArray = [NSMutableArray arrayWithCapacity:13];
    
    // NOTE:
    // Here are the assumed base URLS
    // Reddit: https://www.reddit.com
    // Github: https://github.com
    // Twitter: https://twitter.com/ and @ should be appended to form handle if needed.
    // If News Site is Not Available, then it is assumed we will use the best crypto news site whatever it is.
    
    if ([ticker caseInsensitiveCompare:@"BTC"] == NSOrderedSame) {
        // 1. Short Description
        [infoArray addObject:@"First cryptocurrency,it's an innovative payment network & a new kind of money"];
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
        [infoArray addObject:@"China,Jamie Dimon(JP Morgan),Tidjane Thiam(Credit Suisse)"];
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
        [infoArray addObject:@"/bitcoin/"];
        // 7. Twitter Handle
        [infoArray addObject:@"ethereumproject"];
        // 8. Backers (Countries, Institutions, People)
        [infoArray addObject:@"Japan,Russia,Germany,JP Morgan,Intel,Microsoft,Vitalik Buterin(Creator)"];
        // 9. Detractors (Countries, Institutions, People)
        [infoArray addObject:@"Say users have lost money to hacks,faulty code,human error"];
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
        [infoArray addObject:@"Argue it's centralized with Ripple Labs owning 60% of XRP tokens"];
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
        [infoArray addObject:@"Not Available"];
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
        [infoArray addObject:@"Fast & cheap cross border payments,Micropayments,Services for the underbanked"];
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
        [infoArray addObject:@"Not Available"];
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
        [infoArray addObject:@"Say it's not truly decentralized as some users have more power"];
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
        [infoArray addObject:@"Believe that this cryptocurrency is popular on the black market"];
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
        [infoArray addObject:@"Microsoft,Cisco,Samsung Artik,Dominik Schiener(Co Founder)"];
        // 9. Detractors (Countries, Institutions, People, Argument)
        [infoArray addObject:@"Say IOTA fans are trying to silence critics without discussion"];
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
        [infoArray addObject:@"Don't believe that TRON can succeed with Chinese media rules"];
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
        [infoArray addObject:@"Berlin based,Max Kordek & Olivier Beddows(co founders,crypto veterans"];
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
        [infoArray addObject:@"Say valuation is too high,considering their platform launched in Q4 2017"];
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
        [infoArray addObject:@"Point to a recent hack where a large amount of Nanos were stolen"];
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
        [infoArray addObject:@"https://www.icon.foundation/?lang=en"];
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
        [infoArray addObject:@"Point out that other blockchains might decide to not work with them"];
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
        [infoArray addObject:@"Point to politically charged backers,criticize the founders mining tax"];
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
        [infoArray addObject:@"No one knows how China's negative stance on crypto impacts their future."];
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
        [infoArray addObject:@"Are concerned that the development is not proceeding at an appreciable pace"];
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
