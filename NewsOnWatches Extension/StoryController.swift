//
//  StoryController.swift
//  NewsOnWatch
//
//  Created by carladmin on 5/6/15.
//  Copyright (c) 2015 MetaCreate / Carl Chung. All rights reserved.
//

import WatchKit
import Foundation



class StoryController: WKInterfaceController , NSXMLParserDelegate{
    
    @IBOutlet weak var tableView: WKInterfaceTable!
    var urlString: String!
    var parser: NSXMLParser!
    
    var collectTitleStr : String = ""
    var collectStr : String = ""
    var triggerItem : Bool = false
    var triggerTitle : Bool = false
    var triggerDateTime: Bool = false
    var triggerLink : Bool = false
    var triggerDesc : Bool = false
    var triggerInTag : Bool = false
    
    var pageNumber : NSInteger = 0
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        print("awakeWithContext  is equal to \(context) ");
        
        // First page , need to load the url and parse XML
        if (( context?.valueForKey("loadUrl")) != nil) {
            
            var key : String = context?.valueForKey("loadUrl") as! String
            self.urlString = GlobalVar.arrayUrl.valueForKey(key) as! String
            var userDefault : NSUserDefaults = NSUserDefaults.standardUserDefaults()
            userDefault.setValue(self.urlString, forKey: "GlanceFeedUrl")
            // parser XML
            ContentManager.sharedInstance.clearAllItems()
            var url : NSURL = NSURL(string: urlString)!
            self.parser = NSXMLParser(contentsOfURL: url)
            self.parser.delegate = self
            self.parser.parse()

            
            if let name: String = context?.valueForKey("name") as? String {
                self.setTitle( name )
                ContentManager.sharedInstance.itemFeedName = name
                
                userDefault.setValue(name, forKey: "GlanceFeedName")
                
            }
            
        } else {
            
        }

        
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    

    func parser(parser: NSXMLParser,
                didStartElement elementName: String,
                                namespaceURI: String?,
                                qualifiedName qName: String?,
                                              attributes attributeDict: [String : String])
    {
        //element = elementName
        if (elementName as NSString).isEqualToString("item")
        {
            triggerItem = true
        }
        
        if ( triggerItem ) {
            if (elementName as NSString).isEqualToString("title") {
                triggerTitle = true
            } else if (elementName as NSString).isEqualToString("description") {
                triggerDesc = true
            } else if (elementName as NSString).isEqualToString("pubDate") {
                triggerDateTime = true
            } else if (elementName as NSString).isEqualToString("link") {
                triggerLink = true
            }
        }
    }
    
    func parser(parser: NSXMLParser, foundCharacters string: String?)
    {
        if triggerTitle  {
            self.collectTitleStr = self.collectTitleStr + string!
            //ContentManager.sharedInstance.addTitle(string!)
            //println("addTitle \(string)")
            
        } else if triggerDesc {
            if string == "<" {
                triggerInTag = true
            } else if string == ">" {
                triggerInTag = false 
            } else {
                if  triggerInTag == false {
                    
                    self.collectStr = self.collectStr + string!
                }
            }
        } else if triggerDateTime {
            ContentManager.sharedInstance.addPubDateTime(string!)
        } else if triggerLink {
            ContentManager.sharedInstance.addLinks(string!)
        }
    }
    
    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?)
    {
        if (elementName as NSString).isEqualToString("item")
        {
            triggerItem = false
            
            
            // this is to remove html code from string
            // this is to remove html code from string
            let stringlength = self.collectStr.characters.count
            var modString = ""
            do {
                let regex = try NSRegularExpression(pattern: "<[^>]*>", options: NSRegularExpressionOptions.CaseInsensitive)
                modString = regex.stringByReplacingMatchesInString(self.collectStr, options: NSMatchingOptions.ReportCompletion, range: NSMakeRange(0, stringlength), withTemplate: "")
                
            } catch let error as NSError {
                print(error.localizedDescription)
            }
            
            // this is to remove new line in description
            let trimmed = modString.stringByReplacingOccurrencesOfString("^\\s*",
                withString: "", options: .RegularExpressionSearch)
            ContentManager.sharedInstance.addDesc(trimmed)
            print("addDesc \(modString)")
            self.collectStr = ""
            
            ContentManager.sharedInstance.addTitle(self.collectTitleStr)
            self.collectTitleStr = ""
        }
        
        if ( triggerItem ) {
            if (elementName as NSString).isEqualToString("title"){
                triggerTitle = false
            } else if (elementName as NSString).isEqualToString("description") {
                triggerDesc = false
            } else if (elementName as NSString).isEqualToString("pubDate") {
                triggerDateTime = false
            } else if (elementName as NSString).isEqualToString("link") {
                triggerLink = false
            }
        }
    }
    
    func parserDidEndDocument(parser: NSXMLParser) {
        

        let noOfItem : NSInteger = ContentManager.sharedInstance.getTotalItemCount()
        print("parserDidEndDocument \( noOfItem )")
        
        ContentManager.sharedInstance.saveDataForGlance()
        
        self.reloadTable()
    }
    
    func reloadTable() {
        // 1
        let noOfItem : NSInteger = ContentManager.sharedInstance.getTotalItemCount()
        var titles : [String] = ContentManager.sharedInstance.itemTitles
        var descriptions : [String] = ContentManager.sharedInstance.itemDescriptions
        
        
        tableView.setNumberOfRows(noOfItem, withRowType: "ContentRow")
        var i : Int 
        for i = 0; i < noOfItem ; i += 1 { 
            
            if let row = tableView.rowControllerAtIndex(i) as? ContentRow {
                row.headerLabel.setText(titles[i])
                row.contentLabel.setText(descriptions[i ])
                row.dateTimeLabel.setText(ContentManager.sharedInstance.getPubDateTime(i))

            }
        }
        
        
    }
    
    @IBAction func didMenuRefresh() {
        
        // parser XML
        ContentManager.sharedInstance.clearAllItems()
        let url : NSURL = NSURL(string: self.urlString)!
        self.parser = NSXMLParser(contentsOfURL: url)
        self.parser.delegate = self
        self.parser.parse()
    }
    
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int)
    {
        print("didSelectRowAtIndex \(rowIndex)")
        //getFeedSettingFromParent()
        var urlString = ""
        var links : [String] = ContentManager.sharedInstance.itemLinks
        urlString = links[rowIndex]
        
        var urlObj : NSURL = NSURL(string: urlString)!
        
        var userInfoObject : [NSObject:AnyObject] = ["url":urlString]
        invalidateUserActivity();
        updateUserActivity("com.metacreate.NewsOnWatch.GoToItemUrl", userInfo:userInfoObject, webpageURL:urlObj)
        
    }
    
}