//
//  SettingTableViewCell.swift
//  NewsOnWatch
//
//  Created by carladmin on 3/6/15.
//  Copyright (c) 2015 MetaCreate / Carl Chung. All rights reserved.
//

import UIKit

class SettingTableViewCell: UITableViewCell {


    @IBOutlet weak var lblLeft: UILabel!
    @IBOutlet weak var switchFeed: UISwitch!
    
    @IBOutlet weak var btnGoDetails: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func swtichChanged(sender: AnyObject) {

        
        var userDefault: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        let thisTag :Int = self.switchFeed.tag 
        if  self.switchFeed.on  {
            userDefault.setValue(1, forKey: GlobalVar.arrayFeedKey[thisTag])
            
            print("On")
        } else {
            userDefault.setValue(0, forKey: GlobalVar.arrayFeedKey[thisTag])
            
            print("OFF")
        }
        userDefault.synchronize()
        
    }
    

    
    
}
