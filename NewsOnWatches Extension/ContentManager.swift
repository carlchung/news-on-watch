//
//  ContentManager.swift
//  NewsOnWatch
//
//  Created by carladmin on 8/6/15.
//  Copyright (c) 2015 MetaCreate / Carl Chung. All rights reserved.
//

import Foundation


class ContentManager {
    class var sharedInstance: ContentManager {
        struct Static {
            static var onceToken: dispatch_once_t = 0
            static var instance: ContentManager? = nil
        }
        dispatch_once(&Static.onceToken) {
            Static.instance = ContentManager()
            
        }
        return Static.instance!
    }
    
    var itemFeedName : String = ""
    var itemTitles : [String] = []
    var itemDescriptions : [String] = []
    var itemPubDateTime: [String] = []
    var itemLinks: [String] = []
    
    func clearAllItems() {
        self.itemTitles.removeAll(keepCapacity: true)
        self.itemDescriptions.removeAll(keepCapacity: true)
        self.itemPubDateTime.removeAll(keepCapacity: true)
        self.itemLinks.removeAll(keepCapacity: true)
    }
    
    func addTitle(title: String) -> Void {
        self.itemTitles.append(title)
        
    }
    
    func addDesc(desc : String) -> Void {
        self.itemDescriptions.append(desc)
        
    }
    
    func addPubDateTime(dateTime : String) -> Void {
        self.itemPubDateTime.append(dateTime)
        
    }
    func addLinks(url : String) -> Void {
        self.itemLinks.append(url)
        
    }
    func getTotalItemCount() -> NSInteger {
        if self.itemTitles.count == self.itemDescriptions.count {
            return self.itemTitles.count
        } else if self.itemTitles.count < self.itemDescriptions.count {
            return self.itemTitles.count
        } else if self.itemTitles.count > self.itemDescriptions.count {
            return self.itemDescriptions.count
        }
        return 0
    }
    
    func getPubDateTime( index: NSInteger ) -> String {
        
        if self.getTotalItemCount() <= self.itemPubDateTime.count {
            return self.itemPubDateTime[index]
        } else {
            return ""
        }
    }
    
    func saveDataForGlance() {
        if getTotalItemCount() >= 1 {
            var userDefault : NSUserDefaults = NSUserDefaults.standardUserDefaults()
            userDefault.setObject(self.itemTitles[0], forKey: "GlanceTitle")
            
            if getTotalItemCount() >= 2 {
                userDefault.setObject(self.itemTitles[1], forKey: "GlanceTitle2")
            }
            
            if getTotalItemCount() >= 3 {
                userDefault.setObject(self.itemTitles[2], forKey: "GlanceTitle3")
            }
            
            if getTotalItemCount() >= 4 {
                userDefault.setObject(self.itemTitles[3], forKey: "GlanceTitle4")
            }
            
            if getTotalItemCount() >= 5  {
                userDefault.setObject(self.itemTitles[4], forKey: "GlanceTitle5")
            }
        }
    }
}


