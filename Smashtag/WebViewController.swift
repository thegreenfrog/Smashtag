//
//  WebViewController.swift
//  Smashtag
//
//  Created by Chris Lu on 10/9/15.
//  Copyright © 2015 Stanford University. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {

    @IBOutlet weak var webDisplay: UIWebView!
    
    var webURL: NSURL!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let request = NSURLRequest(URL: webURL)
        webDisplay.loadRequest(request)
        // Do any additional setup after loading the view.
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

}
