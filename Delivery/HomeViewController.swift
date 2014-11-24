//
//  HomeViewController.swift
//  ScrollForSushi
//
//  Created by Caroline Wong on 11/22/14.
//  Copyright (c) 2014 madebycaro. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet var theResults: UILabel!
    @IBOutlet var welcomeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        var defaults: NSUserDefaults = NSUserDefaults(suiteName: "scrollforsushi")!
        
        welcomeLabel.text = defaults.objectForKey("firstName") as? String
        
//        var results = defaults.objectForKey("order") as Array<Int>
//        
//        theResults.text = "\(results)"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

