//
//  ViewController.swift
//  NewsOnWatch
//
//  Created by carladmin on 3/6/15.
//  Copyright (c) 2015 MetaCreate / Carl Chung. All rights reserved.
//

import UIKit
 

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //tableView.backgroundColor = UIColor.blackColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GlobalVar.arrayFeedName.count
    }
    

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            
        let cell = tableView.dequeueReusableCellWithIdentifier("cellId", forIndexPath: indexPath) as! SettingTableViewCell
        
        cell.lblLeft?.text = GlobalVar.arrayFeedName[indexPath.row];
        cell.switchFeed?.tag = indexPath.row
        
        var userDefault: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        if userDefault.valueForKey(GlobalVar.arrayFeedKey[indexPath.row]) == nil {
            userDefault.setValue(0, forKey: GlobalVar.arrayFeedKey[indexPath.row])
            cell.switchFeed.setOn(false , animated: false )
        } else {
            var feed : Int = userDefault.valueForKey(GlobalVar.arrayFeedKey[indexPath.row])!.integerValue
            if feed == 1 {
                cell.switchFeed.setOn(true , animated: false )
            } else {
                cell.switchFeed.setOn(false , animated: false )
            }
        }

        
        
        return cell
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "ShowFeedDetail") {
            // pass data to next view
            let detailsViewController:DetailsViewController = segue.destinationViewController as! DetailsViewController
            
            let indexPath = self.tableView.indexPathForSelectedRow!
            let feedKey = GlobalVar.arrayFeedKey[indexPath.row]
            detailsViewController.feedName = GlobalVar.arrayFeedName[indexPath.row]
            detailsViewController.url = GlobalVar.arrayUrl.objectForKey(feedKey ) as! String
            detailsViewController.rssWebsiteUrl = GlobalVar.arrayUrlCopyright.objectForKey(feedKey ) as! String
        }
        
        if segue.identifier == "ShowWeb" {
            //segue.destinationViewController
            var urlString : String = ""
            urlString = sender["url"] as! String
            let inAppWebViewController:InAppWebViewController = segue.destinationViewController as! InAppWebViewController
            inAppWebViewController.urlString = urlString
        }
        
    }
    
    
}

