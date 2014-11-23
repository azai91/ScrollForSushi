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
        NSUserDefaults.standardUserDefaults().setObject("true", forKey: "reset")
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
        
        
        var total:String? = NSUserDefaults.standardUserDefaults().objectForKey("total") as? String
        var count1:String? = NSUserDefaults.standardUserDefaults().objectForKey("count1") as? String
        var count2:String? = NSUserDefaults.standardUserDefaults().objectForKey("count2") as? String
        var count3:String? = NSUserDefaults.standardUserDefaults().objectForKey("count3") as? String
        var count4:String? = NSUserDefaults.standardUserDefaults().objectForKey("count4") as? String
        price.setText("$\(String(total!))")
        

    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        NSLog("%@ did deactivate", self)
        super.didDeactivate()
    }
    
}
