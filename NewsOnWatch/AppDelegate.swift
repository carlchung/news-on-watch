//
//  AppDelegate.swift
//  NewsOnWatch
//
//  Created by carladmin on 3/6/15.
//  Copyright (c) 2015 MetaCreate / Carl Chung. All rights reserved.
//
struct GlobalVar {
    
    static let arrayFeedName : [String] = [
        "港台 本港新聞",
        "港台 兩岸新聞",
        "港台 國際新聞",
        "港台 財經新聞",
        "港台 體育新聞",
        "明報 即時港聞",
        "明報 即時經濟",
        "明報 即時地產",
        "明報 即時兩岸",
        "明報 即時國際",
        "明報 即時體育",
        "明報 即時娛樂",
        "雅虎新聞 港聞",
        "雅虎新聞 國際",
        "雅虎新聞 財經",
        "雅虎新聞 體育",
        "雅虎新聞 娛樂",
        "信報 即時財訊",
        "EJ Insight",
        "香港矽谷 科技新聞",
        "香港矽谷 移動通訊",
        //"蘋果動新聞",
        //"香港高登討論",
        "Goal"
    ]
    static let  arrayFeedKey : [String] = [
        "rthk_localnews",
        "rthk_chinataiwannews",
        "rthk_worldnews",
        "rthk_financenews",
        "rthk_sportsnews",
        "ming_rtnews",
        "ming_moneynews",
        "ming_realestate",
        "ming_greaterchina",
        "ming_worldnews",
        "ming_sports",
        "ming_entertainnews",
        "yahoo_hknews",
        "yahoo_worldnews",
        "yahoo_financenews",
        "yahoo_sportsnews",
        "yahoo_entnews",
        "hkej_financenews",
        "ejinsight",
        "hksilicon_technews",
        "hksilicon_mobile",
        //"apple_actionnews",
        //"HK_Golden",
        "goal_hk"
    ]
    static let  arrayUrl : NSDictionary = [
        "rthk_localnews":"http://rthk.hk/rthk/news/rss/c_expressnews_clocal.xml",
        "rthk_chinataiwannews":"http://rthk.hk/rthk/news/rss/c_expressnews_greaterchina.xml",
        "rthk_worldnews":"http://rthk.hk/rthk/news/rss/c_expressnews_cinternational.xml",
        "rthk_financenews":"http://rthk.hk/rthk/news/rss/c_expressnews_cfinance.xml",
        "rthk_sportsnews":"http://rthk.hk/rthk/news/rss/c_expressnews_csport.xml",
        "ming_rtnews":"http://news.mingpao.com/rss/ins/s00001.xml",
        "ming_moneynews":"http://news.mingpao.com/rss/ins/s00002.xml",
        "ming_realestate":"http://news.mingpao.com/rss/ins/s00003.xml",
        "ming_greaterchina":"http://news.mingpao.com/rss/ins/s00004.xml",
        "ming_worldnews":"http://news.mingpao.com/rss/ins/s00005.xml",
        "ming_sports":"http://news.mingpao.com/rss/ins/s00006.xml",
        "ming_entertainnews":"http://news.mingpao.com/rss/ins/s00007.xml",
        "yahoo_hknews":"http://hk.news.yahoo.com/rss/hong-kong",
        "yahoo_worldnews":"https://hk.news.yahoo.com/rss/world",
        "yahoo_financenews":"https://hk.news.yahoo.com/rss/business",
        "yahoo_sportsnews":"https://hk.news.yahoo.com/rss/sports",
        "yahoo_entnews":"https://hk.news.yahoo.com/rss/entertainment",
        "hkej_financenews":"http://www.hkej.com/rss/onlinenews.xml",
        "ejinsight":"http://www.ejinsight.com/feed/",
        "hksilicon_technews":"http://cdn.hksilicon.com/kb/articlerss/cat/48/",
        "hksilicon_mobile":"http://cdn.hksilicon.com/kb/articlerss/cat/50/",
        //"apple_actionnews":"http://rss.appleactionews.com/rss.xml",
        //"HK_Golden":"http://hkg.westkit.net/rss.php",
        "goal_hk":"http://www.goal.com/hk/feeds/news?fmt=rss"
    ]

    static let  arrayUrlCopyright : NSDictionary = [
        "rthk_localnews":"http://news.rthk.hk/rthk/ch/rss.htm",
        "rthk_chinataiwannews":"http://news.rthk.hk/rthk/ch/rss.htm",
        "rthk_worldnews":"http://news.rthk.hk/rthk/ch/rss.htm",
        "rthk_financenews":"http://news.rthk.hk/rthk/ch/rss.htm",
        "rthk_sportsnews":"http://news.rthk.hk/rthk/ch/rss.htm",
        "ming_rtnews":"http://news.mingpao.com/cfm/rss.cfm",
        "ming_moneynews":"http://news.mingpao.com/cfm/rss.cfm",
        "ming_realestate":"http://news.mingpao.com/cfm/rss.cfm",
        "ming_greaterchina":"http://news.mingpao.com/cfm/rss.cfm",
        "ming_worldnews":"http://news.mingpao.com/cfm/rss.cfm",
        "ming_sports":"http://news.mingpao.com/cfm/rss.cfm",
        "ming_entertainnews":"http://news.mingpao.com/cfm/rss.cfm",
        "yahoo_hknews":"https://hk.news.yahoo.com/sitemap/",
        "yahoo_worldnews":"https://hk.news.yahoo.com/sitemap/",
        "yahoo_financenews":"https://hk.news.yahoo.com/sitemap/",
        "yahoo_sportsnews":"https://hk.news.yahoo.com/sitemap/",
        "yahoo_entnews":"https://hk.news.yahoo.com/sitemap/",
        "hkej_financenews":"http://www.hkej.com/template/registration/jsp/show_rss_link.jsp",
        "ejinsight":"http://www.ejinsight.com",
        "hksilicon_technews":"http://www.hksilicon.com/",
        "hksilicon_mobile":"http://www.hksilicon.com/",
        //"apple_actionnews":"http://rss.appleactionews.com/rss.xml",
        //"HK_Golden":"http://www.westkit.net",
        "goal_hk":"http://www.goal.com/hk/"
    ]
}

/*
struct GlobalVar {


    static let arrayFeedName : [String] = ["港台 即時新聞",
        "港台 財經",
        "明報 即時港聞",
        "明報 即時經濟",
        "明報 即時國際",
        "BBC News World",
        "NY Times World",
        "NY Times U.S.",
        "NY Times Tech",
        "WSJ Market",
        "WSJ U.S.Business",
        "Deutsche Welle (Germany)",
        "NHKニュース 社会",
        "NHKニュース 政治",
        "NHKニュース 経済",
        "El Pais (Spain) World",
        "Straits Times Asia",
        "BBC Sport"
    ]
    static let  arrayFeedKey : [String] = ["rthk_rtnews",
        "rthk_moneynews",
        "ming_rtnews",
        "ming_moneynews",
        "ming_worldnews",
        "bbc_worldnews",
        "nytimes_world",
        "nytimes_us",
        "nytimes_tech",
        "wsj_marketnews",
        "wsj_usbusiness",
        "dw_allnews",
        "nhk_social",
        "nhk_politics",
        "nhk_economy",
        "elpais_world",
        "straits_asia",
        "bbc_sport"
    ]
    
    static let  arrayUrl : NSDictionary = ["rthk_rtnews":"http://rthk.hk/rthk/news/rss/c_expressnews.xml",
        "rthk_moneynews":"http://rthk.hk/rthk/news/rss/c_finance.xml",
        "ming_rtnews":"http://news.mingpao.com/rss/ins/s00001.xml",
        "ming_moneynews":"http://news.mingpao.com/rss/ins/s00002.xml",
        "ming_worldnews":"http://news.mingpao.com/rss/ins/s00005.xml",
        "bbc_worldnews":"http://feeds.bbci.co.uk/news/world/rss.xml",
        "nytimes_world":"http://www.nytimes.com/services/xml/rss/nyt/World.xml",
        "nytimes_us":"http://www.nytimes.com/services/xml/rss/nyt/US.xml",
        "nytimes_tech":"http://rss.nytimes.com/services/xml/rss/nyt/Technology.xml",
        "wsj_marketnews":"http://www.wsj.com/xml/rss/3_7031.xml",
        "wsj_usbusiness":"http://www.wsj.com/xml/rss/3_7014.xml",
        "dw_allnews":"http://rss.dw.de/rdf/rss-en-all",
        "nhk_social": "http://www3.nhk.or.jp/rss/news/cat1.xml",
        "nhk_politics" : "http://www3.nhk.or.jp/rss/news/cat4.xml",
        "nhk_economy":"http://www3.nhk.or.jp/rss/news/cat6.xml",
        "elpais_world":"http://ep00.epimg.net/rss/internacional/portada.xml",
        "straits_asia":"http://www.straitstimes.com/news/asia/rss.xml",
        "techcrunch":"http://feeds.feedburner.com/TechCrunch/",
        "bbc_sport":"http://feeds.bbci.co.uk/sport/0/rss.xml?edition=int"
    ]

    static let  arrayUrlCopyright : NSDictionary = ["rthk_rtnews":"http://rthk.hk/tools/rss/index_c.htm",
        "rthk_moneynews":"http://rthk.hk/tools/rss/index_c.htm",
        "ming_rtnews":"http://news.mingpao.com/cfm/rss.cfm",
        "ming_moneynews":"http://news.mingpao.com/cfm/rss.cfm",
        "ming_worldnews":"http://news.mingpao.com/cfm/rss.cfm",
        "bbc_worldnews":"http://www.bbc.com/news/10628494",
        "nytimes_world":"http://www.nytimes.com/services/xml/rss/index.html",
        "nytimes_us":"http://www.nytimes.com/services/xml/rss/index.html",
        "nytimes_tech":"http://www.nytimes.com/services/xml/rss/index.html",
        "wsj_marketnews":"http://www.wsj.com/public/page/rss_news_and_feeds.html",
        "wsj_usbusiness":"http://www.wsj.com/public/page/rss_news_and_feeds.html",
        "dw_allnews":"http://www.dw.com/en/more-dw/rss/s-31500",
        "nhk_social": "http://www3.nhk.or.jp/toppage/rss/index.html",
        "nhk_politics" : "http://www3.nhk.or.jp/toppage/rss/index.html",
        "nhk_economy":"http://www3.nhk.or.jp/toppage/rss/index.html",
        "elpais_world":"http://servicios.elpais.com/rss/",
        "straits_asia":"http://www.straitstimes.com/RSS-Feeds",
        "techcrunch":"http://feeds.feedburner.com/TechCrunch/",
        "bbc_sport":"http://www.bbc.com/sport/0/15890345"
    ]
    
    //static let UDKeyFeedSetting : String = "KeyFeedSetting"
}
*/

import UIKit
import WatchConnectivity

@available(iOS 9.0, *)
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate , WCSessionDelegate{

    var window: UIWindow?
    var session: WCSession!

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        if (WCSession.isSupported()) {
            session = WCSession.defaultSession()
            session.delegate = self;
            session.activateSession()
        }
        
        
        var userDefault: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        if (userDefault.valueForKey("InitFeedSetting")?.intValue != 1) {
            var index: Int
            for index = 0; index < GlobalVar.arrayFeedKey.count ; ++index {
                userDefault.setValue(1 , forKey: GlobalVar.arrayFeedKey[index])
            }
            userDefault.setValue(1 , forKey: "InitFeedSetting")
        }
        
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    func session(session: WCSession, didReceiveMessage message: [String : AnyObject], replyHandler: ([String : AnyObject]) -> Void) {
        
        var dictUserInfo: Dictionary = message;
        let userInfoType: String = dictUserInfo["type"] as! String
        if  userInfoType == "getUserDefault" {
            let userDefault: NSUserDefaults = NSUserDefaults.standardUserDefaults()
            
            var arrayReturn : [AnyObject] = []
            var index: Int
            for index = 0; index < GlobalVar.arrayFeedKey.count ; index += 1 {
                if   (userDefault.valueForKey(GlobalVar.arrayFeedKey[index])! as! NSObject == 1) {
                    arrayReturn.append("YES")
                } else {
                    arrayReturn.append("NO")
                }
                
            }
            let responseDictionary = ["message" : arrayReturn]
            print("responseDictionary \(responseDictionary)")
            replyHandler(responseDictionary)
        }
        
        //
        /*
        let counterValue = message["counterValue"] as? String
        
        dispatch_async(dispatch_get_main_queue()) {
            self.counterData.append(counterValue!)
            self.mainTableView.reloadData()
        }
        let replyStr : Dictionary = ["REPLY":"YES this is a reply"]
        replyHandler(replyStr)
        */
        
    }
    
    /*
    func application(application: UIApplication, handleWatchKitExtensionRequest userInfo: [NSObject : AnyObject]?, reply: (([NSObject : AnyObject]!) -> Void)!) {
        
        print("handleWatchKitExtensionRequest")
        var bgTask : UIBackgroundTaskIdentifier = application.beginBackgroundTaskWithName("MyTask", expirationHandler: { () -> Void in
            // Code ran when expirating background task
            print("BackgroundTask expirationHandler")
        })
        
        
        
        var dictUserInfo: Dictionary = userInfo!;
        let userInfoType: String = dictUserInfo["type"] as! String
        if  userInfoType == "getUserDefault" {
            let userDefault: NSUserDefaults = NSUserDefaults.standardUserDefaults()
            
            var arrayReturn : [AnyObject] = []
            var index: Int
            for index = 0; index < GlobalVar.arrayFeedKey.count ; index += 1 {
                if   (userDefault.valueForKey(GlobalVar.arrayFeedKey[index])! as! NSObject == 1) {
                    arrayReturn.append("YES")
                } else {
                    arrayReturn.append("NO")
                }
                
            }
            let responseDictionary = ["message" : arrayReturn]
            print("responseDictionary \(responseDictionary)")
            reply(responseDictionary)
        }
        
        application.endBackgroundTask(bgTask)
        
        
    }
     */
    

    /*
- (BOOL)application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity
restorationHandler:(void (^)(NSArray *restorableObjects))restorationHandler
{
// Handle Hand off activity from Apple Watch
NSLog(@"type %@ title %@" , userActivity.activityType, userActivity.title);

if ( [userActivity.activityType isEqualToString:@"com.metacreate.simplehkweather.airindex"] ){
UITabBarController *tabController = (UITabBarController*) self.window.rootViewController;
[tabController setSelectedIndex:3];
} else if ( [userActivity.activityType isEqualToString:@"com.metacreate.simplehkweather.9day"] ){
UITabBarController *tabController = (UITabBarController*) self.window.rootViewController;
[tabController setSelectedIndex:1];
} else if ( [userActivity.activityType isEqualToString:@"com.metacreate.simplehkweather.mainpage"] ){
UITabBarController *tabController = (UITabBarController*) self.window.rootViewController;
[tabController setSelectedIndex:0];
}
return YES;
}
*/
  
    ///Objective-C method 'application:continueUserActivity:restorationHandler:' 
    //provided by method 'application(_:continueUserActivity:restorationHandler:)'
    //conflicts with optional requirement method 'application(_:continueUserActivity:restorationHandler:)' 
    //in protocol 'UIApplicationDelegate'
    
    /*
    func application(application: UIApplication,
        continueUserActivity userActivity: NSUserActivity,
        restorationHandler: ([AnyObject]!) -> Void) -> Bool
    {
        // Handle Hand off activity from Apple Watch
        print( "type \(userActivity.activityType) title \(userActivity.title)")
        print( "userInfo \(userActivity.userInfo) ")
        let userInfoObject : [NSObject:AnyObject] = userActivity.userInfo!
        
        
        self.window?.rootViewController!.performSegueWithIdentifier("ShowWeb", sender: userInfoObject)
        
        return true
    }
    
     */
    
}

