//
//  GlanceController.swift
//  NewsOnWatch WatchKit Extension
//
//  Created by carladmin on 5/6/15.
//  Copyright (c) 2015 MetaCreate / Carl Chung. All rights reserved.
//

import WatchKit
import Foundation


class GlanceController: WKInterfaceController, NSXMLParserDelegate {

    @IBOutlet weak var glanceFeedNameLabel: WKInterfaceLabel!
    @IBOutlet weak var glanceTitleLabel: WKInterfaceLabel!
    
    @IBOutlet weak var glanceTitleLabel2: WKInterfaceLabel!
    @IBOutlet weak var glanceTitleLabel3: WKInterfaceLabel!
    
    var parser: NSXMLParser!
    
    var collectTitleStr : String = ""
    
    var triggerItem : Bool = false
    var triggerTitle : Bool = false
    var titleIndex : Int = 1
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        var userDefault: NSUserDefaults  = NSUserDefaults.standardUserDefaults()
        
        if userDefault.objectForKey("GlanceTitle") != nil {
            self.glanceFeedNameLabel.setText(userDefault.valueForKey("GlanceFeedName") as? String)
            self.glanceTitleLabel.setText(userDefault.objectForKey("GlanceTitle") as? String)
            
            if userDefault.objectForKey("GlanceTitle2") != nil {
                self.glanceTitleLabel2.setText(userDefault.objectForKey("GlanceTitle2") as? String)
                
            }
            if userDefault.objectForKey("GlanceTitle3") != nil {
                self.glanceTitleLabel3.setText(userDefault.objectForKey("GlanceTitle3") as? String)
                
            }
            
        }
        
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        var userDefault: NSUserDefaults  = NSUserDefaults.standardUserDefaults()
        
        if userDefault.objectForKey("GlanceTitle") != nil {
            self.glanceFeedNameLabel.setText(userDefault.valueForKey("GlanceFeedName") as? String)
            self.glanceTitleLabel.setText(userDefault.objectForKey("GlanceTitle") as? String)
            
            if userDefault.objectForKey("GlanceTitle2") != nil {
                self.glanceTitleLabel2.setText(userDefault.objectForKey("GlanceTitle2") as? String)
                
            }
            if userDefault.objectForKey("GlanceTitle3") != nil {
                self.glanceTitleLabel3.setText(userDefault.objectForKey("GlanceTitle3") as? String)
                
            }

        }
        
        // Get most update info
        
        var urlString : String
        
        if userDefault.valueForKey("GlanceFeedUrl") != nil {
            urlString = userDefault.valueForKey("GlanceFeedUrl")  as! String
            var url : NSURL = NSURL( string: urlString )!
            self.parser = NSXMLParser(contentsOfURL: url)
            self.parser.delegate = self
            self.parser.parse()

        }
        
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
            }
        }
    }
    
    func parser(parser: NSXMLParser, foundCharacters string: String?)
    {
        if triggerTitle  {
            self.collectTitleStr = self.collectTitleStr + string!
        }
    }
    
    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?)
    {
        if (elementName as NSString).isEqualToString("item")
        {
            triggerItem = false
            
            if titleIndex == 1 {
                self.glanceTitleLabel.setText(self.collectTitleStr)
            } else if titleIndex == 2 {
                self.glanceTitleLabel2.setText(self.collectTitleStr)
            } else if titleIndex == 3 {
                self.glanceTitleLabel3.setText(self.collectTitleStr)
            }
            titleIndex++
            
            self.collectTitleStr = ""
        }
        
        if ( triggerItem ) {
            if (elementName as NSString).isEqualToString("title"){
                triggerTitle = false
            }
        }
    }
    
    func parserDidEndDocument(parser: NSXMLParser) {
        self.clearTitleLabels()
    }
    
    func clearTitleLabels() {
        if titleIndex == 2 {
            self.glanceTitleLabel2.setText("")
            self.glanceTitleLabel3.setText("")
        }
        if titleIndex == 3 {
            self.glanceTitleLabel3.setText("")
        }
    }
}
