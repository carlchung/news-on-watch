//
//  InterfaceController.swift
//  NewsOnWatch WatchKit Extension
//
//  Created by carladmin on 5/6/15.
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
    
    //static let UDKeyFeedSetting : String = "KeyFeedSetting"
}


import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var tableView: WKInterfaceTable!
    var enabledKey : [String] = []
    var enabledName : [String] = []
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        invalidateUserActivity()

        // Configure interface objects here.
        self.getFeedSettingFromParent()

    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        self.getFeedSettingFromParent()

    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    func getFeedSettingFromParent() {
        
        var userDefault : NSUserDefaults = NSUserDefaults.standardUserDefaults()
        let openParentDict = ["type":"getUserDefault"]
        
        WKInterfaceController.openParentApplication(openParentDict) {
            (replyDictionary, error) -> Void in
            if let castedResponseDictionary = replyDictionary as? [String: [String]]
            {
                self.enabledName.removeAll()
                self.enabledKey.removeAll()
                var responseMessage: [String] = castedResponseDictionary["message"]!
                
                var i : Int
                for i = 0 ; i < responseMessage.count; i++ {
                    let strInMessage : String = responseMessage[i]
                    if strInMessage == "YES" {
                        self.enabledKey.append(GlobalVar.arrayFeedKey[i] )
                        self.enabledName.append(GlobalVar.arrayFeedName[i])
                    }
                }
                
                self.reloadTable()
            }
        }
    }
    
        
    func reloadTable() {
        // 1
        tableView.setNumberOfRows(self.enabledKey.count, withRowType: "FeedRow")
        var i : Int 
        for i = 0; i < self.enabledKey.count ; ++i {
            
            if let row = tableView.rowControllerAtIndex(i) as? FeedRow {
                if i < self.enabledKey.count {
                    row.titleLabel?.setText( self.enabledName[i] )
                    
                }
            }
        }
        

    }
    
    override func contextForSegueWithIdentifier(segueIdentifier: String,
        inTable table: WKInterfaceTable, rowIndex: Int) -> AnyObject? {
            if segueIdentifier == "GoToStory" {
                
                //let coin = coins[rowIndex]
                return ["loadUrl":  self.enabledKey[rowIndex], "name": self.enabledName[rowIndex] ]
            }
            
            return nil
    }
    
}
