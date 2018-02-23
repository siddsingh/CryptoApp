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
        [infoArray addObject:@"Secure,private,and untraceable cryptocurrency"];
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
