//
//  File.swift
//  Delivery
//
//  Created by Alexander Zai on 11/22/14.
//  Copyright (c) 2014 Alexander Zai. All rights reserved.
//

import WatchKit
import Foundation


class Confirm: WKInterfaceController {
    
    
    @IBOutlet var price: WKInterfaceLabel!
    var count1 = "";
    var count2 = "";
    var count3 = "";
    var count4 = "";
    var total = "";
    
    @IBOutlet var confirm: WKInterfaceButton!
    
    @IBAction func confirm_pressed() {
        
        var order = [count1,count2,count3,count4,total];
        NSUserDefaults.standardUserDefaults().setObject(order, forKey: "order")
        NSUserDefaults.standardUserDefaults().synchronize()
        
        confirm.setTitle("Order Placed")
        confirm.setEnabled(false)
        NSUserDefaults.standardUserDefaults().setBool(true, forKey: "reset")
        NSUserDefaults.standardUserDefaults().synchronize()
        
    }
    
    override init(context: AnyObject?) {
        // Initialize variables here.
        super.init(context: context)
                // Configure interface objects here.
        
//        price.font = UIFont(name: price.font.fontName, size: 40)
        NSLog("%@ init", self)
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        NSLog("%@ will activate", self)
        
        var shouldReset:String? = NSUserDefaults.standardUserDefaults().objectForKey("reset") as? String
        if (shouldReset != "false") {
            
            
            confirm.setEnabled(true)
            NSUserDefaults.standardUserDefaults().setObject("false", forKey: "reset")
            NSUserDefaults.standardUserDefaults().synchronize()
            
        }
        
        var total = NSUserDefaults.standardUserDefaults().integerForKey("total")
        var count1 = NSUserDefaults.standardUserDefaults().integerForKey("count1")
        var count2 = NSUserDefaults.standardUserDefaults().integerForKey("count2")
        var count3 = NSUserDefaults.standardUserDefaults().integerForKey("count3")
        var count4 = NSUserDefaults.standardUserDefaults().integerForKey("count4")
        price.setText("$\(String(total))")
        
        if (total == 0) {
            
            confirm.setEnabled(false)
            
        } else {
            
            confirm.setEnabled(true)
            
        }
        

    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        NSLog("%@ did deactivate", self)
        super.didDeactivate()
    }
    
}
