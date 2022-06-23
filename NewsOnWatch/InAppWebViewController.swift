//
//  InAppWebViewController.swift
//  NewsOnWatch
//
//  Created by carl on 5/7/15.
//  Copyright (c) 2015 MetaCreate / Carl Chung. All rights reserved.
//

import UIKit

class InAppWebViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var webView : UIWebView!
    @IBOutlet weak var btnClose : UIButton!
    @IBOutlet weak var activityViewIndicator: UIActivityIndicatorView!
    
    var urlString: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        var url : NSURL = NSURL(string: urlString)!
        var urlReq : NSURLRequest = NSURLRequest(URL:url  )
        self.webView.loadRequest(urlReq)
        self.activityViewIndicator.startAnimating()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func didPressClose( sender: AnyObject ) {
        self.dismissViewControllerAnimated(true, completion: {})
    }

    func webViewDidStartLoad(webView: UIWebView)
    {
        self.activityViewIndicator.startAnimating()
    }
    func webViewDidFinishLoad(webView: UIWebView)
    {
        self.activityViewIndicator.stopAnimating()
    }
    
    func webView(webView: UIWebView,
        didFailLoadWithError error: NSError?)
    {
        self.activityViewIndicator.stopAnimating()
    }
    
}
