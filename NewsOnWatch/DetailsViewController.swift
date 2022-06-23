//
//  DetailsViewController.swift
//  NewsOnWatch
//
//  Created by carl on 4/7/15.
//  Copyright (c) 2015 MetaCreate / Carl Chung. All rights reserved.
//

import Foundation

import UIKit


class DetailsViewController: UIViewController {
    @IBOutlet weak var btnClose : UIBarButtonItem!
    
    
    @IBOutlet weak var textField : UITextView!
    
    @IBOutlet weak var navBarTitle : UINavigationItem!
    
    @IBOutlet weak var btnGoWebsite : UIButton!
    
    var url : String = ""
    var feedName : String = ""
    var rssWebsiteUrl : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        textField.text = self.url
        navBarTitle.title = self.feedName
        
        self.btnGoWebsite.setTitle("前往" + feedName + " RSS 網站", forState: btnGoWebsite.state )
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressCancel() {
        self.dismissViewControllerAnimated(true, completion: {})
    }
    
    @IBAction func didPressGoWebsite(sender: AnyObject) {
        var urlObj : NSURL =  NSURL(string:rssWebsiteUrl )!
        //println("didPressGoWebsite")
        UIApplication.sharedApplication().openURL(urlObj)
    }
    
}
